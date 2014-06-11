/**
 * LearningObject.as
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
    
	public class LearningObject
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function LearningObject() {}
            
		public var complexity:com.adopta.service.generated.Complexity;
		public var id:Number;
		[ArrayElementType("LoToLOLink")]
		public var linksToChilds:Array;
		[ArrayElementType("LoToLOLink")]
		public var linksToParents:Array;
		[ArrayElementType("Lom")]
		public var lom:Array;
		public var name:String;
		public var ontologyId:Number;
		[ArrayElementType("QuestionAnswer")]
		public var questionAnswers:Array;
		[ArrayElementType("LearningObjectResource")]
		public var resources:Array;
		public var status:com.adopta.service.generated.Status;
		public var subtype:com.adopta.service.generated.LearningObjectSubtype;
		public var type:com.adopta.service.generated.LearningObjectType;
	}
}