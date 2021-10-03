package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.GetEventsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.navigator.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_818:IWindowContainer;
      
      private var var_1180:ITextWindow;
      
      private var var_189:RoomSettingsCtrl;
      
      private var var_1449:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_216:Timer;
      
      private var var_2360:IWindowContainer;
      
      private var var_1446:ITextWindow;
      
      private var var_386:IWindowContainer;
      
      private var var_2359:ITextWindow;
      
      private var var_996:IWindowContainer;
      
      private var var_215:UserDefinedRoomEventsCtrl;
      
      private var var_1698:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_803:ITextWindow;
      
      private var var_1697:IWindowContainer;
      
      private var var_1447:IWindowContainer;
      
      private var var_997:ITextWindow;
      
      private var var_1178:ITextFieldWindow;
      
      private var var_296:IWindowContainer;
      
      private var var_995:ITextWindow;
      
      private var var_1699:IButtonWindow;
      
      private var var_1179:ITextWindow;
      
      private var var_2478:int;
      
      private var var_1445:IContainerButtonWindow;
      
      private var var_998:IWindowContainer;
      
      private var var_1450:ITextWindow;
      
      private var var_1448:IContainerButtonWindow;
      
      private var var_1700:ITextWindow;
      
      private var var_929:TagRenderer;
      
      private var var_1701:IButtonWindow;
      
      private var var_2277:ITextWindow;
      
      private var var_337:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_819:ITextWindow;
      
      private var var_256:RoomThumbnailCtrl;
      
      private var var_1451:IContainerButtonWindow;
      
      private var var_2361:IWindowContainer;
      
      private var var_297:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_337 = new RoomEventViewCtrl(_navigator);
         var_189 = new RoomSettingsCtrl(_navigator,this,true);
         var_256 = new RoomThumbnailCtrl(_navigator);
         var_215 = new UserDefinedRoomEventsCtrl(_navigator);
         var_929 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_189);
         var_216 = new Timer(6000,1);
         var_216.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_189.active = true;
         this.var_337.active = false;
         this.var_256.active = false;
         this.var_215.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1698.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1701.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1697.visible = Util.hasVisibleChildren(var_1697);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_803.text = param1.roomName;
         var_803.height = NaN;
         _ownerName.text = param1.ownerName;
         var_997.text = param1.description;
         var_929.refreshTags(var_386,param1.tags);
         var_997.visible = false;
         if(param1.description != "")
         {
            var_997.height = NaN;
            var_997.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_386,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_386,"thumb_down",_loc3_,onThumbDown,0);
         var_2359.visible = _loc3_;
         var_995.visible = !_loc3_;
         var_1700.visible = !_loc3_;
         var_1700.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_386,"home",param2,null,0);
         _navigator.refreshButton(var_386,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_386,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_803.y,0);
         var_386.visible = true;
         var_386.height = Util.getLowestPoint(var_386);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function startUserDefinedRoomEventsEdit() : void
      {
         this.var_216.reset();
         this.var_189.active = false;
         this.var_337.active = false;
         this.var_256.active = false;
         this.var_215.active = true;
         _navigator.send(new GetEventsMessageComposer());
      }
      
      public function dispose() : void
      {
         if(var_216)
         {
            var_216.removeEventListener(TimerEvent.TIMER,hideInfo);
            var_216.reset();
            var_216 = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_500,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false || false)
         {
            return;
         }
         var_1699.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1449.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1451.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1445.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1448.visible = _navigator.data.canEditRoomSettings && param1;
         var_1447.visible = Util.hasVisibleChildren(var_1447);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_216.reset();
         this.var_337.active = false;
         this.var_189.active = false;
         this.var_256.active = false;
         this.var_215.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_216.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_216.reset();
         this.var_337.active = false;
         this.var_189.active = false;
         this.var_256.active = false;
         this.var_215.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_500,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_296);
         var_296.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == _navigator.data.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_189.refresh(var_296);
         this.var_256.refresh(var_296);
         this.var_215.refresh(var_296);
         Util.moveChildrenToColumn(var_296,["room_details","room_buttons"],0,2);
         var_296.height = Util.getLowestPoint(var_296);
         var_296.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1178.setSelection(0,var_1178.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_297);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_337.refresh(var_297);
         if(Util.hasVisibleChildren(var_297) && !(this.var_256.active || this.var_215.active))
         {
            Util.moveChildrenToColumn(var_297,["event_details","event_buttons"],0,2);
            var_297.height = Util.getLowestPoint(var_297);
            var_297.visible = true;
         }
         else
         {
            var_297.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_216.reset();
         this.var_337.active = true;
         this.var_189.active = false;
         this.var_256.active = false;
         this.var_215.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_216.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false || false)
         {
            return;
         }
         var_1180.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1180.height = NaN;
         var_1446.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1446.height = NaN;
         Util.moveChildrenToColumn(var_818,["public_space_name","public_space_desc"],var_1180.y,0);
         var_818.visible = true;
         var_818.height = Math.max(86,Util.getLowestPoint(var_818));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function get userDefinedRoomEventsCtrl() : UserDefinedRoomEventsCtrl
      {
         return var_215;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboRoomWidgetLib_memenu_settings_slider_button";
         if(_loc1_ && true && true && true && true)
         {
            var_998.visible = true;
            var_1178.text = this.getEmbedData();
         }
         else
         {
            var_998.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_216.reset();
         this.var_189.load(param1);
         this.var_189.active = true;
         this.var_337.active = false;
         this.var_256.active = false;
         this.var_215.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_216.reset();
         this.var_189.active = false;
         this.var_337.active = false;
         this.var_256.active = true;
         this.var_215.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_73,false);
         _window.setParamFlag(HabboWindowParam.const_1179,true);
         _window.visible = false;
         var_296 = IWindowContainer(find("room_info"));
         var_386 = IWindowContainer(find("room_details"));
         var_818 = IWindowContainer(find("public_space_details"));
         var_2361 = IWindowContainer(find("owner_name_cont"));
         var_2360 = IWindowContainer(find("rating_cont"));
         var_1447 = IWindowContainer(find("room_buttons"));
         var_803 = ITextWindow(find("room_name"));
         var_1180 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_997 = ITextWindow(find("room_desc"));
         var_1446 = ITextWindow(find("public_space_desc"));
         var_1179 = ITextWindow(find("owner_caption"));
         var_995 = ITextWindow(find("rating_caption"));
         var_2359 = ITextWindow(find("rate_caption"));
         var_1700 = ITextWindow(find("rating_txt"));
         var_297 = IWindowContainer(find("event_info"));
         var_996 = IWindowContainer(find("event_details"));
         var_1697 = IWindowContainer(find("event_buttons"));
         var_2277 = ITextWindow(find("event_name"));
         var_819 = ITextWindow(find("event_desc"));
         var_1449 = IContainerButtonWindow(find("add_favourite_button"));
         var_1451 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1445 = IContainerButtonWindow(find("make_home_button"));
         var_1448 = IContainerButtonWindow(find("unmake_home_button"));
         var_1699 = IButtonWindow(find("room_settings_button"));
         var_1698 = IButtonWindow(find("create_event_button"));
         var_1701 = IButtonWindow(find("edit_event_button"));
         var_998 = IWindowContainer(find("embed_info"));
         var_1450 = ITextWindow(find("embed_info_txt"));
         var_1178 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1449,onAddFavouriteClick);
         Util.setProcDirectly(var_1451,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1699,onRoomSettingsClick);
         Util.setProcDirectly(var_1445,onMakeHomeClick);
         Util.setProcDirectly(var_1448,onUnmakeHomeClick);
         Util.setProcDirectly(var_1698,onEventSettingsClick);
         Util.setProcDirectly(var_1701,onEventSettingsClick);
         Util.setProcDirectly(var_1178,onEmbedSrcClick);
         _navigator.refreshButton(var_1449,"favourite",true,null,0);
         _navigator.refreshButton(var_1451,"favourite",true,null,0);
         _navigator.refreshButton(var_1445,"home",true,null,0);
         _navigator.refreshButton(var_1448,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_296,onHover);
         Util.setProcDirectly(var_297,onHover);
         var_1179.width = var_1179.textWidth;
         Util.moveChildrenToRow(var_2361,["owner_caption","owner_name"],var_1179.x,var_1179.y,3);
         var_995.width = var_995.textWidth;
         Util.moveChildrenToRow(var_2360,["rating_caption","rating_txt"],var_995.x,var_995.y,3);
         var_1450.height = NaN;
         Util.moveChildrenToColumn(var_998,["embed_info_txt","embed_src_txt"],var_1450.y,2);
         var_998.height = Util.getLowestPoint(var_998) + 5;
         var_2478 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2277.text = param1.eventName;
         var_819.text = param1.eventDescription;
         var_929.refreshTags(var_996,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_819.visible = false;
         if(param1.eventDescription != "")
         {
            var_819.height = NaN;
            var_819.y = Util.getLowestPoint(var_996) + 2;
            var_819.visible = true;
         }
         var_996.visible = true;
         var_996.height = Util.getLowestPoint(var_996);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_997,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
