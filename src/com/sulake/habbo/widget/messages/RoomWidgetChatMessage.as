package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_137:int = 0;
      
      public static const const_130:int = 1;
      
      public static const const_104:int = 2;
      
      public static const const_554:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1438:int = 0;
      
      private var var_1791:String = "";
      
      private var var_212:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_212 = param2;
         var_1438 = param3;
         var_1791 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1791;
      }
      
      public function get chatType() : int
      {
         return var_1438;
      }
      
      public function get text() : String
      {
         return var_212;
      }
   }
}
