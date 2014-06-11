package com.adopta.bean;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.adopta.entity.CoursePortfolio;
import com.adopta.entity.User;
import com.adopta.service.CourseService;
import com.adopta.service.UserService;
import com.adopta.type.Role;

@Stateless
public class AdministrationBean implements AdministrationLocal {
	@EJB(mappedName="CourseServiceBean/local")
	private CourseService courseService;
	
	@EJB(mappedName="UserServiceBean/local")
	private UserService userService;
	
	/* (non-Javadoc)
	 * @see com.adopta.bean.AdministrationLocal#saveCoursePortfolios(java.util.List)
	 */
	public void updateCoursePortfolios(List<CoursePortfolio> portfolios) {
		for (CoursePortfolio coursePortfolio : portfolios) {
			courseService.updateCoursePortfolio(coursePortfolio);
		}
	}
	
	public List<CoursePortfolio> readCoursePortfolios(long userId) {
		User user = userService.findUser(userId);
		for (com.adopta.entity.Role role : user.getRoles()) {
			if (role.getId() == Role.AUTHOR.id || role.getId() == Role.INSTRUCTOR.id) {
				// Return all courses only in case the current logged in user is an author or instructor
				return courseService.findAllCoursePortfolios();
			}
		}
		
		return new ArrayList<CoursePortfolio>();
	}
}
