package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1415:int = 1;
      
      public static const const_1337:int = 4;
      
      public static const const_1669:int = 2;
      
      public static const const_1207:int = 1;
      
      public static const const_1270:int = 0;
      
      public static const const_1581:int = 0;
      
      public static const const_1369:int = 3;
       
      
      private var var_32:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         var_32 = new Array();
         super();
         this.var_32.push(param1);
         this.var_32.push(param2);
         this.var_32.push(param3);
         this.var_32.push(param4);
         this.var_32.push(param5);
         this.var_32.push(param6);
         this.var_32.push(false);
         this.var_32.push(false);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_32;
      }
      
      public function dispose() : void
      {
         this.var_32 = null;
      }
   }
}
