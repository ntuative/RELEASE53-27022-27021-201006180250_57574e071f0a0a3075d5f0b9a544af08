package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_130:int = 1;
      
      public static const const_262:int = 4;
      
      public static const const_270:int = 3;
      
      public static const const_137:int = 0;
      
      public static const const_631:String = "RWCUE_EVENT_CHAT";
      
      public static const const_104:int = 2;
       
      
      private var var_2220:int;
      
      private var var_212:String = "";
      
      private var var_2219:BitmapData;
      
      private var _userName:String;
      
      private var var_1438:int = 0;
      
      private var var_2218:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_2221:Number;
      
      private var var_2217:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_212 = param3;
         var_1438 = param12;
         _userName = param4;
         var_2220 = param5;
         var_2221 = param6;
         var_2217 = param7;
         var_2219 = param8;
         var_2218 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_2219;
      }
      
      public function get text() : String
      {
         return var_212;
      }
      
      public function get userX() : Number
      {
         return var_2221;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_2220;
      }
      
      public function get chatType() : int
      {
         return var_1438;
      }
      
      public function get userColor() : uint
      {
         return var_2218;
      }
      
      public function get userY() : Number
      {
         return var_2217;
      }
   }
}
