package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1061:String = "seconds_sprite";
      
      private static const const_1060:String = "ten_minutes_sprite";
      
      private static const const_1062:String = "ten_seconds_sprite";
      
      private static const const_1063:String = "minutes_sprite";
       
      
      public function FurnitureCounterClockVisualization()
      {
         super();
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,_direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1061:
               return _loc4_ % 60 % 10;
            case const_1062:
               return _loc4_ % 60 / 10;
            case const_1063:
               return _loc4_ / 60 % 10;
            case const_1060:
               return _loc4_ / 60 / 10 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
   }
}
