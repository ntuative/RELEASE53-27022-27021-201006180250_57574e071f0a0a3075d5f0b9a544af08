package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePart implements IFigurePart
   {
       
      
      private var var_2103:int = -1;
      
      private var var_2104:int;
      
      private var _id:int;
      
      private var _index:int;
      
      private var _type:String;
      
      private var var_1339:int = -1;
      
      public function FigurePart(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _type = String(param1.@type);
         _index = parseInt(param1.@index);
         var_2104 = parseInt(param1.@colorindex);
         var _loc2_:String = param1.@palettemapid;
         if(_loc2_ != "")
         {
            var_2103 = int(_loc2_);
         }
         var _loc3_:String = param1.@breed;
         if(_loc3_ != "")
         {
            var_1339 = int(_loc3_);
         }
      }
      
      public function get colorLayerIndex() : int
      {
         return var_2104;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function dispose() : void
      {
      }
      
      public function get paletteMap() : int
      {
         return var_2103;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get breed() : int
      {
         return var_1339;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
