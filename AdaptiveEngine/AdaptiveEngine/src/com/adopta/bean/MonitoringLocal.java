package com.adopta.bean;

import java.util.List;

import javax.ejb.Local;

import com.adopta.entity.LearnerCoursePortfolio;
import com.adopta.entity.User;

@Local
public interface MonitoringLocal {
	public abstract List<LearnerCoursePortfolio> readLearnerCoursePortfolios(Long learnerId);
	public abstract List<User> readAllLearners(long userId);
}