package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_1777:int;
      
      private var var_1776:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         var_1777 = param1;
         var_1776 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1777,var_1776];
      }
   }
}
