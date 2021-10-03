package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ModMessageParser implements IMessageParser
   {
       
      
      private var var_681:String;
      
      private var _message:String;
      
      public function ModMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _message = "";
         var_681 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _message = param1.readString();
         var_681 = param1.readString();
         return true;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function get url() : String
      {
         return var_681;
      }
   }
}
