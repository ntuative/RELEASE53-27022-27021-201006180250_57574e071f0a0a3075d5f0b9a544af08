package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1877:int;
      
      private var var_406:String;
      
      private var var_1873:int;
      
      private var var_1769:int;
      
      private var var_1875:int;
      
      private var var_2286:int;
      
      private var _nutrition:int;
      
      private var var_1388:int;
      
      private var var_2287:int;
      
      private var var_2285:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1876:int;
      
      private var var_2288:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1873;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2286;
      }
      
      public function flush() : Boolean
      {
         var_1388 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2287;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2285;
      }
      
      public function get maxNutrition() : int
      {
         return var_2288;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1769;
      }
      
      public function get petId() : int
      {
         return var_1388;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1388 = param1.readInteger();
         _name = param1.readString();
         var_1873 = param1.readInteger();
         var_2287 = param1.readInteger();
         var_1875 = param1.readInteger();
         var_2285 = param1.readInteger();
         _energy = param1.readInteger();
         var_2286 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2288 = param1.readInteger();
         var_406 = param1.readString();
         var_1769 = param1.readInteger();
         var_1876 = param1.readInteger();
         var_1877 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1875;
      }
      
      public function get ownerId() : int
      {
         return var_1876;
      }
      
      public function get age() : int
      {
         return var_1877;
      }
   }
}
