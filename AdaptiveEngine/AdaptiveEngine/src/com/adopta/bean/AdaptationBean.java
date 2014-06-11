package com.adopta.bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import net.java.dev.eval.Expression;

import com.adopta.bean.page.PageHandler;
import com.adopta.bean.page.PageHandlerFactoryLocal;
import com.adopta.bean.util.ApplicationProperties;
import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.LearnerStyle;
import com.adopta.entity.LearningObject;
import com.adopta.entity.Page;
import com.adopta.entity.PageToPageLink;
import com.adopta.entity.QuestionAnswer;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPageToLearningObject;
import com.adopta.entity.VisitedPath;
import com.adopta.entity.WorkingPath;
import com.adopta.entity.WorkingPathPage;
import com.adopta.entity.WorkingPathStyle;
import com.adopta.service.CourseService;
import com.adopta.service.LearnerService;
import com.adopta.type.LearningObjectType;
import com.adopta.type.PageType;

@Stateless
public class AdaptationBean implements AdaptationLocal {
	@EJB(mappedName="CourseServiceBean/local")
	private CourseService courseService;
	
	@EJB(mappedName="LearnerServiceBean/local")
	private LearnerService learnerService;
	
	@EJB
	private PageHandlerFactoryLocal pageHandlerFactory;
	
	// A page used to show the results of the test to the user
	private static final VisitedPage RESULT_PAGE = createResultPage();
	
	public VisitedPage startCourse(long learnerId, long courseId) {
		LearnerCoursePortfolio learnerCoursePortfolio = learnerService.findLearnerCoursePortfolio(learnerId, courseId);

		// Read the last page of the current path
		//
		VisitedPage lastPage = readLastPageCurrentPath(learnerCoursePortfolio.getVisitedPages());
		if (lastPage != null) {
			return prepareOldPage(lastPage, learnerCoursePortfolio.getVisitedPages());
		}
		
		// No current path found. Read the last visited path...
		//
		Set<VisitedPath> visitedPaths = learnerCoursePortfolio.getVisitedPaths();
		if (visitedPaths != null && !visitedPaths.isEmpty()) {
			List<VisitedPath> visitedPathList = new ArrayList<VisitedPath>(visitedPaths);
			Collections.sort(visitedPathList);
			VisitedPath lastPath = visitedPathList.get(0);
			// ... and return the result page
			RESULT_PAGE.setScore(lastPath.getScore());
			return RESULT_PAGE;
		}
		
		// No current path. No path visited. This is the beginning of a new course.
		//
		return startNewPath(learnerCoursePortfolio, null /*no last page*/, 1 /*first visited page*/);
	}
	
	public VisitedPage continueCourse(long learnerId, long courseId) {
		LearnerCoursePortfolio learnerCoursePortfolio = learnerService.findLearnerCoursePortfolio(learnerId, courseId);
		
		// Read the last visited path
		//
		Set<VisitedPath> visitedPaths = learnerCoursePortfolio.getVisitedPaths();
		if (visitedPaths == null || visitedPaths.isEmpty()) {
			return null;
		}
		List<VisitedPath> visitedPathList = new ArrayList<VisitedPath>(visitedPaths);
		Collections.sort(visitedPathList);
		VisitedPath lastPath = visitedPathList.get(0);

		// Read the last page of the last visited path
		//
		Set<VisitedPage> visitedPages = lastPath.getVisitedPages();
		if (visitedPages == null || visitedPages.isEmpty()) {
			return null;
		}
		List<VisitedPage> visitedPagesList = new ArrayList<VisitedPage>(visitedPages);
		Collections.sort(visitedPagesList);
		VisitedPage lastPage = visitedPagesList.get(0);
		int lastVisitingOrder = lastPage.getVisitingOrder();
		
		// Decide whether to continue or return
		//
		float threshold = (lastPage.getPage().getThreshold() == null) ? 0 : lastPage.getPage().getThreshold();
		if (lastPath.getScore() == null || (threshold > lastPath.getScore())) {
			// Go back to the last control point
			VisitedPage firstPage = visitedPagesList.get(visitedPagesList.size() - 1);
			// If the found page is not a control point then start the course over.
			lastPage = (firstPage.getPage().getType().getId() != PageType.CONTROL.id) ? null : firstPage;
		}
		
		return startNewPath(learnerCoursePortfolio, lastPage, lastVisitingOrder + 1);
	}
	
