package com.adopta.bean.page;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LOToLOLink;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.LearningObject;
import com.adopta.entity.PageToLearningObject;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPageToLearningObject;
import com.adopta.service.LearningObjectService;
import com.adopta.type.LearningObjectType;
import com.adopta.type.LinkType;
import com.adopta.type.Status;

@Stateless
public class ControlPageHandler implements ControlPageHandlerLocal {
	
	@EJB(mappedName="LearningObjectServiceBean/local")
	private LearningObjectService learningObjectService;
	
	@Override
	public Set<VisitedPageToLearningObject> findSuitableLOs(Set<PageToLearningObject> pageToLearningObjects, CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio) {
		Set<VisitedPageToLearningObject> suitableLOs = new HashSet<VisitedPageToLearningObject>();
		
		// Find all viewed learning objects from the current path. 
		// Note that each object may have been viewed more than once. That is why a map is used.
		Map<Long, LearningObject> viewedLOs = new HashMap<Long, LearningObject>();
		if (learnerCoursePortfolio.getVisitedPages() != null) {
			for (VisitedPage visitedPage : learnerCoursePortfolio.getVisitedPages()) {
				if (visitedPage.getVisitedPathId() != null) {
					// This page is not part of the current path
					continue;
				}
				
				for (VisitedPageToLearningObject visitedPageToLo : visitedPage.getVisitedPageToLearningObjects()) {
					viewedLOs.put(visitedPageToLo.getLearningObject().getId(), visitedPageToLo.getLearningObject());
				}
			}
		}
		
		int position = 1;
		
		// Find active test questions
		for (LearningObject question : findActiveQuestions(new ArrayList<LearningObject>(viewedLOs.values()))) {
			if (position >= coursePortfolio.getNumberOfQuestions()) {
				// Maximum number of questions reached.
				break;
			}
			
			VisitedPageToLearningObject visitedPageToLO = new VisitedPageToLearningObject();
			visitedPageToLO.setLearningObject(question);
			visitedPageToLO.setPosition(position++);
			suitableLOs.add(visitedPageToLO);
		}
		
		// Find active mandatory test questions
		for (LearningObject mandatoryQuestion : learningObjectService.findActiveMandatoryQuestions()) {			
			VisitedPageToLearningObject visitedPageToLO = new VisitedPageToLearningObject();
			visitedPageToLO.setLearningObject(mandatoryQuestion);
			visitedPageToLO.setPosition(position++);
			suitableLOs.add(visitedPageToLO);
		}
		
		return suitableLOs;
	}

	private List<LearningObject> findActiveQuestions(List<LearningObject> viewedLOs) {
		List<LearningObject> activeQuestions = new ArrayList<LearningObject>();
		
		// For each learning object find its referencing active children of type TEST_QUESTION
		for (LearningObject lo : viewedLOs) {
			if (lo.getLinksToChilds() == null || lo.getLinksToChilds().isEmpty()) {
				// This learning object does not have any children
				continue;
			}
			
			for (LOToLOLink linkToChild : lo.getLinksToChilds()) {
				if (linkToChild.getType().getId() != LinkType.BY_REFERENCE.id) {
					// Not a link by reference
					continue;
				}
				
				LearningObject childLO = learningObjectService.findLearningObject(linkToChild.getLoChildId());
				
				if (childLO.getStatus().getId() == Status.INACTIVE.id 
						|| childLO.getType().getId() != LearningObjectType.TEST_QUESTION.id) {
					// Inactive child or child of type different from TEST_QUESTION
					continue;
				}
				
				activeQuestions.add(childLO);
			}
		}
		
		return activeQuestions;
	}

	@Override
	public void preparePageLinks(VisitedPage visitedPage, int pageIndex) {
		// No links should be added to a control page
	}

	@Override
	public Long readLastPageSelectedPath(Set<VisitedPage> visitedPages) {
		// No need to navigate back to the last page of the current selected path
		return null;
	}

}
