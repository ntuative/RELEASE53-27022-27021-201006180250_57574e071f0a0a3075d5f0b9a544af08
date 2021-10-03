package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1811:int;
      
      private var var_2166:String;
      
      private var var_2168:int;
      
      private var var_2167:int;
      
      private var var_749:Boolean;
      
      private var var_1831:Boolean;
      
      private var var_425:int;
      
      private var var_1353:String;
      
      private var var_1834:int;
      
      private var var_1218:int;
      
      private var _ownerName:String;
      
      private var var_803:String;
      
      private var var_2169:int;
      
      private var var_2170:RoomThumbnailData;
      
      private var var_1917:Boolean;
      
      private var var_687:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_687 = new Array();
         super();
         var_425 = param1.readInteger();
         var_749 = param1.readBoolean();
         var_803 = param1.readString();
         _ownerName = param1.readString();
         var_1834 = param1.readInteger();
         var_1811 = param1.readInteger();
         var_2169 = param1.readInteger();
         var_1353 = param1.readString();
         var_2168 = param1.readInteger();
         var_1917 = param1.readBoolean();
         var_2167 = param1.readInteger();
         var_1218 = param1.readInteger();
         var_2166 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_687.push(_loc4_);
            _loc3_++;
         }
         var_2170 = new RoomThumbnailData(param1);
         var_1831 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2169;
      }
      
      public function get roomName() : String
      {
         return var_803;
      }
      
      public function get userCount() : int
      {
         return var_1811;
      }
      
      public function get score() : int
      {
         return var_2167;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2166;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1917;
      }
      
      public function get tags() : Array
      {
         return var_687;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1831;
      }
      
      public function get event() : Boolean
      {
         return var_749;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_687 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1218;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2168;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2170;
      }
      
      public function get doorMode() : int
      {
         return var_1834;
      }
      
      public function get flatId() : int
      {
         return var_425;
      }
      
      public function get description() : String
      {
         return var_1353;
      }
   }
}
