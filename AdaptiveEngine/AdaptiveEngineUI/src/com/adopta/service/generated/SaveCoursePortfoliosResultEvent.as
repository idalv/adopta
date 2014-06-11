/**
 * SaveCoursePortfoliosResultEvent.as
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
    
	public class SaveCoursePortfoliosResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var SaveCoursePortfolios_RESULT:String="SaveCoursePortfolios_result";
		/**
		 * Constructor for the new event type
		 */
		public function SaveCoursePortfoliosResultEvent()
		{
			super(SaveCoursePortfolios_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:SaveCoursePortfoliosResponse;
		public function get result():SaveCoursePortfoliosResponse
		{
			return _result;
		}

		public function set result(value:SaveCoursePortfoliosResponse):void
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