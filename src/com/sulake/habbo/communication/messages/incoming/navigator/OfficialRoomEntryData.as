package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1366:int = 4;
      
      public static const const_694:int = 3;
      
      public static const const_749:int = 2;
      
      public static const const_1006:int = 1;
       
      
      private var var_2207:String;
      
      private var _disposed:Boolean;
      
      private var var_1811:int;
      
      private var var_2208:Boolean;
      
      private var var_913:String;
      
      private var var_952:PublicRoomData;
      
      private var var_2205:int;
      
      private var _index:int;
      
      private var var_2204:String;
      
      private var _type:int;
      
      private var var_2045:String;
      
      private var var_953:GuestRoomData;
      
      private var var_2206:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2207 = param1.readString();
         var_2206 = param1.readString();
         var_2208 = param1.readInteger() == 1;
         var_2204 = param1.readString();
         var_913 = param1.readString();
         var_2205 = param1.readInteger();
         var_1811 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_1006)
         {
            var_2045 = param1.readString();
         }
         else if(_type == const_694)
         {
            var_952 = new PublicRoomData(param1);
         }
         else if(_type == const_749)
         {
            var_953 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2205;
      }
      
      public function get popupCaption() : String
      {
         return var_2207;
      }
      
      public function get userCount() : int
      {
         return var_1811;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2208;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1006)
         {
            return 0;
         }
         if(this.type == const_749)
         {
            return this.var_953.maxUserCount;
         }
         if(this.type == const_694)
         {
            return this.var_952.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2206;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_953 != null)
         {
            this.var_953.dispose();
            this.var_953 = null;
         }
         if(this.var_952 != null)
         {
            this.var_952.dispose();
            this.var_952 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_953;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2204;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_952;
      }
      
      public function get picRef() : String
      {
         return var_913;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_2045;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
