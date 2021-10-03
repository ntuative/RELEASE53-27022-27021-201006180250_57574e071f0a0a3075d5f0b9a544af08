package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1738:Array;
      
      private var var_1741:String;
      
      private var var_1740:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1741 = param1;
         var_1738 = param2;
         var_1740 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1741;
      }
      
      public function get yieldList() : Array
      {
         return var_1738;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1740;
      }
   }
}
