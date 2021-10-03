package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_617:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2045:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_617);
         var_2045 = param1;
      }
      
      public function get tag() : String
      {
         return var_2045;
      }
   }
}
