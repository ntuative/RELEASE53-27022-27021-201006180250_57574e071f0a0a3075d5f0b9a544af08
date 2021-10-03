package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1123:int = 31;
      
      private static const const_1122:int = 32;
      
      private static const const_527:int = 30;
      
      private static const const_792:int = 20;
      
      private static const const_526:int = 10;
       
      
      private var var_634:Boolean = false;
      
      private var var_250:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_250 = new Array();
         super();
         super.setAnimation(const_527);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_526)
         {
            if(var_634)
            {
               var_634 = false;
               var_250 = new Array();
               if(_direction == 2)
               {
                  var_250.push(const_792 + 5 - param1);
                  var_250.push(const_526 + 5 - param1);
               }
               else
               {
                  var_250.push(const_792 + param1);
                  var_250.push(const_526 + param1);
               }
               var_250.push(const_527);
               return;
            }
            super.setAnimation(const_527);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
