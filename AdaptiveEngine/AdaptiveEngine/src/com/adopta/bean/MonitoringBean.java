package com.adopta.bean;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.User;
import com.adopta.service.LearnerService;
import com.adopta.service.UserService;
import com.adopta.type.Role;

@Stateless
public class MonitoringBean implements MonitoringLocal {
	@EJB(mappedName="LearnerServiceBean/local")
	private LearnerService learnerService;
	
	@EJB(mappedName="UserServiceBean/local")
	private UserService userService;
	
	public List<LearnerCoursePortfolio> readLearnerCoursePortfolios(Long learnerId) {
		User user = userService.findUser(learnerId);
		for (com.adopta.entity.Role role : user.getRoles()) {
			if (role.getId() == Role.LEARNER.id) {
				// Return all learner course portfolios only in case the current logged in user is a learner
				return learnerService.findLearnerCoursePortfolios(learnerId);
			}
		}
		
		return new ArrayList<LearnerCoursePortfolio>();
	}
	
	public List<User> readAllLearners(long userId) {
		User user = userService.findUser(userId);
		for (com.adopta.entity.Role role : user.getRoles()) {
			if (role.getId() == Role.AUTHOR.id || role.getId() == Role.INSTRUCTOR.id) {
				// Return all learners only in case the current logged in user is an author or instructor
				return userService.findUsersByRole(Role.LEARNER);
			}
		}
		
		return new ArrayList<User>();
	}
}
