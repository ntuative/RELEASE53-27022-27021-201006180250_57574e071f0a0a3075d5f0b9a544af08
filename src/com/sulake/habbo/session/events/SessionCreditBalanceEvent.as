package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class SessionCreditBalanceEvent extends Event
   {
      
      public static const const_171:String = "session_credit_balance";
       
      
      private var var_2041:int;
      
      public function SessionCreditBalanceEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_171,param2,param3);
         var_2041 = param1;
      }
      
      public function get credits() : int
      {
         return var_2041;
      }
   }
}
