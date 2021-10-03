package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class Triggerable
   {
       
      
      private var var_1389:String;
      
      private var var_1555:String;
      
      private var var_2315:int;
      
      private var var_2314:int;
      
      private var var_329:int;
      
      public function Triggerable(param1:IMessageDataWrapper)
      {
         super();
         var_329 = param1.readInteger();
         var_1389 = param1.readString();
         var_1555 = param1.readString();
         var_2314 = param1.readInteger();
         var_2315 = param1.readInteger();
      }
      
      public function get params() : String
      {
         return var_1555;
      }
      
      public function get cooldownPeriod() : int
      {
         return var_2315;
      }
      
      public function get performCount() : int
      {
         return var_2314;
      }
      
      public function get stuffId() : int
      {
         return var_329;
      }
      
      public function get stuffName() : String
      {
         return var_1389;
      }
   }
}
