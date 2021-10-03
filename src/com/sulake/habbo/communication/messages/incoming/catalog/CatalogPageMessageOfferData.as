package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_963:Array;
      
      private var var_884:int;
      
      private var var_1304:String;
      
      private var _offerId:int;
      
      private var var_885:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1304 = param1.readString();
         var_884 = param1.readInteger();
         var_885 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_963 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_963.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_963;
      }
      
      public function get priceInCredits() : int
      {
         return var_884;
      }
      
      public function get localizationId() : String
      {
         return var_1304;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_885;
      }
   }
}
