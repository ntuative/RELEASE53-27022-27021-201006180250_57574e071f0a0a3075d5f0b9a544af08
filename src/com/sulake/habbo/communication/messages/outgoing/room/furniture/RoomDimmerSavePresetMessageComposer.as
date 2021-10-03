package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2158:int;
      
      private var var_2157:int;
      
      private var var_2165:Boolean;
      
      private var var_2163:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2164:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2157 = param1;
         var_2158 = param2;
         var_2163 = param3;
         var_2164 = param4;
         var_2165 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2157,var_2158,var_2163,var_2164,int(var_2165)];
      }
      
      public function dispose() : void
      {
      }
   }
}
