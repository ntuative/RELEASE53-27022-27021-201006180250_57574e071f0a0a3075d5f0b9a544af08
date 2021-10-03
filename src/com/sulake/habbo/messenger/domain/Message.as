package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_727:int = 2;
      
      public static const const_1010:int = 6;
      
      public static const const_700:int = 1;
      
      public static const const_764:int = 3;
      
      public static const const_826:int = 4;
      
      public static const const_647:int = 5;
       
      
      private var var_2155:String;
      
      private var var_1167:int;
      
      private var var_1983:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1167 = param2;
         var_1983 = param3;
         var_2155 = param4;
      }
      
      public function get time() : String
      {
         return var_2155;
      }
      
      public function get senderId() : int
      {
         return var_1167;
      }
      
      public function get messageText() : String
      {
         return var_1983;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
