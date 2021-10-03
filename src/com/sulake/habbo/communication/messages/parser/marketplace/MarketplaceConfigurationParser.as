package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_2066:int;
      
      private var var_1595:int;
      
      private var var_2068:int;
      
      private var var_2067:int;
      
      private var var_2064:int;
      
      private var var_1596:int;
      
      private var var_2063:int;
      
      private var var_1247:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_2066;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1595;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_2063;
      }
      
      public function get offerMinPrice() : int
      {
         return var_2067;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_2064;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1596;
      }
      
      public function get commission() : int
      {
         return var_2068;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1247 = param1.readBoolean();
         var_2068 = param1.readInteger();
         var_1595 = param1.readInteger();
         var_1596 = param1.readInteger();
         var_2067 = param1.readInteger();
         var_2066 = param1.readInteger();
         var_2064 = param1.readInteger();
         var_2063 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1247;
      }
   }
}
