package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_963:Array;
      
      protected var var_77:Offer;
      
      private var var_475:int;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_77 = param1;
         var_963 = param2;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function get iconCallbackId() : int
      {
         return var_475;
      }
      
      public function get offer() : Offer
      {
         return var_77;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_963)
         {
            _loc1_.dispose();
         }
         var_963 = null;
         var_475 = 0;
      }
      
      public function get products() : Array
      {
         return var_963;
      }
      
      public function get firstProduct() : IProduct
      {
         return var_963[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_475 = param1;
      }
   }
}
