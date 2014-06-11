package com.adopta.bean.page;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.adopta.entity.AssessmentRank;
import com.adopta.entity.Complexity;
import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LOToLOLink;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.LearningObject;
import com.adopta.entity.Page;
import com.adopta.entity.PageToLearningObject;
import com.adopta.entity.PageToPageLink;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPageToLearningObject;
import com.adopta.entity.VisitedPath;
import com.adopta.entity.WorkingPathPage;
import com.adopta.service.LearningObjectService;
import com.adopta.type.LearningObjectType;
import com.adopta.type.LinkType;
import com.adopta.type.PageType;
import com.adopta.type.Status;

@Stateless
public class ContentPageHandler implements ContentPageHandlerLocal {
	
	@EJB(mappedName="LearningObjectServiceBean/local")
	private LearningObjectService learningObjectService;
	
	public Set<VisitedPageToLearningObject> findSuitableLOs(Set<PageToLearningObject> pageToLearningObjects, CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio) {
		Set<VisitedPageToLearningObject> suitableLOs = new HashSet<VisitedPageToLearningObject>();
		List<LearningObject> allLOs = new ArrayList<LearningObject>();
		
		// Find all active learning object and its referencing children recursively
		if (pageToLearningObjects != null) {
			for (PageToLearningObject pageToLO : pageToLearningObjects) {
				filterLearningObjects(pageToLO.getLearningObject(), allLOs);
			}
		}
		
		// Find learners score 
		float score = 0;
		Set<VisitedPath> visitedPaths = learnerCoursePortfolio.getVisitedPaths();
		if (visitedPaths != null && !visitedPaths.isEmpty()) {
			for (VisitedPath visitedPath : visitedPaths) {
				score += visitedPath.getScore();
			}
			score = score / visitedPaths.size();
		}
		
		// Filter only suitable LOs
		int position = 1;
		for (LearningObject lo : allLOs) {
			if (isSuitable(lo.getComplexity(), score, coursePortfolio.getAssessmentRanks())) {
				VisitedPageToLearningObject visitedPageToLO = new VisitedPageToLearningObject();
				visitedPageToLO.setLearningObject(lo);
				visitedPageToLO.setPosition(position++);
				suitableLOs.add(visitedPageToLO);
			}
		}

		return suitableLOs;
	}
	
	/**
	 * 
	 * @param currentLO
	 * @param filteredLearningObjects
	 */
	private void filterLearningObjects(LearningObject currentLO, List<LearningObject> filteredLearningObjects) {
		if (currentLO.getStatus().getId() == Status.INACTIVE.id 
				|| currentLO.getType().getId() == LearningObjectType.TEST_QUESTION.id
				|| currentLO.getType().getId() == LearningObjectType.MANDATORY_TEST_QUESTION.id) {
			return;
		}
		
		// Add the current learning object to the filtered ones
		//
		filteredLearningObjects.add(currentLO);
		
		// Process its children connected with has-a links
		//
		if (currentLO.getLinksToChilds() == null || currentLO.getLinksToChilds().isEmpty()) {
			return;
		}
		for (LOToLOLink linkToChild : currentLO.getLinksToChilds()) {
			if (linkToChild.getType().getId() == LinkType.BY_REFERENCE.id) {
				// Process the child
				filterLearningObjects(learningObjectService.findLearningObject(linkToChild.getLoChildId()), filteredLearningObjects);
			}
		}
	}
	
	private boolean isSuitable(Complexity complexity, float score, Set<AssessmentRank> assessmentRanks) {
		if (assessmentRanks == null || assessmentRanks.isEmpty()) {
			return true;
		}
		
		for (AssessmentRank assessmentRank : assessmentRanks) {
			// Find the correct interval so that score belongs to [rank from, rank to]
			if (assessmentRank.getFrom() <= score && score <= assessmentRank.getTo()) {
				for (Complexity rankComplexity : assessmentRank.getComplexities()) {
					if (rankComplexity.getLevel() == complexity.getLevel()) {
						return true;
					}
				}
			}
		}
		
		return false;
	}
	
