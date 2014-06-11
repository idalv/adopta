package com.adopta.bean.page;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import com.adopta.type.PageType;

@Stateless
public class PageHandlerFactoryBean implements PageHandlerFactoryLocal {
	
	@EJB
	private ContentPageHandlerLocal contentPageHandler;
	
	@EJB
	private ControlPageHandlerLocal controlPageHadnler;
	
	/* (non-Javadoc)
	 * @see com.adopta.bean.page.PageHandlerFactoryLocal#createPageHandler(long)
	 */
	public PageHandler createPageHandler(long pageType) {
		if (PageType.CONTENT.id == pageType) {
			return contentPageHandler;
		} else if (PageType.CONTROL.id == pageType) {
			return controlPageHadnler;
		} else {
			throw new RuntimeException("Page type [" + pageType + "] is not handled!");
		}
	}
}
