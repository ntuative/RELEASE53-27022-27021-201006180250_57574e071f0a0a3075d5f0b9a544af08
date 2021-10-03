package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_230:String = "e";
      
      public static const const_84:String = "i";
      
      public static const const_82:String = "s";
       
      
      private var var_1077:String;
      
      private var var_1314:String;
      
      private var var_1313:int;
      
      private var var_2339:int;
      
      private var var_1078:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1314 = param1.readString();
         var_2339 = param1.readInteger();
         var_1077 = param1.readString();
         var_1078 = param1.readInteger();
         var_1313 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1078;
      }
      
      public function get productType() : String
      {
         return var_1314;
      }
      
      public function get expiration() : int
      {
         return var_1313;
      }
      
      public function get furniClassId() : int
      {
         return var_2339;
      }
      
      public function get extraParam() : String
      {
         return var_1077;
      }
   }
}
