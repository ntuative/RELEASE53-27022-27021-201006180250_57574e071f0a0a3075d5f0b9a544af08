package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1122:int = -1;
      
      private static const const_792:int = 20;
      
      private static const const_526:int = 9;
       
      
      private var var_634:Boolean = false;
      
      private var var_250:Array;
      
      public function FurnitureBottleVisualization()
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
               var_250.push(const_1122);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_634)
            {
               var_634 = false;
               var_250 = new Array();
               var_250.push(const_792);
               var_250.push(const_526 + param1);
               var_250.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
