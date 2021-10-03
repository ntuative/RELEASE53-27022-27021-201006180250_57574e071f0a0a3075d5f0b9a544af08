package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvents;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1445:int = 10;
       
      
      private var var_1735:Boolean;
      
      private var var_1733:int;
      
      private var var_1206:int;
      
      private var var_1729:Boolean;
      
      private var var_1025:Array;
      
      private var var_830:Dictionary;
      
      private var var_1024:Array;
      
      private var var_2430:int;
      
      private var var_1731:int;
      
      private var var_1730:UserDefinedRoomEvents;
      
      private var var_1487:int;
      
      private var var_1728:int;
      
      private var var_1727:int;
      
      private var var_585:PublicRoomShortData;
      
      private var var_397:RoomEventData;
      
      private var var_123:MsgWithRequestId;
      
      private var var_1734:Boolean;
      
      private var var_1732:Array;
      
      private var _navigator:HabboNavigator;
      
      private var var_1726:Boolean;
      
      private var var_194:GuestRoomData;
      
      private var var_693:Boolean;
      
      private var var_586:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1025 = new Array();
         var_1024 = new Array();
         var_830 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_123 != null && var_123 as PopularRoomTagsData != null;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1726;
      }
      
      public function startLoading() : void
      {
         this.var_693 = true;
      }
      
      public function get createdFlatId() : int
      {
         return var_1733;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1726 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_397 != null)
         {
            var_397.dispose();
         }
         var_397 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function get homeRoomId() : int
      {
         return var_1487;
      }
      
      public function get stuffStates() : Array
      {
         return var_1732;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_123 != null && var_123 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_123 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_194;
      }
      
      public function get allCategories() : Array
      {
         return var_1025;
      }
      
      public function onRoomExit() : void
      {
         if(var_397 != null)
         {
            var_397.dispose();
            var_397 = null;
         }
         if(var_585 != null)
         {
            var_585.dispose();
            var_585 = null;
         }
         if(var_194 != null)
         {
            var_194.dispose();
            var_194 = null;
         }
         var_586 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_693 = false;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_194 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1487 == _loc1_;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_693 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_585 = null;
         var_194 = null;
         var_586 = false;
         if(param1.guestRoom)
         {
            var_586 = param1.owner;
         }
         else
         {
            var_585 = param1.publicSpace;
            var_397 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return var_586;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2430 = param1.limit;
         this.var_1206 = param1.favouriteRoomIds.length;
         this.var_830 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_830[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_123 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return var_1735;
      }
      
      public function set stuffStates(param1:Array) : void
      {
         var_1732 = param1;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_585;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_693 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1727 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_194 != null && var_586;
      }
      
      public function get userDefinedRoomEvents() : UserDefinedRoomEvents
      {
         return var_1730;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1729;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1025 = param1;
         var_1024 = new Array();
         for each(_loc2_ in var_1025)
         {
            if(_loc2_.visible)
            {
               var_1024.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1731;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1728;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1024;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_123 == null)
         {
            return;
         }
         var_123.dispose();
         var_123 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         var_1735 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_397;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_830[param1] = !!param2 ? "yes" : null;
         var_1206 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_123 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1727;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_123 != null && var_123 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1729 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1731 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1734 = param1;
      }
      
      public function set userDefinedRoomEvents(param1:UserDefinedRoomEvents) : void
      {
         var_1730 = param1;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_693;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         var_1487 = param1;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1206 >= var_2430;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_194 != null)
         {
            var_194.dispose();
         }
         var_194 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1728 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1734;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_194 != null && !var_586;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1733 = param1;
      }
   }
}
