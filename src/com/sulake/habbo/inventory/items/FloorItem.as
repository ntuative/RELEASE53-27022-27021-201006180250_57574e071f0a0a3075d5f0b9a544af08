package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2411:Boolean;
      
      protected var var_1682:Number;
      
      protected var var_2410:Boolean;
      
      protected var _type:int;
      
      protected var var_2408:Boolean;
      
      protected var var_1958:int;
      
      protected var var_2409:Boolean;
      
      protected var var_1477:String;
      
      protected var var_2300:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1525:String;
      
      protected var var_2303:Boolean;
      
      protected var _category:int;
      
      protected var var_2304:int;
      
      protected var var_2412:int;
      
      protected var var_2302:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_2303 = param5;
         var_2409 = param6;
         var_2411 = param7;
         var_2410 = param8;
         var_1477 = param9;
         var_1682 = param10;
         var_2412 = param11;
         var_2302 = param12;
         var_2304 = param13;
         var_2300 = param14;
         var_1525 = param15;
         var_1958 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2408;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1682;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2408 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1958;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2410;
      }
      
      public function get slotId() : String
      {
         return var_1525;
      }
      
      public function get expires() : int
      {
         return var_2412;
      }
      
      public function get creationYear() : int
      {
         return var_2300;
      }
      
      public function get creationDay() : int
      {
         return var_2302;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2409;
      }
      
      public function get groupable() : Boolean
      {
         return var_2303;
      }
      
      public function get creationMonth() : int
      {
         return var_2304;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2411;
      }
   }
}
