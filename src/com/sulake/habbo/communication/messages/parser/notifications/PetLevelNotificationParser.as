package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_406:String;
      
      private var var_1873:int;
      
      private var var_1932:String;
      
      private var var_1093:int;
      
      private var var_1388:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1388;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1388 = param1.readInteger();
         var_1932 = param1.readString();
         var_1873 = param1.readInteger();
         var_406 = param1.readString();
         var_1093 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1932;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function get petType() : int
      {
         return var_1093;
      }
      
      public function get level() : int
      {
         return var_1873;
      }
   }
}