	private static VisitedPage createResultPage() {
		VisitedPage resultPage = new VisitedPage();
		resultPage.setPage(new Page());
		resultPage.getPage().setType(new com.adopta.entity.PageType());
		resultPage.getPage().getType().setId(PageType.RESULT.id);
		return resultPage;
	}

	public VisitedPage navigateToPage(VisitedPage currentPage, long nextPageId) {
		LearnerCoursePortfolio learnerCoursePortfolio = learnerService.findLearnerCoursePortfolio(currentPage.getLearnerCoursePortfolioId());
		
		// Navigate to the next/previous page from the selected path
		//
		if ((currentPage.getNextPage() != null && currentPage.getNextPage().getId() == nextPageId)
				|| (currentPage.getPreviousPage() != null && currentPage.getPreviousPage().getId() == nextPageId)) {
			// Find the analogous path page
			WorkingPathPage selectedPathPage = null;
			for (WorkingPathPage pathPage : currentPage.getSelectedPath().getWorkingPathPages()) {
				if (pathPage.getPage().getId() == nextPageId) {
					selectedPathPage = pathPage;
					break;
				}
			}
			if (selectedPathPage != null) {
				// Prepare the page and return it
				return preparePage(selectedPathPage.getPage(), selectedPathPage, 
					courseService.findCoursePortfolio(learnerCoursePortfolio.getCourse().getId()),
					learnerCoursePortfolio, currentPage.getVisitingOrder() + 1);
			}
		}
		
		// Navigate to the last page from the current path that is part of a selected path
		//
		if (currentPage.getLastVisitedPageFromSelectedPathId() != null && currentPage.getLastVisitedPageFromSelectedPathId() == nextPageId) {
			VisitedPage lastPageSelectedPath = readLastPageSelectedPath(learnerCoursePortfolio.getVisitedPages());
			// Find the analogous path page
			WorkingPathPage selectedPathPage = null;
			for (WorkingPathPage pathPage : lastPageSelectedPath.getSelectedPath().getWorkingPathPages()) {
				if (pathPage.getPage().getId() == lastPageSelectedPath.getPage().getId()) {
					selectedPathPage = pathPage;
					break;
				}
			}
			if (selectedPathPage != null) {
				// Prepare the page and return it
				return preparePage(selectedPathPage.getPage(), selectedPathPage, 
						courseService.findCoursePortfolio(learnerCoursePortfolio.getCourse().getId()),
						learnerCoursePortfolio, currentPage.getVisitingOrder() + 1);
			}
			
		}
		
		// Navigate to another page not part of the selected path
		//
		Long selectedPageId = null;
		if (currentPage.getLinksToNextPages() != null) {
			// Look for outgoing links
			for (PageToPageLink nextPageLink : currentPage.getLinksToNextPages()) {
				if (nextPageLink.getNextPageId() == nextPageId) {
					selectedPageId = nextPageLink.getNextPageId();
					break;
				}
			}
		}
		if (selectedPageId == null && currentPage.getLinksToPreviousPages() != null) {
			// Look for incoming links
			for (PageToPageLink previousPageLink : currentPage.getLinksToPreviousPages()) {
				if (previousPageLink.getPreviousPageId() == nextPageId) {
					selectedPageId = previousPageLink.getPreviousPageId();
					break;
				}
			}
		}
		if (selectedPageId != null) {
			// Prepare the page and return it
			return preparePage(courseService.findPage(selectedPageId), null, 
					courseService.findCoursePortfolio(learnerCoursePortfolio.getCourse().getId()),
					learnerCoursePortfolio, currentPage.getVisitingOrder() + 1);
		}
		
		return null;
	}
	
