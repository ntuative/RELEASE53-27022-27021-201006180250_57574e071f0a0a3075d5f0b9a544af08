package com.sulake.habbo.communication.messages.incoming.room.furniture
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.room.furniture.DoorNotInstalledMessageParser;
   
   public class DoorNotInstalledMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function DoorNotInstalledMessageEvent(param1:Function)
      {
         super(param1,DoorNotInstalledMessageParser);
      }
      
      public function getParser() : DoorNotInstalledMessageParser
      {
         return var_7 as DoorNotInstalledMessageParser;
      }
   }
}
