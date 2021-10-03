package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1391:String = "me_menu";
      
      public static const const_900:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
       
      
      private var _icon:BitmapData;
      
      private var var_1990:String;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_900);
         var_1990 = param1;
         _icon = param2;
      }
      
      public function get icon() : BitmapData
      {
         return _icon;
      }
      
      public function get widgetType() : String
      {
         return var_1990;
      }
   }
}
