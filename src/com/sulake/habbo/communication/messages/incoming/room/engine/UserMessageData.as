package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1278:String = "F";
      
      public static const const_923:String = "M";
       
      
      private var var_86:Number = 0;
      
      private var var_406:String = "";
      
      private var var_2005:int = 0;
      
      private var var_1718:String = "";
      
      private var var_1717:int = 0;
      
      private var var_1716:int = 0;
      
      private var var_1715:String = "";
      
      private var var_616:String = "";
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_229:int = 0;
      
      private var var_2004:String = "";
      
      private var _name:String = "";
      
      private var var_1719:int = 0;
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_229;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_200)
         {
            var_229 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_200)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2005;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_200)
         {
            var_1717 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2004;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_200)
         {
            var_1715 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_200)
         {
            var_2004 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_200)
         {
            var_1716 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_200)
         {
            var_406 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_200)
         {
            var_2005 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_200)
         {
            var_616 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1717;
      }
      
      public function get groupID() : String
      {
         return var_1715;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_200)
         {
            var_1719 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_200)
         {
            var_1718 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get sex() : String
      {
         return var_616;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function get webID() : int
      {
         return var_1719;
      }
      
      public function get custom() : String
      {
         return var_1718;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_87 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_200)
         {
            var_86 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_86;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1716;
      }
   }
}
