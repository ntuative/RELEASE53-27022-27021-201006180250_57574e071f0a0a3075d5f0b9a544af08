package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.GetPetInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetSelectedBadgesMessageComposer;
   
   public class UserDataManager implements IUserDataManager
   {
       
      
      private var _userIds:Map;
      
      private var var_820:Map;
      
      private var var_469:Map;
      
      private var _connection:IConnection;
      
      public function UserDataManager()
      {
         super();
         var_469 = new Map();
         _userIds = new Map();
         var_820 = new Map();
      }
      
      public function removeUserDataByIndex(param1:int) : void
      {
         var _loc2_:int = _userIds.getValue(param1);
         var_469.remove(_loc2_);
         _userIds.remove(param1);
      }
      
      public function updateName(param1:int, param2:String) : void
      {
         var _loc3_:IUserData = getUserData(param1);
         if(_loc3_ != null)
         {
            _loc3_.name = param2;
         }
      }
      
      public function getUserData(param1:int) : IUserData
      {
         return var_469.getValue(param1);
      }
      
      public function getUserBadges(param1:int) : Array
      {
         if(_connection != null)
         {
            _connection.send(new GetSelectedBadgesMessageComposer(param1));
         }
         var _loc2_:* = var_820.getValue(param1) as Array;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         return _loc2_;
      }
      
      public function updateFigure(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:int = _userIds.getValue(param1);
         var _loc5_:IUserData = getUserData(_loc4_);
         if(_loc5_ != null)
         {
            _loc5_.figure = param2;
            _loc5_.sex = param3;
         }
      }
      
      public function setUserBadges(param1:int, param2:Array) : void
      {
         var_820.remove(param1);
         var_820.add(param1,param2);
      }
      
      public function setUserData(param1:IUserData) : void
      {
         var_469.remove(param1.webID);
         _userIds.remove(param1.id);
         var_469.add(param1.webID,param1);
         _userIds.add(param1.id,param1.webID);
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_469.dispose();
         var_469 = null;
         _userIds.dispose();
         var_469 = null;
         var_820.dispose();
         var_820 = null;
      }
      
      public function requestPetInfo(param1:int) : void
      {
         var _loc2_:IUserData = getUserData(param1);
         if(_loc2_ != null && _connection != null)
         {
            _connection.send(new GetPetInfoMessageComposer(_loc2_.webID));
         }
      }
      
      public function getUserDataByIndex(param1:int) : IUserData
      {
         var _loc2_:int = _userIds.getValue(param1);
         return getUserData(_loc2_);
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
