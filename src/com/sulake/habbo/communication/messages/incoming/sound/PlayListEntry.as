package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1958:int;
      
      private var var_1957:int = 0;
      
      private var var_1955:String;
      
      private var var_1959:int;
      
      private var var_1956:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1958 = param1;
         var_1959 = param2;
         var_1956 = param3;
         var_1955 = param4;
      }
      
      public function get length() : int
      {
         return var_1959;
      }
      
      public function get name() : String
      {
         return var_1956;
      }
      
      public function get creator() : String
      {
         return var_1955;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1957;
      }
      
      public function get id() : int
      {
         return var_1958;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1957 = param1;
      }
   }
}
