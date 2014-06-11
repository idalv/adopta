/**
 * FindVisitedPathsResultEvent.as
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
    
	public class FindVisitedPathsResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var FindVisitedPaths_RESULT:String="FindVisitedPaths_result";
		/**
		 * Constructor for the new event type
		 */
		public function FindVisitedPathsResultEvent()
		{
			super(FindVisitedPaths_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:FindVisitedPathsResponse;
		public function get result():FindVisitedPathsResponse
		{
			return _result;
		}

		public function set result(value:FindVisitedPathsResponse):void
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