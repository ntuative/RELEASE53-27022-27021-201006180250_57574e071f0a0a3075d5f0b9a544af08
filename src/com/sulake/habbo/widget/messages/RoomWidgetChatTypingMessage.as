package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_567:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_492:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_567);
         var_492 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_492;
      }
   }
}
