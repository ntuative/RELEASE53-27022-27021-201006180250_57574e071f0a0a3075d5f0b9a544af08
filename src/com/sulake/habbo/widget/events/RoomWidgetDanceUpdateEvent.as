package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_547:String = "RWUE_DANCE";
       
      
      private var var_80:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_547,param2,param3);
         var_80 = param1;
      }
      
      public function get style() : int
      {
         return var_80;
      }
   }
}
