/**
 * Page.as
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
    
	public class Page
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function Page() {}
            
		public var course:com.adopta.service.generated.Course;
		public var id:Number;
		[ArrayElementType("PageToPageLink")]
		public var linksToNextPages:Array;
		[ArrayElementType("PageToPageLink")]
		public var linksToPreviousPages:Array;
		[ArrayElementType("PageToLearningObject")]
		public var pageToLearningObjects:Array;
		public var status:com.adopta.service.generated.Status;
		public var threshold:Number;
		public var title:String;
		public var type:com.adopta.service.generated.PageType;
		public var x:Number;
		public var y:Number;
	}
}