package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1496:String;
      
      private var var_681:String;
      
      private var var_1498:String;
      
      private var var_1497:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1497 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1496 = _loc5_[0];
         var_1498 = _loc5_[1];
         _name = param2;
         var_681 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1496;
      }
      
      public function get languageCode() : String
      {
         return var_1497;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_681;
      }
      
      public function get encoding() : String
      {
         return var_1498;
      }
      
      public function get id() : String
      {
         return var_1497 + "_" + var_1496 + "." + var_1498;
      }
   }
}
