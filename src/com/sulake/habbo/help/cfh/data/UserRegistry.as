package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1164:int = 80;
       
      
      private var var_568:Map;
      
      private var var_803:String = "";
      
      private var var_1419:Array;
      
      public function UserRegistry()
      {
         var_568 = new Map();
         var_1419 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_568.getValue(var_1419.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_803;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_568.getValue(param1) != null)
         {
            var_568.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_803);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_803 == "")
         {
            var_1419.push(param1);
         }
         var_568.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_568;
      }
      
      public function unregisterRoom() : void
      {
         var_803 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_568.length > const_1164)
         {
            _loc1_ = var_568.getKey(0);
            var_568.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_803 = param1;
         if(var_803 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
