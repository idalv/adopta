/**
 * NavigateToPageResultEvent.as
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
    
	public class NavigateToPageResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var NavigateToPage_RESULT:String="NavigateToPage_result";
		/**
		 * Constructor for the new event type
		 */
		public function NavigateToPageResultEvent()
		{
			super(NavigateToPage_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:NavigateToPageResponse;
		public function get result():NavigateToPageResponse
		{
			return _result;
		}

		public function set result(value:NavigateToPageResponse):void
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