package com.adopta.service.util
{

	import mx.rpc.soap.SOAPEncoder;

	/**
	 * Replacement for default SOAPEncoder to correct the handling of null numeric values.
	 * 
	 * The default SOAPEncoder encodes NaN Number values as the value NaN rather than correctly encoding a blank
	 * value and setting the xsi:nil="true" attribute.
	 */
	public class FlowUIEncoder extends SOAPEncoder
	{

		public function FlowUIEncoder()
		{
			super();
		}

	    override public function encodeType(type:QName, parent:XML, name:QName, value:*, restriction:XML = null):void
	    {
	    	
	    	// If value is a NaN number then force setting the nil attribute utilizing the logic from the string data type
	    	if ((value is Number) && isNaN(value))
	    	{
	    		type = new QName("http://www.w3.org/2001/XMLSchema", "string");
	    		value = null;
	    	}
	    	
	    	super.encodeType(type, parent, name, value, restriction);
	    	
	    }

	}
}