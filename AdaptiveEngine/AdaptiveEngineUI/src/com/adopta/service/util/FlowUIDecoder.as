package com.adopta.service.util
{

	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.soap.SOAPDecoder;
	import mx.rpc.xml.ContentProxy;
	import mx.rpc.xml.TypeIterator;
	import mx.utils.object_proxy;

	/**
	 * Replacement for default SOAPDecoder to correct the handling of null numeric values.
	 * 
	 * The default SOAPDecoder handles null values for Number properties in the same manner as properties of other data types 
	 * and sets Number properties to null.  The problem is that is that setting a Number property to null sets the value to 0
	 * rather than to NaN.
	 * 
	 * The setValue function which is included in this class is identical to the one from the default XMLDecoder aside from
	 * the small section of inserted code.  This change should probably have been made in the decodeType function however the
	 * decodeType function does not appear to always be called properly since some functions call the setValue function directly.
	 */
	public class FlowUIDecoder extends SOAPDecoder
	{
		
		public function FlowUIDecoder()
		{
			super();
			log = Log.getLogger("mx.rpc.xml.XMLDecoder");
		}

		private var log:ILogger;

    	override public function setValue(parent:*, name:*, value:*, type:Object=null):void
		{
						
	        if (parent != null)
	        {
	            // Unwrap any proxied values
	            if (value is ContentProxy)
	                value = ContentProxy(value).object_proxy::content;
	
	            var existingValue:*;
	
	            // We already have an array of values, so just add to this list
	            if (TypeIterator.isIterable(parent))
	            {
	                TypeIterator.push(parent, value);
	            }
	            else if (name != null)
	            {
	                var propertyName:String;
	                if (name is ContentProxy)
	                    name = ContentProxy(name).object_proxy::content;
	
	                if (name is QName)
	                    propertyName = QName(name).localName;
	                else
	                    propertyName = Object(name).toString();
	
	                if (parent is ContentProxy && ContentProxy(parent).object_proxy::isSimple)
	                {
	                    existingValue = ContentProxy(parent).object_proxy::content;
	                }
	                else 
	                {
	                    if (Object(parent).hasOwnProperty(propertyName))
	                        existingValue = getExistingValue(parent, propertyName);
	                        
	                    else if (Object(parent).hasOwnProperty("_" + propertyName))
	                        existingValue = getExistingValue(parent, "_" + propertyName);
	                }
			
					//////// INSERTED CODE ////////
					// Is the value is null and the property is a Number then change the value to NaN
					if (value == null)
					{
						if (isNumber(parent, propertyName))
							value = NaN; 
					}
					//////// INSERTED CODE ////////
	
	                // FIXME: How would we handle building up an Array of null
	                // values from a sequence? If the type was * then it would
	                // allow undefined to be checked, but this is a rare type
	                // for users to declare... perhaps more context is needed
	                // here.
	                if (existingValue != null)
	                {
	                    existingValue = promoteValueToArray(existingValue, type);
	                    TypeIterator.push(existingValue, value);
	                    value = existingValue;
	                }
	
	                try
	                {
	                    if (parent is ContentProxy && ContentProxy(parent).object_proxy::isSimple)
	                    {
	                        ContentProxy(parent).object_proxy::content = value;
	                    }
	                    else
	                    {
	                        try
	                        {
	                            parent[propertyName] = value;
	                        }
	                        catch(e:Error)
	                        {
	                            parent["_"+propertyName] = value;
	                        }
	                    }
	                }
	                catch(e:Error)
	                {
	                    log.warn("Unable to set property '{0}' on parent.", propertyName);
	                }
	            }
	            // If not an array, and without a name, we assume this may be the
	            // first of potentially many items, or perhaps it is the second
	            // item requiring us to promote the the existing item to an array.
	            else if (parent is ContentProxy)
	            {
	                var proxyParent:ContentProxy = parent as ContentProxy;
	                existingValue = proxyParent.object_proxy::content;
	                if (existingValue !== undefined)
	                {
	                    existingValue = promoteValueToArray(existingValue, type);
	                    proxyParent.object_proxy::content = existingValue;
	                    TypeIterator.push(existingValue, value);
	                    value = existingValue;
	                }
	
	                proxyParent.object_proxy::content = value;
	            }
	        }
			
		}

		/**
		 * Checks if the specified property is a Number.
		 * @private
		 */
	    protected function isNumber(parent:*, propertyName:String):Boolean
	    {
	    	var value:* = parent[propertyName];
	    	return (value is Number);
	    }

	}
}