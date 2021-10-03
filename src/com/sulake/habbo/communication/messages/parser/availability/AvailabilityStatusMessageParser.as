package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1177:Boolean;
      
      private var var_1430:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1177 = param1.readInteger() > 0;
         var_1430 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1177;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1430;
      }
      
      public function flush() : Boolean
      {
         var_1177 = false;
         var_1430 = false;
         return true;
      }
   }
}
