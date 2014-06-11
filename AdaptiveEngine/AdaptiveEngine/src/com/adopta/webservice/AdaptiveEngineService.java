package com.adopta.webservice;

import java.util.ArrayList;

import javax.jws.WebService;

import com.adopta.entity.Complexity;
import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.User;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPath;
import com.adopta.webservice.data.LongToListOfLongMapping;

@WebService(name = "AdaptiveEngineService")
public interface AdaptiveEngineService {

	public abstract User login(String username, String password);

	public abstract ArrayList<Complexity> findAllComplexities();

	public abstract void saveCoursePortfolios(
			ArrayList<CoursePortfolio> coursePortfolios);

	public abstract ArrayList<CoursePortfolio> readCoursePortfolios(long userId);

	public abstract ArrayList<LearnerCoursePortfolio> readLearnerCoursePortfolios(
			Long learnerId);

	public abstract ArrayList<User> readAllLearners(long userId);

	public abstract VisitedPage startCourse(long learnerId, long courseId);

	public abstract VisitedPage navigateToPage(VisitedPage currentPage,
			long nextPageId);

	public abstract VisitedPage submitAnswers(VisitedPage controlPage,
			ArrayList<LongToListOfLongMapping> selectedAnswers);

	public abstract VisitedPage continueCourse(long learnerId, long courseId);

	public abstract void saveVisitedPaths(ArrayList<VisitedPath> visitedPaths);

	public abstract ArrayList<VisitedPage> findCurrentVisitedPages(
			long learnerCoursePortfolioId);

	public abstract ArrayList<VisitedPage> findVisitedPages(
			long learnerCoursePortfolioId, long visitedPathId);

	public abstract ArrayList<VisitedPath> findVisitedPaths(
			long learnerCoursePortfolioId);

}