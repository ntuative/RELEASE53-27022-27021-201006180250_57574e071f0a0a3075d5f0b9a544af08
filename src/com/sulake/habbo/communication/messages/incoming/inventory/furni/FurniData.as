package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1477:String;
      
      private var var_1101:String;
      
      private var var_2263:Boolean;
      
      private var var_1682:int;
      
      private var var_2029:int;
      
      private var var_2264:Boolean;
      
      private var var_1525:String = "";
      
      private var var_2027:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1467:int;
      
      private var var_2026:Boolean;
      
      private var var_1958:int = -1;
      
      private var var_1803:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2029 = param1;
         var_1101 = param2;
         _objId = param3;
         var_1467 = param4;
         _category = param5;
         var_1477 = param6;
         var_2263 = param7;
         var_2027 = param8;
         var_2026 = param9;
         var_2264 = param10;
         var_1803 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1525;
      }
      
      public function get extra() : int
      {
         return var_1682;
      }
      
      public function get classId() : int
      {
         return var_1467;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2264;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2263;
      }
      
      public function get stripId() : int
      {
         return var_2029;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get songId() : int
      {
         return var_1958;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1525 = param1;
         var_1682 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1101;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1803;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2026;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2027;
      }
   }
}
