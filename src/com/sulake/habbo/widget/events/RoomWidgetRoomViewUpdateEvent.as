package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_659:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_546:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_297:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1612:Point;
      
      private var var_1613:Rectangle;
      
      private var var_150:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1613 = param2;
         var_1612 = param3;
         var_150 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1613 != null)
         {
            return var_1613.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_150;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1612 != null)
         {
            return var_1612.clone();
         }
         return null;
      }
   }
}
