package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_425:int;
      
      private var var_1319:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_425;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_425 = param1.readInteger();
         var_1319 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_425 = 0;
         var_1319 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1319;
      }
   }
}
