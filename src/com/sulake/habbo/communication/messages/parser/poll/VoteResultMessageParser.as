package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1422:int;
      
      private var var_1022:String;
      
      private var var_811:Array;
      
      private var var_1113:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_811.slice();
      }
      
      public function flush() : Boolean
      {
         var_1022 = "";
         var_1113 = [];
         var_811 = [];
         var_1422 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1422;
      }
      
      public function get question() : String
      {
         return var_1022;
      }
      
      public function get choices() : Array
      {
         return var_1113.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1022 = param1.readString();
         var_1113 = [];
         var_811 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1113.push(param1.readString());
            var_811.push(param1.readInteger());
            _loc3_++;
         }
         var_1422 = param1.readInteger();
         return true;
      }
   }
}
