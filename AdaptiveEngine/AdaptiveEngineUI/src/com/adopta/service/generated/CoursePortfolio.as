/**
 * CoursePortfolio.as
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
    
	public class CoursePortfolio
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function CoursePortfolio() {}
            
		public var addVisitedPaths:Boolean;
		[ArrayElementType("AssessmentRank")]
		public var assessmentRanks:Array;
		public var automaticPathSelection:Boolean;
		public var course:com.adopta.service.generated.Course;
		public var id:Number;
		public var instructor:com.adopta.service.generated.User;
		public var numberOfQuestions:Number;
		public var showAllLearningObjects:Boolean;
	}
}