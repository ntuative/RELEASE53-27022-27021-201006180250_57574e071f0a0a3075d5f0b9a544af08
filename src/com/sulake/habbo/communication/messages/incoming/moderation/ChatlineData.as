package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1518:String;
      
      private var var_1795:int;
      
      private var var_1797:int;
      
      private var var_1796:int;
      
      private var var_1798:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1795 = param1.readInteger();
         var_1796 = param1.readInteger();
         var_1797 = param1.readInteger();
         var_1798 = param1.readString();
         var_1518 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1518;
      }
      
      public function get hour() : int
      {
         return var_1795;
      }
      
      public function get minute() : int
      {
         return var_1796;
      }
      
      public function get chatterName() : String
      {
         return var_1798;
      }
      
      public function get chatterId() : int
      {
         return var_1797;
      }
   }
}
