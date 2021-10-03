package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1101:String;
      
      private var var_1967:int;
      
      private var var_2306:int;
      
      private var var_1682:int;
      
      private var var_2300:int;
      
      private var _category:int;
      
      private var var_2526:int;
      
      private var var_2302:int;
      
      private var var_2305:int;
      
      private var var_2301:int;
      
      private var var_2304:int;
      
      private var var_2303:Boolean;
      
      private var var_1477:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1967 = param1;
         var_1101 = param2;
         var_2306 = param3;
         var_2301 = param4;
         _category = param5;
         var_1477 = param6;
         var_1682 = param7;
         var_2305 = param8;
         var_2302 = param9;
         var_2304 = param10;
         var_2300 = param11;
         var_2303 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2301;
      }
      
      public function get extra() : int
      {
         return var_1682;
      }
      
      public function get stuffData() : String
      {
         return var_1477;
      }
      
      public function get groupable() : Boolean
      {
         return var_2303;
      }
      
      public function get creationMonth() : int
      {
         return var_2304;
      }
      
      public function get roomItemID() : int
      {
         return var_2306;
      }
      
      public function get itemType() : String
      {
         return var_1101;
      }
      
      public function get itemID() : int
      {
         return var_1967;
      }
      
      public function get songID() : int
      {
         return var_1682;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2305;
      }
      
      public function get creationYear() : int
      {
         return var_2300;
      }
      
      public function get creationDay() : int
      {
         return var_2302;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