	public VisitedPage submitAnswers(VisitedPage controlPage, Map<Long, List<Long>> selectedAnswers) {
		// Calculate the result from the test questions
		//
		// Extract test question answers
		Map<Long, Map<Long, Float>> testAnswers = extractAnswers(controlPage.getVisitedPageToLearningObjects(), LearningObjectType.TEST_QUESTION);
		// Calculate score
		Float score = calculatePercentage(testAnswers, selectedAnswers);
		
		// Calculate the result from the mandatory test questions
		//
		// Extract mandatory test question answers
		Map<Long, Map<Long, Float>> mandatoryTestAnswers = extractAnswers(controlPage.getVisitedPageToLearningObjects(), LearningObjectType.MANDATORY_TEST_QUESTION);
		// Calculate satisfaction
		Float satisfaction = calculatePercentage(mandatoryTestAnswers, selectedAnswers);
		
		LearnerCoursePortfolio learnerCoursePorfolio = learnerService.findLearnerCoursePortfolio(controlPage.getLearnerCoursePortfolioId());
		List<VisitedPage> visitedPages = readPagesCurrentPath(learnerCoursePorfolio.getVisitedPages());
		
		// Update the path weight
		//
		// Calculate the path based on the visited pages
		WorkingPath path = findWorkingPath(visitedPages, learnerCoursePorfolio.getCourse().getId());
		// Update the weight
		float scorefloat = score == null ? 0 : score.floatValue();
		updatePathWeights(path.getWorkingPathStyles(), learnerCoursePorfolio.getLearner().getLearnerStyles(), scorefloat);
		
		// Store the visited path in the history
		//
		VisitedPath visitedPath = new VisitedPath();
		visitedPath.setLearnerCoursePortfolioId(learnerCoursePorfolio.getId());
		visitedPath.setPathId(path.getId());
		visitedPath.setSatisfaction(satisfaction);
		visitedPath.setScore(scorefloat);
		// Find the last visited path
		List<VisitedPath> visitedPaths = new ArrayList<VisitedPath>(learnerCoursePorfolio.getVisitedPaths());
		if (visitedPaths == null || visitedPaths.isEmpty()) {
			visitedPath.setVisitingOrder(0);
		} else {
			Collections.sort(visitedPaths);
			visitedPath.setVisitingOrder(visitedPaths.get(0).getVisitingOrder() + 1);
		}
		learnerService.addVisitedPath(visitedPath, visitedPages);
		
		// Return a page with the result
		RESULT_PAGE.setScore(score);
		RESULT_PAGE.getPage().setTitle(controlPage.getPage().getTitle());
		
		return RESULT_PAGE;
	}
	
	private VisitedPage startNewPath(LearnerCoursePortfolio learnerCoursePortfolio, VisitedPage startControlPage, int visitingOrder) {
		CoursePortfolio coursePortfolio = courseService.findCoursePortfolio(learnerCoursePortfolio.getCourse().getId());
		
		// Prepare a page for viewing
		Long startControlPageId = (startControlPage == null) ? null : startControlPage.getPage().getId();
		WorkingPathPage pathPage = findFirstPage(coursePortfolio, learnerCoursePortfolio, startControlPageId);
		if (pathPage == null) {
			return null;
		}
		Page page = pathPage.getPage();
		
		// If automatic path selection is turned off no path should be selected
		pathPage = (coursePortfolio.getAutomaticPathSelection()) ? pathPage : null;
		
		// Save the start control point as the first page from the path
		if (startControlPage != null) {
			saveAsFirstPathPage(startControlPage, pathPage, visitingOrder);
		}
		
		// Prepare the page for viewing
		return preparePage(page, pathPage, coursePortfolio, learnerCoursePortfolio, visitingOrder);
	}

	private VisitedPage preparePage(Page page, WorkingPathPage pathPage, CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio, int visitingOrder) {
		// Create the visited page
		VisitedPage visitedPage = new VisitedPage();
		visitedPage.setLearnerCoursePortfolioId(learnerCoursePortfolio.getId());
		visitedPage.setPage(page);
		visitedPage.setSelectedPath((pathPage != null) ? learnerService.findWorkingPath(pathPage.getWorkingPathId()) : null);
		visitedPage.setVisitingOrder(visitingOrder);
		
		// Create the proper page handler
		PageHandler pageHandler = pageHandlerFactory.createPageHandler(page.getType().getId());
		
		// Fill in the learning objects suitable for the learner
		visitedPage.setVisitedPageToLearningObjects(pageHandler.findSuitableLOs(page.getPageToLearningObjects(), coursePortfolio, learnerCoursePortfolio));
		
		// Save the viewed page
		visitedPage = learnerService.addVisitedPage(visitedPage);
		
		// Filter links to inactive pages
		int pageIndex = (pathPage != null) ? pathPage.getPageIndex() : -1;
		pageHandler.preparePageLinks(visitedPage, pageIndex);
		
		// Initialize the link to the last page from the current path that belongs to a selected path
		if (visitedPage.getSelectedPath() == null) {
			visitedPage.setLastVisitedPageFromSelectedPathId(pageHandler.readLastPageSelectedPath(learnerCoursePortfolio.getVisitedPages()));
		}
		
		return visitedPage;
	}

