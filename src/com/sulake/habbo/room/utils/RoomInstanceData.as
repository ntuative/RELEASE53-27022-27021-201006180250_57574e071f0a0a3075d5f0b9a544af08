package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_945:LegacyWallGeometry = null;
      
      private var var_657:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_656:TileHeightMap = null;
      
      private var var_2197:String = null;
      
      private var _roomId:int = 0;
      
      private var var_655:SelectedRoomObjectData = null;
      
      private var var_944:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_945 = new LegacyWallGeometry();
         var_944 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_657 != null)
         {
            var_657.dispose();
         }
         var_657 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_656 != null)
         {
            var_656.dispose();
         }
         var_656 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2197 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_945;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_655;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_944;
      }
      
      public function dispose() : void
      {
         if(var_656 != null)
         {
            var_656.dispose();
            var_656 = null;
         }
         if(var_945 != null)
         {
            var_945.dispose();
            var_945 = null;
         }
         if(var_944 != null)
         {
            var_944.dispose();
            var_944 = null;
         }
         if(var_657 != null)
         {
            var_657.dispose();
            var_657 = null;
         }
         if(var_655 != null)
         {
            var_655.dispose();
            var_655 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_656;
      }
      
      public function get worldType() : String
      {
         return var_2197;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_655 != null)
         {
            var_655.dispose();
         }
         var_655 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_657;
      }
   }
}
