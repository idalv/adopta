/**
 * ReadAllLearnersResultEvent.as
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
    
	public class ReadAllLearnersResultEvent extends Event
	{
		/**
		 * The event type value
		 */
		public static var ReadAllLearners_RESULT:String="ReadAllLearners_result";
		/**
		 * Constructor for the new event type
		 */
		public function ReadAllLearnersResultEvent()
		{
			super(ReadAllLearners_RESULT,false,false);
		}
        
		private var _headers:Object;
		private var _result:ReadAllLearnersResponse;
		public function get result():ReadAllLearnersResponse
		{
			return _result;
		}

		public function set result(value:ReadAllLearnersResponse):void
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