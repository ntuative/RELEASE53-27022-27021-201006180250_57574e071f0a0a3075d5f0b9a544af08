package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1811:int;
      
      private var var_1984:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1984 = param1.readString();
         var_1811 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1984;
      }
      
      public function get userCount() : int
      {
         return var_1811;
      }
   }
}
