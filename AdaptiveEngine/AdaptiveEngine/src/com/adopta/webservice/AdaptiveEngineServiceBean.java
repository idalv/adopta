package com.adopta.webservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.jws.WebService;

import org.jboss.wsf.spi.annotation.WebContext;

import com.adopta.bean.AdaptationLocal;
import com.adopta.bean.AdministrationLocal;
import com.adopta.bean.MonitoringLocal;
import com.adopta.entity.Complexity;
import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.User;
import com.adopta.entity.VisitedPage;
import com.adopta.entity.VisitedPath;
import com.adopta.service.CommonService;
import com.adopta.service.LearnerService;
import com.adopta.service.UserService;
import com.adopta.webservice.data.LongToListOfLongMapping;

@Stateless
@Remote(AdaptiveEngineService.class)
@WebService(serviceName = "AdaptiveEngineService", 
		portName = "AdaptiveEngineService", endpointInterface = "com.adopta.webservice.AdaptiveEngineService")
@WebContext(urlPattern = "/AdaptiveEngineService")
public class AdaptiveEngineServiceBean implements AdaptiveEngineService {
	
	@EJB(mappedName="UserServiceBean/local")
	private UserService userService;
	
	@EJB(mappedName="CommonServiceBean/local")
	private CommonService commonService;
	
	@EJB(mappedName="LearnerServiceBean/local")
	private LearnerService learnerService;
	
	@EJB
	private AdministrationLocal administrationService;
	
	@EJB
	private MonitoringLocal monitoringService;
	
	@EJB
	private AdaptationLocal adaptationService;
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#login(java.lang.String, java.lang.String)
	 */
	public User login(String username, String password) {
		return userService.findByUsernameAndPassword(username, password);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#findAllComplexities()
	 */
	public ArrayList<Complexity> findAllComplexities() {
		return (ArrayList<Complexity>) commonService.findAllComplexities();
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#saveCoursePortfolios(java.util.ArrayList)
	 */
	public void saveCoursePortfolios(ArrayList<CoursePortfolio> coursePortfolios) {
		administrationService.updateCoursePortfolios(coursePortfolios);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#readCoursePortfolios(long)
	 */
	public ArrayList<CoursePortfolio> readCoursePortfolios(long userId) {
		return (ArrayList<CoursePortfolio>) administrationService.readCoursePortfolios(userId);
	}
		
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#readLearnerCoursePortfolios(java.lang.Long)
	 */
	public ArrayList<LearnerCoursePortfolio> readLearnerCoursePortfolios(Long learnerId) {
		return (ArrayList<LearnerCoursePortfolio>) monitoringService.readLearnerCoursePortfolios(learnerId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#readAllLearners(long)
	 */
	public ArrayList<User> readAllLearners(long userId) {
		return (ArrayList<User>) monitoringService.readAllLearners(userId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#startCourse(long, long)
	 */
	public VisitedPage startCourse(long learnerId, long courseId) {
		return adaptationService.startCourse(learnerId, courseId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#navigateToPage(com.adopta.entity.VisitedPage, long)
	 */
	public VisitedPage navigateToPage(VisitedPage currentPage, long nextPageId) {
		return adaptationService.navigateToPage(currentPage, nextPageId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#submitAnswers(com.adopta.entity.VisitedPage, java.util.ArrayList)
	 */
	public VisitedPage submitAnswers(VisitedPage controlPage, ArrayList<LongToListOfLongMapping> selectedAnswers) {
		Map<Long, List<Long>> selectedAnswersMap = new HashMap<Long, List<Long>>();
		for (LongToListOfLongMapping longToListOfLongMapping : selectedAnswers) {
			selectedAnswersMap.put(longToListOfLongMapping.getKey(), longToListOfLongMapping.getValue());
		}
		return adaptationService.submitAnswers(controlPage, selectedAnswersMap);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#continueCourse(long, long)
	 */
	public VisitedPage continueCourse(long learnerId, long courseId) {
		return adaptationService.continueCourse(learnerId, courseId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#saveVisitedPaths(java.util.ArrayList)
	 */
	public void saveVisitedPaths(ArrayList<VisitedPath> visitedPaths) {
		learnerService.saveVisitedPaths(visitedPaths);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#findCurrentVisitedPages(long)
	 */
	public ArrayList<VisitedPage> findCurrentVisitedPages(long learnerCoursePortfolioId) {
		return (ArrayList<VisitedPage>) learnerService.findCurrentVisitedPages(learnerCoursePortfolioId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#findVisitedPages(long, long)
	 */
	public ArrayList<VisitedPage> findVisitedPages(long learnerCoursePortfolioId, long visitedPathId) {
		return (ArrayList<VisitedPage>) learnerService.findVisitedPages(learnerCoursePortfolioId, visitedPathId);
	}
	
	/* (non-Javadoc)
	 * @see com.adopta.webservice.AdaptiveEngineServiceLocal#findVisitedPaths(long)
	 */
	public ArrayList<VisitedPath> findVisitedPaths(long learnerCoursePortfolioId) {
		return (ArrayList<VisitedPath>) learnerService.findVisitedPaths(learnerCoursePortfolioId);
	}
}
