package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1104:int = 1;
      
      private static const const_1122:int = 3;
      
      private static const const_1106:int = 2;
      
      private static const const_1105:int = 15;
       
      
      private var var_879:int;
      
      private var var_250:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_250 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1106)
         {
            var_250 = new Array();
            var_250.push(const_1104);
            var_879 = const_1105;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_879 > 0)
         {
            --var_879;
         }
         if(var_879 == 0)
         {
            if(false)
            {
               super.setAnimation(var_250.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
