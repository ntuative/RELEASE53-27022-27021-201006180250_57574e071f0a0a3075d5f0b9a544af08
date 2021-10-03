package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1873:int;
      
      private var var_1875:int;
      
      private var var_1872:int;
      
      private var _type:int;
      
      private var var_1388:int = -1;
      
      private var var_1878:int;
      
      private var _nutrition:int;
      
      private var var_1871:int;
      
      private var _energy:int;
      
      private var var_2071:int;
      
      private var var_1874:int;
      
      private var var_2073:int;
      
      private var var_1877:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2072:Boolean;
      
      private var _name:String = "";
      
      private var var_1876:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2072;
      }
      
      public function get level() : int
      {
         return var_1873;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1871;
      }
      
      public function get id() : int
      {
         return var_1388;
      }
      
      public function get nutritionMax() : int
      {
         return var_1872;
      }
      
      public function get ownerId() : int
      {
         return var_1876;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1388 = param1.id;
         _type = param1.petType;
         var_2071 = param1.petRace;
         _image = param1.image;
         var_2072 = param1.isOwnPet;
         var_1876 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1873 = param1.level;
         var_1878 = param1.levelMax;
         var_1875 = param1.experience;
         var_1871 = param1.experienceMax;
         _energy = param1.energy;
         var_1874 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1872 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_2073 = param1.roomIndex;
         var_1877 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_2073;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1874;
      }
      
      public function get levelMax() : int
      {
         return var_1878;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_2071;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1875;
      }
      
      public function get age() : int
      {
         return var_1877;
      }
   }
}
