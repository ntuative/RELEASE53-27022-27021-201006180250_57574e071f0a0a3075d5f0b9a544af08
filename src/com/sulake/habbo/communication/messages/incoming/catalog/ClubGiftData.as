package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2042:int;
      
      private var var_2043:Boolean;
      
      private var _offerId:int;
      
      private var var_1947:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2043 = param1.readBoolean();
         var_2042 = param1.readInteger();
         var_1947 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1947;
      }
      
      public function get monthsRequired() : int
      {
         return var_2042;
      }
      
      public function get isVip() : Boolean
      {
         return var_2043;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