	private VisitedPage prepareOldPage(VisitedPage lastPage, Set<VisitedPage> visitedPages) {
		int pageIndex = -1;
		
		// Create the proper page handler
		PageHandler pageHandler = pageHandlerFactory.createPageHandler(lastPage.getPage().getType().getId());
		
		if (lastPage.getSelectedPath() != null) {
			// Find the index of the page
			Page page = lastPage.getPage();
			for (WorkingPathPage pathPage : lastPage.getSelectedPath().getWorkingPathPages()) {
				if (pathPage.getPage().getId() == page.getId()) {
					pageIndex = pathPage.getPageIndex();
					break;
				}
			}
		} else {
			// Set the id of the last visited page that is part of a selected path
			lastPage.setLastVisitedPageFromSelectedPathId(pageHandler.readLastPageSelectedPath(visitedPages));
		}
		
		// Filter links to inactive pages
		pageHandler.preparePageLinks(lastPage, pageIndex);
		
		return lastPage;
	}

	private WorkingPathPage findFirstPage(CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio, Long startControlPageId) {
		// Select a working path
		//
		WorkingPath workingPath = selectWorkingPath(coursePortfolio, learnerCoursePortfolio, startControlPageId);
		
		if (workingPath == null || workingPath.getWorkingPathPages() == null || workingPath.getWorkingPathPages().isEmpty()) {
			return null;
		}
		
		// Get the first page from the working path
		//
		List<WorkingPathPage> pathPages = new ArrayList<WorkingPathPage>(workingPath.getWorkingPathPages());
		Collections.sort(pathPages);
		
		if (startControlPageId == null) {
			// Starting of a new course 
			return pathPages.get(0);
		} else {
			// Starting of a new path. Skip the starting control page
			return pathPages.get(1);
		}
	}

	private WorkingPath selectWorkingPath(CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio, Long startControlPageId) {
		WorkingPath selectedWorkingPath = null;
		
		Set<WorkingPath> workingPaths = coursePortfolio.getCourse().getWorkingPaths();
		
		if (workingPaths == null || workingPaths.isEmpty()) {
			return null;
		}
		
		// Exclude paths not starting with startPage
		workingPaths = filterByStartPage(workingPaths, startControlPageId);
		
		if (!coursePortfolio.getAddVisitedPaths()) {
			// Exclude already visited paths
			Set<WorkingPath> filteredVisitedPaths = filterVisitedPaths(workingPaths, learnerCoursePortfolio.getVisitedPaths());
			// Do not filter visited paths if there are no non-visited.
			if (!filteredVisitedPaths.isEmpty()) {
				workingPaths = filteredVisitedPaths;
			}
		}
		
		// Choose the best working path
		double selectedPathWeight = Double.MIN_VALUE;
		for (WorkingPath workingPath : workingPaths) {
			if (!coursePortfolio.getAutomaticPathSelection()) {
				// Automatic path selection is turned off... return a random path
				return workingPath;
			}
			
			long numberOfLearnersPassed = learnerService.countLearners(workingPath.getId());
			double pathWeight = calculatePathWeight(workingPath.getWorkingPathStyles(), learnerCoursePortfolio.getLearner().getLearnerStyles(), numberOfLearnersPassed);
			if (pathWeight >= selectedPathWeight) {
				selectedPathWeight = pathWeight;
				selectedWorkingPath = workingPath;
			}
		}
	
		return selectedWorkingPath;
	}

