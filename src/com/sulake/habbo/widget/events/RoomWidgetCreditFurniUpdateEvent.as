package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditFurniUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_730:String = "RWCFUE_CREDIT_FURNI_UPDATE";
       
      
      private var var_165:int;
      
      private var var_2271:Number;
      
      public function RoomWidgetCreditFurniUpdateEvent(param1:String, param2:int, param3:Number, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_2271 = param3;
         var_165 = param2;
      }
      
      public function get creditValue() : Number
      {
         return var_2271;
      }
      
      public function get objectId() : int
      {
         return var_165;
      }
   }
}
