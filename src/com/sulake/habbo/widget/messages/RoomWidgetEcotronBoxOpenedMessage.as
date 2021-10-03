package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1352:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1467:int;
      
      private var var_1101:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_1101 = param2;
         var_1467 = param3;
      }
      
      public function get classId() : int
      {
         return var_1467;
      }
      
      public function get itemType() : String
      {
         return var_1101;
      }
   }
}
