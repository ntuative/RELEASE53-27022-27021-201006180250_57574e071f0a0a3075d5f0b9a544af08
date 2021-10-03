package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_599:String;
      
      private var _id:int;
      
      private var var_2364:String = "";
      
      private var var_2363:int;
      
      private var var_2365:String;
      
      private var var_2226:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2363 = parseInt(param1.@pattern);
         var_599 = String(param1.@gender);
         var_2226 = Boolean(parseInt(param1.@colorable));
         var_2364 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2364;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2226;
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      public function get patternId() : int
      {
         return var_2363;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2365;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2365 = param1;
      }
   }
}