	private void updatePathWeights(Set<WorkingPathStyle> pathStyles, Set<LearnerStyle> learnerStyles, float score) {
		String updateFormula = ApplicationProperties.getProperty(ApplicationProperties.UPDATE_PATH_FORMULA);
		
		Expression exp = new Expression(updateFormula);
		
		for (WorkingPathStyle pathStyle : pathStyles) {
			BigDecimal learnerStyle = new BigDecimal(getLearnerStylePercentage(pathStyle.getStyle().getId(), learnerStyles));
			
			Map<String, BigDecimal> variables = new HashMap<String, BigDecimal>();
			variables.put(ApplicationProperties.PATH_FORMULA_PATH_WEIGHT_VAR, new BigDecimal(pathStyle.getWeight()));
			variables.put(ApplicationProperties.UPDATE_PATH_FORMULA_LEARNER_RESULT_VAR, new BigDecimal(score));
			variables.put(ApplicationProperties.PATH_FORMULA_LEARNER_STYLE_VAR, learnerStyle);
			
			pathStyle.setWeight(exp.eval(variables).floatValue());
		}
		
		learnerService.updateWorkingPathWeights(pathStyles);
	}

	private float getLearnerStylePercentage(long styleId, Set<LearnerStyle> learnerStyles) {
		for (LearnerStyle learnerStyle : learnerStyles) {
			if (learnerStyle.getStyle().getId() == styleId) {
				return learnerStyle.getPercentage();
			}
		}
		
		return 0;
	}

	private WorkingPath findWorkingPath(List<VisitedPage> visitedPages, long courseId) {		
		// The pages are presented like a graph where each node is a page 
		// and each link represents the action of navigating between the pages.
		// Moreover all working paths could not have cycles. Based on these two facts
		// the path formed by the visited pages can have a cycle only in two cases:
		// if the viewer has returned to a previously selected path or 
		// if the viewer has navigated to a parent link. In both cases the pages 
		// that have been viewed between the point of leaving the path and returning back to it
		// can be ignored
		List<VisitedPage> filteredPages = removeCycles(visitedPages);
		
		// Find matching working paths
		List<WorkingPath> allWPs = learnerService.findCourseWorkingPaths(courseId);
		WorkingPath matchingWP = null;
		// Check each working path
		for (WorkingPath workingPath : allWPs) {
			// Get the working path pages order by their index
			List<WorkingPathPage> pathPages = new ArrayList<WorkingPathPage>(workingPath.getWorkingPathPages());
			if (pathPages == null || pathPages.isEmpty() || pathPages.size() != filteredPages.size()) {
				continue;
			}
			Collections.sort(pathPages);
			
			// Match the pages to the visited pages. Note that both collections will have equal sizes
			boolean isPathMatching = true;
			for (int i = 0; i < filteredPages.size(); i++) {
				if (pathPages.get(i).getPage().getId() != filteredPages.get(i).getPage().getId()) {
					// This path does not match
					isPathMatching = false;
					break;
				}
			}
			
			if (isPathMatching) {
				matchingWP = workingPath;
				break;
			}
		}
		
		return matchingWP;
	}

	private List<VisitedPage> removeCycles(List<VisitedPage> visitedPages) {
		List<VisitedPage> filteredPages = new ArrayList<VisitedPage>();
		
		Collections.sort(visitedPages, new Comparator<VisitedPage>() {

			@Override
			public int compare(VisitedPage o1, VisitedPage o2) {
				if (o1.getVisitingOrder() > o2.getVisitingOrder()) {
					return 1;
				} else if (o1.getVisitingOrder()  < o2.getVisitingOrder()) {
					return -1;
				} else {
					return 0;
				}
			}
			
		});
		
		for (VisitedPage visitedPage : visitedPages) {
			addIfNotPresent(filteredPages, visitedPage);
		}
		
		return filteredPages;
	}

	private void addIfNotPresent(List<VisitedPage> filteredPages, VisitedPage visitedPage) {
		// Check if the given page has been already added
		Integer firstOccurrenceIndex = null;
		for (int i = 0; i < filteredPages.size(); i++) {
			VisitedPage page = filteredPages.get(i);
			if (page.getPage().getId() == visitedPage.getPage().getId()) {
				firstOccurrenceIndex = i;
				break;
			}
		}
		
		if (firstOccurrenceIndex != null) {
			// The page has already been added. Remove all the pages after that one.
			for (int i = firstOccurrenceIndex + 1; i < filteredPages.size(); i++) {
				filteredPages.remove(i);
			}
		} else {
			// The page is not present in the list. Just add it.
			filteredPages.add(visitedPage);
		}
	}

