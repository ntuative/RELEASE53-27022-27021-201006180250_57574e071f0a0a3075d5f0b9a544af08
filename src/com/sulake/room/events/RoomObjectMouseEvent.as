package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1655:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1486:String = "ROE_MOUSE_ENTER";
      
      public static const const_494:String = "ROE_MOUSE_MOVE";
      
      public static const const_1641:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_219:String = "ROE_MOUSE_CLICK";
      
      public static const const_463:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2083:Boolean;
      
      private var var_2080:Boolean;
      
      private var var_2081:Boolean;
      
      private var var_2082:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2081 = param4;
         var_2082 = param5;
         var_2083 = param6;
         var_2080 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2080;
      }
      
      public function get altKey() : Boolean
      {
         return var_2081;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2082;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2083;
      }
   }
}
