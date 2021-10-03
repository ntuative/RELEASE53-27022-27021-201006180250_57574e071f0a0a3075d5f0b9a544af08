package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_176:String;
      
      private var var_420:int;
      
      private var var_212:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_176 = param1;
         var_212 = param2;
         var_420 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_212.text = var_176.substring(0,param1) + "...";
         return var_212.textHeight > var_420;
      }
   }
}
