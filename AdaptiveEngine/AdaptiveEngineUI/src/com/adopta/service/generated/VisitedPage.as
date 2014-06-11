/**
 * VisitedPage.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */

package com.adopta.service.generated
{
	import mx.utils.ObjectProxy;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
	/**
	 * Wrapper class for a operation required type
	 */
    
	public class VisitedPage
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function VisitedPage() {}
            
		public var id:Number;
		public var lastVisitedPageFromSelectedPathId:Number;
		public var learnerCoursePortfolioId:Number;
		[ArrayElementType("PageToPageLink")]
		public var linksToNextPages:Array;
		[ArrayElementType("PageToPageLink")]
		public var linksToPreviousPages:Array;
		public var nextPage:com.adopta.service.generated.Page;
		public var page:com.adopta.service.generated.Page;
		public var previousPage:com.adopta.service.generated.Page;
		public var score:Number;
		public var selectedPath:com.adopta.service.generated.WorkingPath;
		[ArrayElementType("VisitedPageToLearningObject")]
		public var visitedPageToLearningObjects:Array;
		public var visitedPathId:Number;
		public var visitingOrder:Number;
	}
}