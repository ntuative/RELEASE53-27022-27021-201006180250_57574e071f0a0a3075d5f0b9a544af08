package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1761:int;
      
      private var var_1166:int;
      
      private var var_2023:int;
      
      private var var_1588:int;
      
      private var var_121:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1588 = param1.readInteger();
         var_2023 = param1.readInteger();
         var_1166 = param1.readInteger();
         var_1761 = param1.readInteger();
         var_121 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1588);
      }
      
      public function get chatRecordId() : int
      {
         return var_1761;
      }
      
      public function get reportedUserId() : int
      {
         return var_1166;
      }
      
      public function get callerUserId() : int
      {
         return var_2023;
      }
      
      public function get callId() : int
      {
         return var_1588;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_121;
      }
   }
}
