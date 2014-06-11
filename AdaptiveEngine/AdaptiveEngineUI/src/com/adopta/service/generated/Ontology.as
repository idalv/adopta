/**
 * Ontology.as
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
    
	public class Ontology
	{
		/**
		 * Constructor, initializes the type class
		 */
		public function Ontology() {}
            
		public var id:Number;
		[ArrayElementType("LearningObject")]
		public var learningObjects:Array;
		public var name:String;
		[ArrayElementType("OntologyMetadata")]
		public var ontologyMetadata:Array;
		public var userId:Number;
	}
}