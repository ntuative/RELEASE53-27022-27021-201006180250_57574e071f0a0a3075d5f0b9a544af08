package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_643:Array;
      
      private var var_1336:int;
      
      private var var_1500:Array;
      
      private var var_642:Array;
      
      private var var_1247:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1247 = _loc2_.isWrappingEnabled;
         var_1336 = _loc2_.wrappingPrice;
         var_1500 = _loc2_.stuffTypes;
         var_642 = _loc2_.boxTypes;
         var_643 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_643;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1500;
      }
      
      public function get price() : int
      {
         return var_1336;
      }
      
      public function get boxTypes() : Array
      {
         return var_642;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1247;
      }
   }
}
