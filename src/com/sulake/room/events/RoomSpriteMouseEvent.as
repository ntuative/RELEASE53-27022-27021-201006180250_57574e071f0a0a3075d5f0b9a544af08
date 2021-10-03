package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2080:Boolean = false;
      
      private var var_2081:Boolean = false;
      
      private var var_2324:String = "";
      
      private var _type:String = "";
      
      private var var_2083:Boolean = false;
      
      private var var_1897:Number = 0;
      
      private var var_2323:Number = 0;
      
      private var var_2326:Number = 0;
      
      private var var_2325:String = "";
      
      private var var_1895:Number = 0;
      
      private var var_2082:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2325 = param2;
         var_2324 = param3;
         var_2323 = param4;
         var_2326 = param5;
         var_1897 = param6;
         var_1895 = param7;
         var_2082 = param8;
         var_2081 = param9;
         var_2083 = param10;
         var_2080 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2082;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2080;
      }
      
      public function get localX() : Number
      {
         return var_1897;
      }
      
      public function get localY() : Number
      {
         return var_1895;
      }
      
      public function get canvasId() : String
      {
         return var_2325;
      }
      
      public function get altKey() : Boolean
      {
         return var_2081;
      }
      
      public function get spriteTag() : String
      {
         return var_2324;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2323;
      }
      
      public function get screenY() : Number
      {
         return var_2326;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2083;
      }
   }
}
