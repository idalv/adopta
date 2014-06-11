/**
 * SaveVisitedPaths.as
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

	public class SaveVisitedPaths extends ArrayCollection
	{
		/**
		 * Constructor - initializes the array collection based on a source array
		 */
        
		public function SaveVisitedPaths(source:Array = null)
		{
			super(source);
		}
        
        
		public function addVisitedPathAt(item:VisitedPath,index:int):void 
		{
			addItemAt(item,index);
		}

		public function addVisitedPath(item:VisitedPath):void 
		{
			addItem(item);
		} 

		public function getVisitedPathAt(index:int):VisitedPath 
		{
			return getItemAt(index) as VisitedPath;
		}

		public function getVisitedPathIndex(item:VisitedPath):int 
		{
			return getItemIndex(item);
		}

		public function setVisitedPathAt(item:VisitedPath,index:int):void 
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
