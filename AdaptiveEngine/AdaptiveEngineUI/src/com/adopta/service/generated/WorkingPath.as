/**
 * WorkingPath.as
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
    
	public class WorkingPath
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function WorkingPath() {}
            
		public var course:com.adopta.service.generated.Course;
		public var id:Number;
		public var name:String;
		[ArrayElementType("WorkingPathPage")]
		public var workingPathPages:Array;
		[ArrayElementType("WorkingPathStyle")]
		public var workingPathStyles:Array;
	}
}