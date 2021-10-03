package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_87:Number = 0;
      
      private var _data:String = "";
      
      private var var_1682:int = 0;
      
      private var var_35:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1896:Boolean = false;
      
      private var var_2504:String = "";
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_229:String = "";
      
      private var var_1898:int = 0;
      
      private var var_1899:int = 0;
      
      private var var_1897:int = 0;
      
      private var var_1895:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1896 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1896;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_229;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1897 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1898 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1899 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_200)
         {
            var_229 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1895 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_200)
         {
            var_35 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1897;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_200)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1898;
      }
      
      public function get wallY() : Number
      {
         return var_1899;
      }
      
      public function get localY() : Number
      {
         return var_1895;
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_87 = param1;
         }
      }
   }
}
