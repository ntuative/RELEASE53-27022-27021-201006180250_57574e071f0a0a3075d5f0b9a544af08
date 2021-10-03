package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_627:RoomObjectLocationCacheItem = null;
      
      private var var_188:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_627 = new RoomObjectLocationCacheItem(param1);
         var_188 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_627;
      }
      
      public function dispose() : void
      {
         if(var_627 != null)
         {
            var_627.dispose();
            var_627 = null;
         }
         if(var_188 != null)
         {
            var_188.dispose();
            var_188 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_188;
      }
   }
}
