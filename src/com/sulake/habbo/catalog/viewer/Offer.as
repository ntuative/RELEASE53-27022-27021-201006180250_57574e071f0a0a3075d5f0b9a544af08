package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_861:String = "price_type_none";
      
      public static const const_472:String = "pricing_model_multi";
      
      public static const const_310:String = "price_type_credits";
      
      public static const const_395:String = "price_type_credits_and_pixels";
      
      public static const const_490:String = "pricing_model_bundle";
      
      public static const const_433:String = "pricing_model_single";
      
      public static const const_642:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1263:String = "pricing_model_unknown";
      
      public static const const_454:String = "price_type_pixels";
       
      
      private var var_1968:int;
      
      private var var_884:int;
      
      private var _offerId:int;
      
      private var var_885:int;
      
      private var var_435:String;
      
      private var var_617:String;
      
      private var var_467:ICatalogPage;
      
      private var var_434:IProductContainer;
      
      private var var_1304:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1304 = param1.localizationId;
         var_884 = param1.priceInCredits;
         var_885 = param1.priceInPixels;
         var_467 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_435;
      }
      
      public function get page() : ICatalogPage
      {
         return var_467;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1968 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_434;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_885;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1304 = "";
         var_884 = 0;
         var_885 = 0;
         var_467 = null;
         if(var_434 != null)
         {
            var_434.dispose();
            var_434 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_1968;
      }
      
      public function get priceInCredits() : int
      {
         return var_884;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_435 = const_433;
            }
            else
            {
               var_435 = const_472;
            }
         }
         else if(param1.length > 1)
         {
            var_435 = const_490;
         }
         else
         {
            var_435 = const_1263;
         }
      }
      
      public function get priceType() : String
      {
         return var_617;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_435)
         {
            case const_433:
               var_434 = new SingleProductContainer(this,param1);
               break;
            case const_472:
               var_434 = new MultiProductContainer(this,param1);
               break;
            case const_490:
               var_434 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_435);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1304;
      }
      
      private function analyzePriceType() : void
      {
         if(var_884 > 0 && var_885 > 0)
         {
            var_617 = const_395;
         }
         else if(var_884 > 0)
         {
            var_617 = const_310;
         }
         else if(var_885 > 0)
         {
            var_617 = const_454;
         }
         else
         {
            var_617 = const_861;
         }
      }
   }
}
