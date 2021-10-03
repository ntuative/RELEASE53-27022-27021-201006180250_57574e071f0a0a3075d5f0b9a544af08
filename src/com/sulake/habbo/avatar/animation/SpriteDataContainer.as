package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var _id:String;
      
      private var var_1940:IAnimation;
      
      private var var_1941:Boolean;
      
      private var var_1519:int;
      
      private var var_1294:Array;
      
      private var var_1942:String;
      
      private var _dx:Array;
      
      private var var_1295:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         var_1940 = param1;
         _id = String(param2.@id);
         var_1519 = parseInt(param2.@ink);
         var_1942 = String(param2.@member);
         var_1941 = Boolean(parseInt(param2.@directions));
         _dx = [];
         var_1295 = [];
         var_1294 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            _dx[_loc4_] = parseInt(_loc3_.@dx);
            var_1295[_loc4_] = parseInt(_loc3_.@dy);
            var_1294[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function get animation() : IAnimation
      {
         return var_1940;
      }
      
      public function get hasDirections() : Boolean
      {
         return var_1941;
      }
      
      public function get member() : String
      {
         return var_1942;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < var_1294.length)
         {
            return var_1294[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < _dx.length)
         {
            return _dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < var_1295.length)
         {
            return var_1295[param1];
         }
         return 0;
      }
      
      public function get ink() : int
      {
         return var_1519;
      }
   }
}
