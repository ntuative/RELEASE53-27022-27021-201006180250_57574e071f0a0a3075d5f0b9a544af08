package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_2255:Number = 1.0;
      
      private var var_150:Number = 1.0;
      
      private var var_2197:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2197 = param1;
         var_150 = param2;
         var_2255 = param3;
      }
      
      public function get scale() : Number
      {
         return var_150;
      }
      
      public function get heightScale() : Number
      {
         return var_2255;
      }
   }
}
