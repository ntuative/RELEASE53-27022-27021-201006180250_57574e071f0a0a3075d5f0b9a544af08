package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_409:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_493:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_81:String = "RWPDUE_CONTENTS";
      
      public static const const_388:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_412:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_67:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_212:String;
      
      private var var_2187:BitmapData;
      
      private var var_165:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_165 = param2;
         var_212 = param3;
         _controller = param4;
         var_2187 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_2187;
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
