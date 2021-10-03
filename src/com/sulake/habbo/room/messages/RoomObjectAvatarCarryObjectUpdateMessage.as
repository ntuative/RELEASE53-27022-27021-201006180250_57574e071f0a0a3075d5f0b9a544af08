package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1101:int;
      
      private var var_1355:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1101 = param1;
         var_1355 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1101;
      }
      
      public function get itemName() : String
      {
         return var_1355;
      }
   }
}
