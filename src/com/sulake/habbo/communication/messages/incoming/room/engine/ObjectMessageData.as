package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1059:int = 0;
      
      private var _data:String = "";
      
      private var var_1682:int = -1;
      
      private var var_35:int = 0;
      
      private var _type:int = 0;
      
      private var var_1058:int = 0;
      
      private var var_2504:String = "";
      
      private var var_1803:int = 0;
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_229:int = 0;
      
      private var var_1804:String = null;
      
      private var var_86:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_229;
      }
      
      public function get extra() : int
      {
         return var_1682;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_200)
         {
            var_229 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_200)
         {
            var_86 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_200)
         {
            var_1682 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_200)
         {
            var_35 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1803;
      }
      
      public function get staticClass() : String
      {
         return var_1804;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_200)
         {
            var_1803 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_200)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_200)
         {
            var_1804 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_200)
         {
            var_1059 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_200)
         {
            var_1058 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_87 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1059;
      }
      
      public function get x() : Number
      {
         return var_86;
      }
      
      public function get sizeY() : int
      {
         return var_1058;
      }
   }
}
