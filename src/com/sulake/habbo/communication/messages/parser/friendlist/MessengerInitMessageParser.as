package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2431:int;
      
      private var var_2434:int;
      
      private var var_92:Array;
      
      private var var_240:Array;
      
      private var var_2433:int;
      
      private var var_2432:int;
      
      private var var_2436:int;
      
      private var var_2435:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_92 = new Array();
         this.var_240 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2431;
      }
      
      public function get friends() : Array
      {
         return this.var_240;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2433;
      }
      
      public function get categories() : Array
      {
         return this.var_92;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2434;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2435;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2435 = param1.readInteger();
         this.var_2433 = param1.readInteger();
         this.var_2431 = param1.readInteger();
         this.var_2436 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_92.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_240.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2434 = param1.readInteger();
         this.var_2432 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2436;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2432;
      }
   }
}
