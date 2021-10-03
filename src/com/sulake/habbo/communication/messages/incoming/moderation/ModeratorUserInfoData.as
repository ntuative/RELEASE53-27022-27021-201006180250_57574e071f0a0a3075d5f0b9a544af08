package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2056:int;
      
      private var var_2058:int;
      
      private var var_2059:int;
      
      private var _userName:String;
      
      private var var_2057:int;
      
      private var var_2060:int;
      
      private var var_2055:int;
      
      private var _userId:int;
      
      private var var_737:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2060 = param1.readInteger();
         var_2057 = param1.readInteger();
         var_737 = param1.readBoolean();
         var_2059 = param1.readInteger();
         var_2058 = param1.readInteger();
         var_2056 = param1.readInteger();
         var_2055 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2055;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_737;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2057;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2058;
      }
      
      public function get cautionCount() : int
      {
         return var_2056;
      }
      
      public function get cfhCount() : int
      {
         return var_2059;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2060;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
