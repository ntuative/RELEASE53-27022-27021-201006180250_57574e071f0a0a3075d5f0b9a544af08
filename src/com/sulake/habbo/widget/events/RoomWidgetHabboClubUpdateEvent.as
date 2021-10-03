package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_234:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2119:Boolean = false;
      
      private var var_2118:int = 0;
      
      private var var_2116:int = 0;
      
      private var var_2087:int;
      
      private var var_2117:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_234,param6,param7);
         var_2117 = param1;
         var_2116 = param2;
         var_2118 = param3;
         var_2119 = param4;
         var_2087 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_2087;
      }
      
      public function get pastPeriods() : int
      {
         return var_2118;
      }
      
      public function get periodsLeft() : int
      {
         return var_2116;
      }
      
      public function get daysLeft() : int
      {
         return var_2117;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2119;
      }
   }
}
