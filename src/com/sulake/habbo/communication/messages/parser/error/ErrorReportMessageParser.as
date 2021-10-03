package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1463:int;
      
      private var var_1341:int;
      
      private var var_1462:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1463;
      }
      
      public function flush() : Boolean
      {
         var_1341 = 0;
         var_1463 = 0;
         var_1462 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1341;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1463 = param1.readInteger();
         var_1341 = param1.readInteger();
         var_1462 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1462;
      }
   }
}
