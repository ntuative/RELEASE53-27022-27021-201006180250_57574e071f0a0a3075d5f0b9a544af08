package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_375:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_309:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_987:int;
      
      private var var_282:Boolean;
      
      private var var_1991:Boolean;
      
      private var var_1572:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_987 = param2;
         var_1991 = param3;
         var_282 = param4;
         var_1572 = param5;
      }
      
      public function get position() : int
      {
         return var_987;
      }
      
      public function get isActive() : Boolean
      {
         return var_282;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1572;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1991;
      }
   }
}
