package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1123:int = 31;
      
      private static const const_1122:int = 32;
      
      private static const const_792:int = 10;
      
      private static const const_526:int = 20;
       
      
      private var var_634:Boolean = false;
      
      private var var_250:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_250 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_634)
            {
               var_634 = true;
               var_250 = new Array();
               var_250.push(const_1123);
               var_250.push(const_1122);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_792)
         {
            if(var_634)
            {
               var_634 = false;
               var_250 = new Array();
               var_250.push(const_792 + param1);
               var_250.push(const_526 + param1);
               var_250.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
