package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1865:Number = 0.0;
      
      private var var_1867:Number = 0.0;
      
      private var var_1866:Number = 0.0;
      
      private var var_1868:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1867 = param1;
         var_1866 = param2;
         var_1865 = param3;
         var_1868 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1867;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1865;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1866;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1868;
      }
   }
}
