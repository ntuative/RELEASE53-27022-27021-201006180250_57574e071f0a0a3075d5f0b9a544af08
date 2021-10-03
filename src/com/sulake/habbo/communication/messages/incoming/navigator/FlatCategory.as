package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_371:Boolean;
      
      private var var_1319:int;
      
      private var var_1668:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1319 = param1.readInteger();
         var_1668 = param1.readString();
         var_371 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_371;
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
