package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2322:int;
      
      private var var_1435:String = "";
      
      private var var_1166:int;
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1435 = param1;
      }
      
      public function get topicIndex() : int
      {
         return var_2322;
      }
      
      public function set topicIndex(param1:int) : void
      {
         var_2322 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1435;
      }
      
      public function flush() : void
      {
         var_1166 = 0;
         var_1435 = "";
      }
      
      public function get userSelected() : Boolean
      {
         return var_1166 > 0;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1166 = param1;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function get reportedUserId() : int
      {
         return var_1166;
      }
   }
}
