/**
 * SaveCoursePortfolios.as
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

	public class SaveCoursePortfolios extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function SaveCoursePortfolios(source:Array = null)
		{
			super(source);
		}
        
        
		public function addCoursePortfolioAt(item:CoursePortfolio,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addCoursePortfolio(item:CoursePortfolio):void 
		{
			addItem(item);
		} 

		public function getCoursePortfolioAt(index:int):CoursePortfolio 
		{
			return getItemAt(index) as CoursePortfolio;
		}

		public function getCoursePortfolioIndex(item:CoursePortfolio):int 
		{
			return getItemIndex(item);
		}

		public function setCoursePortfolioAt(item:CoursePortfolio,index:int):void 
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
