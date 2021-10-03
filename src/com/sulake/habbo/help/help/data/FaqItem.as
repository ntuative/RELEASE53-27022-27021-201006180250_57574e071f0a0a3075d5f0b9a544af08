package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1254:int;
      
      private var var_1255:String;
      
      private var var_1999:String;
      
      private var _index:int;
      
      private var var_1998:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1254 = param1;
         var_1999 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get method_1() : String
      {
         return var_1255;
      }
      
      public function get questionId() : int
      {
         return var_1254;
      }
      
      public function get questionText() : String
      {
         return var_1999;
      }
      
      public function set method_1(param1:String) : void
      {
         var_1255 = param1;
         var_1998 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1998;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
