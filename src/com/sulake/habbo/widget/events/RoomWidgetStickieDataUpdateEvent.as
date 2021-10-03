package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_570:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_212:String;
      
      private var var_714:String;
      
      private var var_1521:String;
      
      private var var_165:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_165 = param2;
         var_1521 = param3;
         var_212 = param4;
         var_714 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1521;
      }
      
      public function get colorHex() : String
      {
         return var_714;
      }
      
      public function get text() : String
      {
         return var_212;
      }
      
      public function get objectId() : int
      {
         return var_165;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
