package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_803:String;
      
      private var var_1736:int;
      
      private var var_1690:Boolean;
      
      private var _roomId:int;
      
      private var var_1737:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1690 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_803 = param1.readString();
         var_1737 = param1.readInteger();
         var_1736 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1690;
      }
      
      public function get roomName() : String
      {
         return var_803;
      }
      
      public function get enterMinute() : int
      {
         return var_1736;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1737;
      }
   }
}
