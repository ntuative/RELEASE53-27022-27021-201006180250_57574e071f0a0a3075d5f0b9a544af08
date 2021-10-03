package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1569:int = -1;
      
      private var var_1303:Boolean;
      
      private var var_1302:String;
      
      private var var_1965:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1965 = String(param1["set-type"]);
         var_1302 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1303 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1569 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1302;
      }
      
      public function get staticId() : int
      {
         return var_1569;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1569 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1303;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1303 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1302 = param1;
      }
      
      public function get setType() : String
      {
         return var_1965;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
