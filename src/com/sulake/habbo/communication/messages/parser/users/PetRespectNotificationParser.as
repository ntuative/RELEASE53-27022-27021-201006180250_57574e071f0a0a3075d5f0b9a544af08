package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1769:int;
      
      private var var_1214:PetData;
      
      private var var_1770:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1769;
      }
      
      public function get petData() : PetData
      {
         return var_1214;
      }
      
      public function flush() : Boolean
      {
         var_1214 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1770;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1769 = param1.readInteger();
         var_1770 = param1.readInteger();
         var_1214 = new PetData(param1);
         return true;
      }
   }
}