	private List<VisitedPage> readPagesCurrentPath(Set<VisitedPage> visitedPages) {
		List<VisitedPage> currentPathPages = new ArrayList<VisitedPage>();
		
		if (visitedPages == null || visitedPages.isEmpty()) {
			return currentPathPages;
		}
		
		// Find the pages that belongs to the current (incomplete) path, 
		// i.e. it does not belong to a visited path yet
		for (VisitedPage visitedPage : visitedPages) {
			if (visitedPage.getVisitedPathId() == null) {
				currentPathPages.add(visitedPage);
			}
		}
		
		return currentPathPages;
	}

	private Float calculatePercentage(Map<Long, Map<Long, Float>> allAnswers, Map<Long, List<Long>> selectedAnswers) {
		// Calculate the total of all answers
		float totalPoints = 0;
		for (Map<Long, Float> questionAnswers : allAnswers.values()) {
			for (Float points : questionAnswers.values()) {
				if (points > 0) {
					totalPoints += points;
				}
			}
		}
		
		// Calculate points from the selected answers
		float earnedPoints = 0;
		for (Map.Entry<Long, List<Long>> questionAnswers : selectedAnswers.entrySet()) {
			Long questionId = questionAnswers.getKey();
			Map<Long, Float> allQuestionAnswers = allAnswers.get(questionId);
			if (allQuestionAnswers == null || questionAnswers.getValue() == null) {
				// No answers for this question. Continue with the others...
				continue;
			}
			
			for (Long answerId : questionAnswers.getValue()) {
				if (allQuestionAnswers.get(answerId) != null) {
					earnedPoints += allQuestionAnswers.get(answerId);
				}
 			}
		}
		
		// Calculate the percentage
		if (totalPoints == 0) {
			return null;
		}
		
		if (earnedPoints < 0) {
			earnedPoints = 0;
		}
		
		return (earnedPoints * 100) / totalPoints;
	}

	/**
	 * Extracts all answers that belong to questions of the given type
	 * 
	 * @param visitedPageToLearningObjects
	 * @param questionType
	 * @return
	 */
	private Map<Long, Map<Long, Float>> extractAnswers(Set<VisitedPageToLearningObject> visitedPageToLearningObjects, LearningObjectType questionType) {
		Map<Long, Map<Long, Float>> questionAnswers = new HashMap<Long, Map<Long,Float>>();
		
		if (visitedPageToLearningObjects == null) {
			// No test questions were shown.
			return questionAnswers;
		}
		
		// Process each question
		for (VisitedPageToLearningObject pageToQuestion : visitedPageToLearningObjects) {
			LearningObject question = pageToQuestion.getLearningObject();
			
			if (question.getType().getId() != questionType.id) {
				// The question is not of the right type
				continue;
			}
			
			// Find the map with the answers and their points
			Map<Long, Float> answers = questionAnswers.get(question.getId());
			if (answers == null) {
				answers = new HashMap<Long, Float>();
				questionAnswers.put(question.getId(), answers);
			}
			
			// Process the question answers
			for (QuestionAnswer answer : question.getQuestionAnswers()) {
				answers.put(answer.getId(), answer.getPoints());
			}
		}
		
		return questionAnswers;
	}

	/**
	 * Find the last page that belongs to the current (incomplete) path, i.e. it does not belong to a visited path yet
	 *  
	 * @param learnerCoursePortfolio
	 * @return
	 */
	private VisitedPage readLastPageCurrentPath(Set<VisitedPage> visitedPages) {
		VisitedPage lastPage = null;
		
		if (visitedPages == null || visitedPages.isEmpty()) {
			return null;
		}
		
		// Find the last page that belongs to the current (incomplete) path, 
		// i.e. it does not belong to a visited path yet
		int order = 0;
		for (VisitedPage visitedPage : visitedPages) {
			if (visitedPage.getVisitedPathId() != null && visitedPage.getVisitedPathId().longValue() != 0) {
				// This page belongs to a visited path
				continue;
			}
			
			if (visitedPage.getVisitingOrder() >= order) {
				order = visitedPage.getVisitingOrder();
				lastPage = visitedPage;
			}
		}
		
		return lastPage;
	}

