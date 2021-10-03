package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_70:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_229:Vector3d = null;
      
      private var var_2097:int = 0;
      
      private var var_2098:String = null;
      
      private var _category:int = 0;
      
      private var var_2099:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2099 = param3;
         var_70 = new Vector3d();
         var_70.assign(param4);
         var_229 = new Vector3d();
         var_229.assign(param5);
         var_2097 = param6;
         var_2098 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_70;
      }
      
      public function get typeId() : int
      {
         return var_2097;
      }
      
      public function get dir() : Vector3d
      {
         return var_229;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2098;
      }
      
      public function get operation() : String
      {
         return var_2099;
      }
      
      public function dispose() : void
      {
         var_70 = null;
         var_229 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
