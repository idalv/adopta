/**
 * FindCurrentVisitedPagesResponse.as
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

	public class FindCurrentVisitedPagesResponse extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function FindCurrentVisitedPagesResponse(source:Array = null)
		{
			super(source);
		}
        
        
		public function addVisitedPageAt(item:VisitedPage,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addVisitedPage(item:VisitedPage):void 
		{
			addItem(item);
		} 

		public function getVisitedPageAt(index:int):VisitedPage 
		{
			return getItemAt(index) as VisitedPage;
		}

		public function getVisitedPageIndex(item:VisitedPage):int 
		{
			return getItemIndex(item);
		}

		public function setVisitedPageAt(item:VisitedPage,index:int):void 
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
