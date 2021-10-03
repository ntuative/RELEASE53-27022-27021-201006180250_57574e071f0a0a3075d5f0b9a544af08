package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_406:String = "";
      
      private var var_1718:String = "";
      
      private var var_1717:int = 0;
      
      private var var_1716:int = 0;
      
      private var _type:int = 0;
      
      private var var_1715:String = "";
      
      private var var_616:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1719:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1717 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1715 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_406 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_616 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1717;
      }
      
      public function set webID(param1:int) : void
      {
         var_1719 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1715;
      }
      
      public function set custom(param1:String) : void
      {
         var_1718 = param1;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function get sex() : String
      {
         return var_616;
      }
      
      public function get custom() : String
      {
         return var_1718;
      }
      
      public function get webID() : int
      {
         return var_1719;
      }
      
      public function set xp(param1:int) : void
      {
         var_1716 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1716;
      }
   }
}
