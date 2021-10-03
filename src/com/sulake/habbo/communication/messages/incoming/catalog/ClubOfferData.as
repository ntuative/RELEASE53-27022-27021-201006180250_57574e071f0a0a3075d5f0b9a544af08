package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1823:int;
      
      private var var_1336:int;
      
      private var var_1829:int;
      
      private var _offerId:int;
      
      private var var_1825:int;
      
      private var var_1828:int;
      
      private var var_1826:Boolean;
      
      private var var_1827:int;
      
      private var var_1824:Boolean;
      
      private var var_1213:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1213 = param1.readString();
         var_1336 = param1.readInteger();
         var_1824 = param1.readBoolean();
         var_1826 = param1.readBoolean();
         var_1829 = param1.readInteger();
         var_1827 = param1.readInteger();
         var_1825 = param1.readInteger();
         var_1823 = param1.readInteger();
         var_1828 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1825;
      }
      
      public function get month() : int
      {
         return var_1823;
      }
      
      public function get price() : int
      {
         return var_1336;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1829;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1827;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1824;
      }
      
      public function get day() : int
      {
         return var_1828;
      }
      
      public function get vip() : Boolean
      {
         return var_1826;
      }
      
      public function get productCode() : String
      {
         return var_1213;
      }
   }
}
