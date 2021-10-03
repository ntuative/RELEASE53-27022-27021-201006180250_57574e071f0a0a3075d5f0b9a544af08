package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_363:Number = 0.5;
      
      private static const const_768:int = 3;
      
      private static const const_1081:Number = 1;
       
      
      private var var_1845:Boolean = false;
      
      private var var_1851:Boolean = false;
      
      private var var_1048:int = 0;
      
      private var var_264:Vector3d = null;
      
      private var var_1849:int = 0;
      
      private var var_1844:int = 0;
      
      private var var_1852:Boolean = false;
      
      private var var_1843:int = -2;
      
      private var var_1847:Boolean = false;
      
      private var var_1846:int = 0;
      
      private var var_1848:int = -1;
      
      private var var_411:Vector3d = null;
      
      private var var_1850:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1849;
      }
      
      public function get targetId() : int
      {
         return var_1848;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1846 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1849 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1845 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1848 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1851 = param1;
      }
      
      public function dispose() : void
      {
         var_411 = null;
         var_264 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_411 == null)
         {
            var_411 = new Vector3d();
         }
         var_411.assign(param1);
         var_1048 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1843;
      }
      
      public function get screenHt() : int
      {
         return var_1850;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1844 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_264;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1850 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1846;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1845;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1851;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_411 != null && var_264 != null)
         {
            ++var_1048;
            _loc2_ = Vector3d.dif(var_411,var_264);
            if(_loc2_.length <= const_363)
            {
               var_264 = var_411;
               var_411 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_363 * (const_768 + 1))
               {
                  _loc2_.mul(const_363);
               }
               else if(var_1048 <= const_768)
               {
                  _loc2_.mul(const_363);
               }
               else
               {
                  _loc2_.mul(const_1081);
               }
               var_264 = Vector3d.sum(var_264,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1852 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1844;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1847 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_264 != null)
         {
            return;
         }
         var_264 = new Vector3d();
         var_264.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1852;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1847;
      }
   }
}
