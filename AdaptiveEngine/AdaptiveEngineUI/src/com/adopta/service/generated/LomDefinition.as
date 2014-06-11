/**
 * LomDefinition.as
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
    
	public class LomDefinition
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function LomDefinition() {}
            
		public var id:Number;
		public var name:String;
		[ArrayElementType("LomPredefinedValue")]
		public var predefinedValues:Array;
		public var type:String;
	}
}