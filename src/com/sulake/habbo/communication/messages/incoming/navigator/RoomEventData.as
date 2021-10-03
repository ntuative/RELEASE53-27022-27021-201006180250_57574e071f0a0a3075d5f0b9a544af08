package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2277:String;
      
      private var var_425:int;
      
      private var var_2282:String;
      
      private var var_2281:String;
      
      private var var_2278:int;
      
      private var var_2280:String;
      
      private var var_2279:int;
      
      private var var_687:Array;
      
      private var var_1153:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_687 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1153 = false;
            return;
         }
         this.var_1153 = true;
         var_2278 = int(_loc2_);
         var_2282 = param1.readString();
         var_425 = int(param1.readString());
         var_2279 = param1.readInteger();
         var_2277 = param1.readString();
         var_2281 = param1.readString();
         var_2280 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_687.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2279;
      }
      
      public function get eventName() : String
      {
         return var_2277;
      }
      
      public function get eventDescription() : String
      {
         return var_2281;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2282;
      }
      
      public function get tags() : Array
      {
         return var_687;
      }
      
      public function get creationTime() : String
      {
         return var_2280;
      }
      
      public function get exists() : Boolean
      {
         return var_1153;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2278;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_425;
      }
   }
}
