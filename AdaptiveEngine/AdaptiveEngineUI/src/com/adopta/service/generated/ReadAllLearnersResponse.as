/**
 * ReadAllLearnersResponse.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package com.adopta.service.generated
{
	import mx.utils.ObjectProxy;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.collections.ICollectionView;
	import mx.rpc.soap.types.*;
	/**
	 * Typed array collection
	 */

	public class ReadAllLearnersResponse extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function ReadAllLearnersResponse(source:Array = null)
		{
			super(source);
		}
        
        
		public function addUserAt(item:User,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addUser(item:User):void 
		{
			addItem(item);
		} 

		public function getUserAt(index:int):User 
		{
			return getItemAt(index) as User;
		}

		public function getUserIndex(item:User):int 
		{
			return getItemIndex(item);
		}

		public function setUserAt(item:User,index:int):void 
		{
			setItemAt(item,index);
		}

		public function asIList():IList 
		{
			return this as IList;
		}
        
		public function asICollectionView():ICollectionView 
		{
			return this as ICollectionView;
		}
	}
}
