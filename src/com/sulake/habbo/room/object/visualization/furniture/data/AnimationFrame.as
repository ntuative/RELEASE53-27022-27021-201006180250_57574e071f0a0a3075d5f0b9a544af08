package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_680:int = -1;
      
      public static const const_863:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1772:int = -1;
      
      private var var_86:int = 0;
      
      private var var_1215:int = 1;
      
      private var var_836:int = 1;
      
      private var var_1773:Boolean = false;
      
      private var var_1771:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_86 = param2;
         _y = param3;
         var_1773 = param5;
         if(param4 < 0)
         {
            param4 = const_680;
         }
         var_836 = param4;
         var_1215 = param4;
         if(param6 >= 0)
         {
            var_1772 = param6;
            var_1771 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_836 > 0 && param1 > var_836)
         {
            param1 = var_836;
         }
         var_1215 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_836;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1771;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_836 < 0)
         {
            return const_680;
         }
         return var_1215;
      }
      
      public function get activeSequence() : int
      {
         return var_1772;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1773;
      }
      
      public function get x() : int
      {
         return var_86;
      }
   }
}
