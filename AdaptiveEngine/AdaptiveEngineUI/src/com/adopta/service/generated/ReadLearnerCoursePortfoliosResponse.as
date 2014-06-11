/**
 * ReadLearnerCoursePortfoliosResponse.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.adopta.service.generated
{
	import mx.utils.ObjectProxy;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ICollectionView;
	import mx.rpc.soap.types.*;
	/**
	 * Typed array collection
	 */

	public class ReadLearnerCoursePortfoliosResponse extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function ReadLearnerCoursePortfoliosResponse(source:Array = null)
		{
			super(source);
		}
        
        
		public function addLearnerCoursePortfolioAt(item:LearnerCoursePortfolio,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addLearnerCoursePortfolio(item:LearnerCoursePortfolio):void 
		{
			addItem(item);
		} 

		public function getLearnerCoursePortfolioAt(index:int):LearnerCoursePortfolio 
		{
			return getItemAt(index) as LearnerCoursePortfolio;
		}

		public function getLearnerCoursePortfolioIndex(item:LearnerCoursePortfolio):int 
		{
			return getItemIndex(item);
		}

		public function setLearnerCoursePortfolioAt(item:LearnerCoursePortfolio,index:int):void 
		{
			setItemAt(item,index);
		}

		public function asIList():IList 
		{
			return this as IList;
		}
        
		public function asICollectionView():ICollectionView 
		{
			return this as ICollectionView;
		}
	}
}