	public Long readLastPageSelectedPath(Set<VisitedPage> visitedPages) {	
		if (visitedPages == null) {
			// No previous pages found
			return null;
		}
		
		List<VisitedPage> filterredPages = new ArrayList<VisitedPage>();
		
		// Filter pages that are part only of the current path and which are part of a preselected path
		for (VisitedPage visitedPage : visitedPages) {
			if (visitedPage.getVisitedPathId() == null /*part of the current path*/
					&& visitedPage.getSelectedPath() != null /*part of a preselected path*/) {
				filterredPages.add(visitedPage);
			}
		}
		
		// Find the last page
		Collections.sort(filterredPages);
		return filterredPages.isEmpty() ? null : filterredPages.get(0).getId();
	}
	
	public void preparePageLinks(VisitedPage visitedPage, int pageIndex) {
		// Find next/previous pages
		if (visitedPage.getSelectedPath() != null) {
			List<WorkingPathPage> pathPages = new ArrayList<WorkingPathPage>(visitedPage.getSelectedPath().getWorkingPathPages());
			Collections.sort(pathPages);
			
			// Find next
			for (int i = 0; i < pathPages.size(); i++) {
				WorkingPathPage currentPage = pathPages.get(i);
				if (currentPage.getPageIndex() > pageIndex && currentPage.getPage().getStatus().getId() == Status.ACTIVE.id) {
					visitedPage.setNextPage(currentPage.getPage());
					break;
				}
			}
			
			// Find previous
			for (int i = pathPages.size()-1; i >= 0; i--) {
				WorkingPathPage currentPage = pathPages.get(i);
				if (currentPage.getPageIndex() < pageIndex && currentPage.getPage().getStatus().getId() == Status.ACTIVE.id
						&& currentPage.getPage().getType().getId() != PageType.CONTROL.id /*can't go back to a control page*/) {
					visitedPage.setPreviousPage(currentPage.getPage());
					break;
				}
			}
		}
		
		// Filter links to next pages
		visitedPage.setLinksToNextPages(new HashSet<PageToPageLink>());
		Long nextPageId = (visitedPage.getNextPage() != null) ? visitedPage.getNextPage().getId() : null; 
		filterLinksToNextPages(nextPageId, visitedPage.getPage().getLinksToNextPages(), visitedPage);

		// Filter links to previous pages
		visitedPage.setLinksToPreviousPages(new HashSet<PageToPageLink>());
		Long previousPageId = (visitedPage.getPreviousPage() != null) ? visitedPage.getPreviousPage().getId() : null; 
		filterLinksToPreviousPages(previousPageId, visitedPage.getPage().getLinksToPreviousPages(), visitedPage);
	}
	
	private void filterLinksToNextPages(Long nextChosenPageId, Set<PageToPageLink> linksToNextPages, VisitedPage visitedPage) {
		if (linksToNextPages == null || linksToNextPages.isEmpty()) {
			return;
		}
		
		for (PageToPageLink linkToNextPage : linksToNextPages) {
			Page nextPage = linkToNextPage.getNextPage();
			
			if (nextChosenPageId != null && nextPage.getId() == nextChosenPageId.longValue()) {
				// This page has already been chosen as part of the selected path
				continue;
			}
			
			if (nextPage.getStatus().getId() == Status.ACTIVE.id) {
				visitedPage.getLinksToNextPages().add(linkToNextPage);
			} else {
				filterLinksToNextPages(nextChosenPageId, nextPage.getLinksToNextPages(), visitedPage);
			}
		}
	}
	
	private void filterLinksToPreviousPages(Long previousChosenPageId, Set<PageToPageLink> linksToPreviousPages, VisitedPage visitedPage) {
		if (linksToPreviousPages == null || linksToPreviousPages.isEmpty()) {
			return;
		}
		
		for (PageToPageLink linkToPreviousPage : linksToPreviousPages) {
			Page previousPage = linkToPreviousPage.getPreviousPage();
			
			if (previousChosenPageId != null && previousPage.getId() == previousChosenPageId.longValue()) {
				// This page has already been chosen as part of the selected path
				continue;
			}
			
			if (previousPage.getType().getId() == PageType.CONTROL.id) {
				// One can not navigate back to a control page
				continue;
			}
			
			if (previousPage.getStatus().getId() == Status.ACTIVE.id) {
				visitedPage.getLinksToPreviousPages().add(linkToPreviousPage);
			} else {
				filterLinksToNextPages(previousChosenPageId, previousPage.getLinksToPreviousPages(), visitedPage);
			}
		}
	}
}