	private void saveAsFirstPathPage(VisitedPage visitedPage, WorkingPathPage pathPage, int visitingOrder) {
		visitedPage.setId(0);
		visitedPage.setSelectedPath((pathPage != null) ? learnerService.findWorkingPath(pathPage.getWorkingPathId()) : null);
		visitedPage.setVisitingOrder(visitingOrder);
		visitedPage.setVisitedPathId(null);
		
		// Save the viewed page
		visitedPage = learnerService.addVisitedPage(visitedPage);
	}

	private VisitedPage readLastPageSelectedPath(Set<VisitedPage> visitedPages) {	
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
		return filterredPages.get(0);
	}

	private double calculatePathWeight(Set<WorkingPathStyle> pathStyles, Set<LearnerStyle> learnerStyles, long numberOfLearners) {
		String selectFormula = ApplicationProperties.getProperty(ApplicationProperties.SELECT_PATH_FORMULA);
		BigDecimal numOfLearners = (numberOfLearners == 0) ? BigDecimal.ONE : new BigDecimal(numberOfLearners);
		
		Expression exp = new Expression(selectFormula);
		
		BigDecimal weight = BigDecimal.ZERO;
		for (WorkingPathStyle pathStyle : pathStyles) {
			BigDecimal learnerStyle = new BigDecimal(getLearnerStylePercentage(pathStyle.getStyle().getId(), learnerStyles));
			
			Map<String, BigDecimal> variables = new HashMap<String, BigDecimal>();
			variables.put(ApplicationProperties.PATH_FORMULA_PATH_WEIGHT_VAR, new BigDecimal(pathStyle.getWeight()));
			variables.put(ApplicationProperties.PATH_FORMULA_LEARNER_STYLE_VAR, learnerStyle);
			variables.put(ApplicationProperties.SELECT_PATH_FORMULA_NUMBER_OF_LEARNERS_VAR, numOfLearners);
			
			weight = weight.add(exp.eval(variables));
		}
		
		return weight.doubleValue();
	}

	private Set<WorkingPath> filterVisitedPaths(Set<WorkingPath> workingPaths, Set<VisitedPath> visitedPaths) {
		Set<WorkingPath> filterredWorkingPaths = new HashSet<WorkingPath>();
		
		if (visitedPaths == null || visitedPaths.isEmpty()) {
			return workingPaths;
		}
		
		for (WorkingPath workingPath : workingPaths) {
			boolean isVisited = false;
			for (VisitedPath visitedPath : visitedPaths) {
				if (visitedPath.getPathId() != null && visitedPath.getPathId().longValue() == workingPath.getId()) {
					isVisited = true;
					break;
				}
			}
			
			if (!isVisited) {
				filterredWorkingPaths.add(workingPath);
			}
		}
		
		return filterredWorkingPaths;
	}

	private Set<WorkingPath> filterByStartPage(Set<WorkingPath> workingPaths, Long startControlPageId) {
		Set<WorkingPath> filterredWorkingPaths = new HashSet<WorkingPath>();
		
		for (WorkingPath workingPath : workingPaths) {
			if (workingPathStartsWith(workingPath.getWorkingPathPages(), startControlPageId)) {
				filterredWorkingPaths.add(workingPath);
			}
		}
		
		return filterredWorkingPaths;
	}

	private boolean workingPathStartsWith(Set<WorkingPathPage> pathPages, Long startControlPageId) {		
		if (pathPages == null || pathPages.isEmpty()) {
			return false;
		}
		
		List<WorkingPathPage> pages = new ArrayList<WorkingPathPage>(pathPages);
		Collections.sort(pages);
		
		if (startControlPageId == null) {
			// There should be no starting control page
			return pages.get(0).getPage().getType().getId() != PageType.CONTROL.id;
		} else {
			// The path should start with the given control page
			return startControlPageId.longValue() == pages.get(0).getPage().getId();
		}
	}
}
