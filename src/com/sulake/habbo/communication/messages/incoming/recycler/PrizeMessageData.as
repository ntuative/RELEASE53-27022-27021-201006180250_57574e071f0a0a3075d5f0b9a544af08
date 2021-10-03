package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1611:int;
      
      private var var_2115:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_2115 = param1.readString();
         var_1611 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1611;
      }
      
      public function get productItemType() : String
      {
         return var_2115;
      }
   }
}
