/**
 * User.as
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
    
	public class User
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function User() {}
            
		public var id:Number;
		[ArrayElementType("LearnerStyle")]
		public var learnerStyles:Array;
		[ArrayElementType("Ontology")]
		public var ontologies:Array;
		public var password:String;
		[ArrayElementType("Role")]
		public var roles:Array;
		public var status:com.adopta.service.generated.Status;
		public var username:String;
	}
}