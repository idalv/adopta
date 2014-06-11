package com.adopta.bean;

import java.util.List;
import java.util.Map;

import javax.ejb.Local;

import com.adopta.entity.VisitedPage;

@Local
public interface AdaptationLocal {
	public VisitedPage startCourse(long learnerId, long courseId);
	public VisitedPage navigateToPage(VisitedPage currentPage, long nextPageId);
	public VisitedPage submitAnswers(VisitedPage controlPage, Map<Long, List<Long>> selectedAnswers);
	public VisitedPage continueCourse(long learnerId, long courseId);
}