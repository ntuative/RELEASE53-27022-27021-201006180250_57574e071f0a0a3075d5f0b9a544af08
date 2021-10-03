package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_803:String;
      
      private var var_1689:Array;
      
      private var var_1690:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1689 = new Array();
         super();
         var_1690 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_803 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1689.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1690 + ", " + _roomId + ", " + var_803 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1690;
      }
      
      public function get roomName() : String
      {
         return var_803;
      }
      
      public function get chatlog() : Array
      {
         return var_1689;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
