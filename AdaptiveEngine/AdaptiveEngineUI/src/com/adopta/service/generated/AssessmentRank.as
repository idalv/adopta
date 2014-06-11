/**
 * AssessmentRank.as
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
    
	public class AssessmentRank
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function AssessmentRank() {}
            
		[ArrayElementType("Complexity")]
		public var complexities:Array;
		public var coursePortfolioId:Number;
		public var from:Number;
		public var id:Number;
		public var _to:Number;
	}
}