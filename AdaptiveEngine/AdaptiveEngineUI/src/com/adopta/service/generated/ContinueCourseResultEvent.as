/**
 * ContinueCourseResultEvent.as
 * This file was auto-generated from WSDL
 * Any change made to this file will be overwritten when the code is re-generated.
*/
package com.adopta.service.generated
{
	import mx.utils.ObjectProxy;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
	/**
	 * Typed event handler for the result of the operation
	 */
    
	public class ContinueCourseResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var ContinueCourse_RESULT:String="ContinueCourse_result";
		/**
		 * Constructor for the new event type
		 */
		public function ContinueCourseResultEvent()
		{
			super(ContinueCourse_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:ContinueCourseResponse;
		public function get result():ContinueCourseResponse
		{
			return _result;
		}

		public function set result(value:ContinueCourseResponse):void
		{
			_result = value;
		}

		public function get headers():Object
		{
			return _headers;
		}

		public function set headers(value:Object):void
		{
			_headers = value;
		}
	}
}