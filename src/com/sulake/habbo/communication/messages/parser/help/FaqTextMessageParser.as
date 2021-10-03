package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1254:int;
      
      private var var_1255:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1254;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1254 = param1.readInteger();
         var_1255 = param1.readString();
         return true;
      }
      
      public function get method_1() : String
      {
         return var_1255;
      }
      
      public function flush() : Boolean
      {
         var_1254 = -1;
         var_1255 = null;
         return true;
      }
   }
}
