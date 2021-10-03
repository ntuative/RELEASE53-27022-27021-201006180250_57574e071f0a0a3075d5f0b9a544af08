package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2071:String;
      
      private var var_406:String;
      
      private var var_599:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_406 = param1;
         var_599 = param2;
         var_2071 = param3;
      }
      
      public function get race() : String
      {
         return var_2071;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function get gender() : String
      {
         return var_599;
      }
   }
}
