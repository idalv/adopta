package com.adopta.bean.page;

import java.util.Set;

import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.PageToLearningObject;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPageToLearningObject;

public interface PageHandler {
	public Set<VisitedPageToLearningObject> findSuitableLOs(Set<PageToLearningObject> pageToLearningObjects, CoursePortfolio coursePortfolio, LearnerCoursePortfolio learnerCoursePortfolio);
	public void preparePageLinks(VisitedPage visitedPage, int pageIndex);
	public Long readLastPageSelectedPath(Set<VisitedPage> visitedPages);
}
