package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1336:int;
      
      private var var_1910:int;
      
      private var var_2074:int = -1;
      
      private var var_148:int;
      
      private var var_1890:int;
      
      private var _offerId:int;
      
      private var var_1335:int;
      
      private var _furniId:int;
      
      private var var_1477:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         _offerId = param1;
         _furniId = param2;
         var_1890 = param3;
         var_1477 = param4;
         var_1336 = param5;
         var_148 = param6;
         var_2074 = param7;
         var_1910 = param8;
         var_1335 = param9;
      }
      
      public function get status() : int
      {
         return var_148;
      }
      
      public function get price() : int
      {
         return var_1336;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2074;
      }
      
      public function get offerCount() : int
      {
         return var_1335;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1890;
      }
      
      public function get averagePrice() : int
      {
         return var_1910;
      }
      
      public function get furniId() : int
      {
         return _furniId;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
   }
}
