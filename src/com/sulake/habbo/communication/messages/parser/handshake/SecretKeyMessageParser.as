package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SecretKeyMessageParser implements IMessageParser
   {
       
      
      protected var var_2400:String;
      
      public function SecretKeyMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_2400 = param1.readString();
         return true;
      }
      
      public function get serverPublicKey() : String
      {
         return var_2400;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
