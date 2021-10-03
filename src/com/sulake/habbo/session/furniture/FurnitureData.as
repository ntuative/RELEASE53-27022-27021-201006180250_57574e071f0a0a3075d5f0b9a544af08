package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1653:String = "e";
      
      public static const const_1495:String = "i";
      
      public static const const_1565:String = "s";
       
      
      private var _id:int;
      
      private var var_2243:String;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_2242:int;
      
      private var var_1442:Array;
      
      private var var_2244:int;
      
      private var var_2245:int;
      
      private var var_2246:int;
      
      private var _name:String;
      
      private var _revision:int;
      
      private var var_1353:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_2242 = param4;
         _revision = param5;
         var_2244 = param6;
         var_2245 = param7;
         var_2246 = param8;
         var_1442 = param9;
         _title = param10;
         var_1353 = param11;
         var_2243 = param12;
      }
      
      public function get tileSizeY() : int
      {
         return var_2245;
      }
      
      public function get tileSizeZ() : int
      {
         return var_2246;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get adUrl() : String
      {
         return var_2243;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return _revision;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_2242;
      }
      
      public function get tileSizeX() : int
      {
         return var_2244;
      }
      
      public function get colours() : Array
      {
         return var_1442;
      }
      
      public function get description() : String
      {
         return var_1353;
      }
   }
}
