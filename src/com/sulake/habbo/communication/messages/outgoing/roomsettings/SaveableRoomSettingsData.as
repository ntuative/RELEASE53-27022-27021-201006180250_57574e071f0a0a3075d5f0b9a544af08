package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1836:Boolean;
      
      private var var_1832:Boolean;
      
      private var var_1833:Array;
      
      private var var_1831:Boolean;
      
      private var var_1353:String;
      
      private var var_1835:int;
      
      private var var_1830:Boolean;
      
      private var var_1834:int;
      
      private var var_1218:int;
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_687:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1832 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1835;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1835 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_1830 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_687;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1831;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1833 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_687 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1836;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1832;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1218;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1831 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_1830;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1833;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1834 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1836 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1834;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1218 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1353 = param1;
      }
      
      public function get description() : String
      {
         return var_1353;
      }
   }
}
