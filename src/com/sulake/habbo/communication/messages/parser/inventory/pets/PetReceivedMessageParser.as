package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1030:PetData;
      
      private var var_1501:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1501 = param1.readBoolean();
         var_1030 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1501 + ", " + var_1030.id + ", " + var_1030.name + ", " + pet.figure + ", " + var_1030.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1501;
      }
      
      public function get pet() : PetData
      {
         return var_1030;
      }
   }
}
