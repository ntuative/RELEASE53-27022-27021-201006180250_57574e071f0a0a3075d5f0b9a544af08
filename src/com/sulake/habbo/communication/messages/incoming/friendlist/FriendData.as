package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_406:String;
      
      private var var_1459:String;
      
      private var var_1458:String;
      
      private var var_1218:int;
      
      private var var_599:int;
      
      private var var_1460:String;
      
      private var _name:String;
      
      private var var_1329:Boolean;
      
      private var var_737:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_599 = param1.readInteger();
         this.var_737 = param1.readBoolean();
         this.var_1329 = param1.readBoolean();
         this.var_406 = param1.readString();
         this.var_1218 = param1.readInteger();
         this.var_1458 = param1.readString();
         this.var_1459 = param1.readString();
         this.var_1460 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_599;
      }
      
      public function get realName() : String
      {
         return var_1460;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1458;
      }
      
      public function get categoryId() : int
      {
         return var_1218;
      }
      
      public function get online() : Boolean
      {
         return var_737;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1329;
      }
      
      public function get lastAccess() : String
      {
         return var_1459;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
   }
}
