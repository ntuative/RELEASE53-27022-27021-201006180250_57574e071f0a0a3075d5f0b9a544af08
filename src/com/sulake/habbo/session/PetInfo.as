package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1873:int;
      
      private var var_1769:int;
      
      private var var_1875:int;
      
      private var var_1872:int;
      
      private var _nutrition:int;
      
      private var var_1388:int;
      
      private var var_1878:int;
      
      private var var_1871:int;
      
      private var _energy:int;
      
      private var var_1877:int;
      
      private var var_1874:int;
      
      private var _ownerName:String;
      
      private var var_1876:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1769 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1873 = param1;
      }
      
      public function get petId() : int
      {
         return var_1388;
      }
      
      public function get experienceMax() : int
      {
         return var_1871;
      }
      
      public function get nutritionMax() : int
      {
         return var_1872;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1878 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1876;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1388 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1874;
      }
      
      public function get respect() : int
      {
         return var_1769;
      }
      
      public function get levelMax() : int
      {
         return var_1878;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1871 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1875 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1872 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1876 = param1;
      }
      
      public function get experience() : int
      {
         return var_1875;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1874 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1877 = param1;
      }
      
      public function get age() : int
      {
         return var_1877;
      }
   }
}
