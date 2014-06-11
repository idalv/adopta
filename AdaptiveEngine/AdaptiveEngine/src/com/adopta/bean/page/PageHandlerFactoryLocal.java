package com.adopta.bean.page;

import javax.ejb.Local;

@Local
public interface PageHandlerFactoryLocal {

	public abstract PageHandler createPageHandler(long pageType);

}