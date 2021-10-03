package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_475:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_487:int = 0;
      
      public static const const_847:int = 2;
      
      public static const const_960:int = 1;
      
      public static const const_681:Boolean = false;
      
      public static const const_733:String = "";
      
      public static const const_466:int = 0;
      
      public static const const_382:int = 0;
      
      public static const const_505:int = 0;
       
      
      private var var_2193:int = 0;
      
      private var var_2045:String = "";
      
      private var var_1519:int = 0;
      
      private var var_2194:int = 0;
      
      private var var_2192:Number = 0;
      
      private var var_1976:int = 255;
      
      private var var_2191:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2193;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1519 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2192;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2194 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2193 = param1;
      }
      
      public function get tag() : String
      {
         return var_2045;
      }
      
      public function get alpha() : int
      {
         return var_1976;
      }
      
      public function get ink() : int
      {
         return var_1519;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2192 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2194;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2191 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2191;
      }
      
      public function set tag(param1:String) : void
      {
         var_2045 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1976 = param1;
      }
   }
}
