package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1823:int;
      
      private var var_2313:Boolean = false;
      
      private var var_1829:int;
      
      private var var_1825:int;
      
      private var var_1827:int;
      
      private var var_1213:String;
      
      private var var_1336:int;
      
      private var _offerId:int;
      
      private var var_1828:int;
      
      private var var_1826:Boolean;
      
      private var var_1824:Boolean;
      
      private var var_467:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1213 = param2;
         var_1336 = param3;
         var_1824 = param4;
         var_1826 = param5;
         var_1829 = param6;
         var_1827 = param7;
         var_1825 = param8;
         var_1823 = param9;
         var_1828 = param10;
      }
      
      public function get month() : int
      {
         return var_1823;
      }
      
      public function get page() : ICatalogPage
      {
         return var_467;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1826;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_467 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_310;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1824;
      }
      
      public function get localizationId() : String
      {
         return var_1213;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1827;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2313;
      }
      
      public function get day() : int
      {
         return var_1828;
      }
      
      public function get year() : int
      {
         return var_1825;
      }
      
      public function get price() : int
      {
         return var_1336;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2313 = param1;
      }
      
      public function get periods() : int
      {
         return var_1829;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1336;
      }
      
      public function get productCode() : String
      {
         return var_1213;
      }
   }
}
