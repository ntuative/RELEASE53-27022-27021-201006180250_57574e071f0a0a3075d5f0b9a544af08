package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1319:int;
      
      private var var_1668:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1319 = param1;
         var_1668 = param2;
         Logger.log("READ NODE: " + var_1319 + ", " + var_1668);
      }
      
      public function get nodeName() : String
      {
         return var_1668;
      }
      
      public function get nodeId() : int
      {
         return var_1319;
      }
   }
}
