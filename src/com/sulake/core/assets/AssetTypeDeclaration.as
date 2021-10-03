package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2127:Class;
      
      private var var_2126:Class;
      
      private var var_2128:String;
      
      private var var_1359:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2128 = param1;
         var_2126 = param2;
         var_2127 = param3;
         if(rest == null)
         {
            var_1359 = new Array();
         }
         else
         {
            var_1359 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2127;
      }
      
      public function get assetClass() : Class
      {
         return var_2126;
      }
      
      public function get mimeType() : String
      {
         return var_2128;
      }
      
      public function get fileTypes() : Array
      {
         return var_1359;
      }
   }
}
