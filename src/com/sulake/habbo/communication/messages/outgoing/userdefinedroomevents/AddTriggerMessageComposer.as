package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class AddTriggerMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_32:Array;
      
      public function AddTriggerMessageComposer(param1:int, param2:int, param3:int, param4:String, param5:String)
      {
         var_32 = new Array();
         super();
         var_32.push(param1);
         var_32.push(param2);
         var_32.push(param3);
         var_32.push(param4);
         var_32.push(param5);
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
