package com.adopta.test;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import com.adopta.entity.Complexity;
import com.adopta.entity.Course;
import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.User;
import com.adopta.entity.VisitedPath;
import com.adopta.webservice.AdaptiveEngineService;

public class AdaptiveEngineServiceTest {

	public static String TARGET_NS = "http://webservice.adopta.com/";
	public static String WSDL_URL = "http://localhost:8080/AdaptiveEngine/AdaptiveEngineService?wsdl";
	public static String WEBSERVICE_NAME = "AdaptiveEngineService";

	private static AdaptiveEngineService webService = null;
	
	@BeforeClass
	public static void initProxy() throws MalformedURLException {
		try {
			URL wsdlURL = new URL(WSDL_URL);
			QName serviceName = new QName(TARGET_NS, WEBSERVICE_NAME);
			Service service = Service.create(wsdlURL, serviceName);
			webService = (AdaptiveEngineService) service.getPort(AdaptiveEngineService.class);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

    @Test
    public void testLoginUser() {
    	String userName = "vladi";
    	String password = "vladi";
    	User user = webService.login(userName, password);
    	
    	Assert.assertNotNull(user);
    	Assert.assertEquals(user.getUsername(), userName);
    }
    
    @Test
    public void testFindAllComplexities() {
    	ArrayList<Complexity> complexities = webService.findAllComplexities();
    	
    	Assert.assertNotNull(complexities);
    }
    
    @Test
    public void testSaveCoursePortfolios() {
    	ArrayList<CoursePortfolio> coursePortfolios = new ArrayList<CoursePortfolio>();
    	CoursePortfolio portfolio = new CoursePortfolio();
    	portfolio.setId(1);
    	Course course = new Course();
    	course.setName("test");
    	User user = new User();
    	user.setId(2);
    	portfolio.setCourse(course);
    	portfolio.setInstructor(user);
    	portfolio.setNumberOfQuestions(42);
    	coursePortfolios.add(portfolio);
    	
    	webService.saveCoursePortfolios(coursePortfolios);
    	ArrayList<CoursePortfolio> savedPortfolios = webService.readCoursePortfolios(2);
    	Assert.assertNotNull(savedPortfolios);
    }
    
    @Test
    public void testReadCoursePorfolios() {
    	ArrayList<CoursePortfolio> portfolios = webService.readCoursePortfolios(2);
    	
    	Assert.assertNotNull(portfolios);
    }
    
    @Test
    public void testReadLearnerCoursePorfolios() {
    	ArrayList<LearnerCoursePortfolio> portfolios = webService.readLearnerCoursePortfolios(Long.valueOf(3));
    	
    	Assert.assertNotNull(portfolios);
    }
    
    @Test
    public void testReadAllLearners() {
    	ArrayList<User> learners = webService.readAllLearners(1);
    	
    	Assert.assertNotNull(learners);
    }
    
    @Test
    public void testSaveVisitedPaths() {
    	VisitedPath path = new VisitedPath();
    	path.setComment("test");
    	path.setLearnerCoursePortfolioId(1);
    	path.setPathId(Long.valueOf(1));
    	path.setVisitingOrder(1);
    	ArrayList<VisitedPath> paths = new ArrayList<VisitedPath>();
    	paths.add(path);
    	
    	webService.saveVisitedPaths(paths);
    	
    	Assert.assertNotNull(webService.findVisitedPaths(1));
    }
}
