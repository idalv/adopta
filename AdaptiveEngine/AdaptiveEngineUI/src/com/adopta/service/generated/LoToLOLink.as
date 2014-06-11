/**
 * LoToLOLink.as
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
    
	public class LoToLOLink
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function LoToLOLink() {}
            
		public var id:Number;
		public var label:String;
		public var loChildId:Number;
		public var loParentId:Number;
		public var lomParent:Boolean;
		public var type:com.adopta.service.generated.LearningObjectLinkType;
	}
}