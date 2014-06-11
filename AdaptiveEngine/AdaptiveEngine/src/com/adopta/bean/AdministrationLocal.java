package com.adopta.bean;

import java.util.List;

import javax.ejb.Local;

import com.adopta.entity.CoursePortfolio;

@Local
public interface AdministrationLocal {

	public abstract void updateCoursePortfolios(List<CoursePortfolio> portfolios);
	public abstract List<CoursePortfolio> readCoursePortfolios(long userId);
}