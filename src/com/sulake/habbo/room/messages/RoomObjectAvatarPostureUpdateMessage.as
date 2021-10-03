package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2095:String;
      
      private var var_981:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2095 = param1;
         var_981 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2095;
      }
      
      public function get parameter() : String
      {
         return var_981;
      }
   }
}
