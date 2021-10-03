package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_224:String = "RWUIUE_PEER";
      
      public static const const_217:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1425:String = "BOT";
      
      public static const const_995:int = 2;
      
      public static const const_1347:int = 0;
      
      public static const const_870:int = 3;
       
      
      private var var_406:String = "";
      
      private var var_1458:String = "";
      
      private var var_2376:Boolean = false;
      
      private var var_1716:int = 0;
      
      private var var_1973:int = 0;
      
      private var var_2375:Boolean = false;
      
      private var var_1460:String = "";
      
      private var var_2377:Boolean = false;
      
      private var var_920:int = 0;
      
      private var var_2379:Boolean = true;
      
      private var var_1184:int = 0;
      
      private var var_2378:Boolean = false;
      
      private var var_1205:Boolean = false;
      
      private var var_2374:Boolean = false;
      
      private var var_1972:int = 0;
      
      private var var_2371:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_291:Array;
      
      private var var_1202:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1719:int = 0;
      
      private var var_2372:Boolean = false;
      
      private var var_2373:int = 0;
      
      private var var_1974:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_291 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1973;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1973 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2376;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2379;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2379 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2377 = param1;
      }
      
      public function get motto() : String
      {
         return var_1458;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2378 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1205;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1458 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2372;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1974;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1205 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2371;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1972 = param1;
      }
      
      public function get badges() : Array
      {
         return var_291;
      }
      
      public function get amIController() : Boolean
      {
         return var_2375;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2375 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2372 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2373 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1974 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1460 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2377;
      }
      
      public function set figure(param1:String) : void
      {
         var_406 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1972;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1202;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2378;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_920 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2373;
      }
      
      public function get realName() : String
      {
         return var_1460;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
      
      public function set webID(param1:int) : void
      {
         var_1719 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_291 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2374 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2371 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_920;
      }
      
      public function get webID() : int
      {
         return var_1719;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1184 = param1;
      }
      
      public function get xp() : int
      {
         return var_1716;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2376 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1184;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2374;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1202 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1716 = param1;
      }
   }
}
