package com.sulake.habbo.tracking
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.HabboCatalogTrackingEvent;
   import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
   import com.sulake.habbo.communication.enum.HabboHotelViewEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogIndexMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.help.enum.HabboHelpTrackingEvent;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.localization.enum.LocalizationEvent;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowTrackingEvent;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   import iid.IIDHabboWindowManager;
   
   public class HabboTracking extends Component implements IHabboTracking, IUpdateReceiver
   {
      
      private static const const_821:uint = 11;
      
      private static var _instance:HabboTracking;
       
      
      private var var_254:LatencyTracker = null;
      
      private var var_253:PerformanceTracker = null;
      
      private var var_572:FramerateTracker = null;
      
      private var var_275:IAdManager;
      
      private var _roomEngine:IRoomEngine = null;
      
      private var _coreComponent:CoreComponent;
      
      private var var_156:IHabboHelp;
      
      private var var_1161:int = -1;
      
      private var var_983:LagWarningLogger = null;
      
      private var var_982:IHabboWindowManager;
      
      private var var_1676:int = 0;
      
      private var var_1426:Array;
      
      private var _crashed:Boolean = false;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _navigator:IHabboNavigator;
      
      private var _catalog:IHabboCatalog;
      
      private var var_186:IHabboFriendList;
      
      private var var_11:IHabboInventory;
      
      private var var_2292:Boolean = false;
      
      private var var_2525:Boolean = false;
      
      private var var_1675:int = 0;
      
      private var var_51:IRoomWidgetFactory;
      
      private var var_143:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _connection:IConnection = null;
      
      public function HabboTracking(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         if(_instance == null)
         {
            _instance = this;
         }
         super(param1,param2,param3);
         var_253 = new PerformanceTracker();
         var_572 = new FramerateTracker();
         var_254 = new LatencyTracker();
         var_983 = new LagWarningLogger();
         var_1426 = new Array(const_821);
         var _loc4_:int = 0;
         while(_loc4_ < const_821)
         {
            var_1426[_loc4_] = 0;
            _loc4_++;
         }
         var _loc5_:CoreComponent = param1 as CoreComponent;
         if(_loc5_ != null)
         {
            _loc5_.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onError);
            _loc5_.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onCoreRunning);
            _coreComponent = _loc5_;
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1185,new Date().getTime().toString());
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1364,!true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown");
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1197,Capabilities.serverString);
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_628,String(false));
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_869,String(0));
         }
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboNavigator(),onNavigatorReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboFriendList(),onFriendlistReady);
         queueInterface(new IIDHabboRoomWidget(),onRoomWidgetReady);
         queueInterface(new IIDHabboHelp(),onHelpReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         registerUpdateReceiver(this,1);
      }
      
      public static function getInstance() : HabboTracking
      {
         return _instance;
      }
      
      private function onRoomAdClick(param1:RoomObjectRoomAdEvent) : void
      {
         legacyTrack("room_ad","click",[getAliasFromAdTechUrl(param1.clickUrl)]);
      }
      
      private function onConnectionEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboCommunicationEvent.INIT:
               trackLoginStep(HabboLoginTrackingStep.const_1407);
               break;
            case HabboCommunicationEvent.const_621:
               trackLoginStep(HabboLoginTrackingStep.const_1201,String(_communication.port));
               break;
            case HabboCommunicationEvent.const_246:
               trackLoginStep(HabboLoginTrackingStep.const_246);
               break;
            case HabboCommunicationEvent.const_172:
               trackLoginStep(HabboLoginTrackingStep.const_172);
               break;
            case HabboCommunicationEvent.const_182:
               setErrorContextFlag(2,0);
               trackLoginStep(HabboLoginTrackingStep.const_182);
               break;
            case HabboCommunicationEvent.const_212:
               setErrorContextFlag(3,0);
               trackLoginStep(HabboLoginTrackingStep.const_212);
               if(var_254 != null)
               {
                  var_254.init();
               }
         }
         if(_communication)
         {
            Component(context).events.removeEventListener(param1.type,onConnectionEvent);
         }
      }
      
      private function onRoomWidgetReady(param1:IID, param2:IUnknown) : void
      {
         var_51 = param2 as IRoomWidgetFactory;
         Component(var_51).events.addEventListener(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE,onWidgetTrackingEvent);
         Component(var_51).events.addEventListener(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT,onWidgetTrackingEvent);
         Component(var_51).events.addEventListener(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE,onWidgetTrackingEvent);
         Component(var_51).events.addEventListener(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS,onWidgetTrackingEvent);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
            if(var_253 != null)
            {
               var_253.connection = param1;
            }
            if(var_254 != null)
            {
               var_254.communication = _communication;
               var_254.connection = param1;
            }
            if(var_983 != null)
            {
               var_983.connection = param1;
            }
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _catalog = IHabboCatalog(param2) as IHabboCatalog;
         _catalog.events.addEventListener(CatalogPageOpenedEvent.CATALOG_PAGE_OPENED,onCatalogPageOpened);
         _catalog.events.addEventListener(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN,onCatalogTrackingEvent);
         _catalog.events.addEventListener(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE,onCatalogTrackingEvent);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_143 = IHabboConfigurationManager(param2);
         if(var_143)
         {
            Component(var_143).events.addEventListener(HabboConfigurationEvent.const_174,onConfigurationLoaded);
            if(var_254 != null)
            {
               var_254.configuration = var_143;
            }
            if(var_253 != null)
            {
               var_253.configuration = var_143;
            }
         }
      }
      
      private function onRoomSettingsTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED:
               setErrorContextFlag(0,7);
               break;
            case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT:
               setErrorContextFlag(1,7);
               break;
            case HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED:
               setErrorContextFlag(2,7);
         }
      }
      
      private function onCatalogTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN:
               setErrorContextFlag(1,9);
               break;
            case HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE:
               setErrorContextFlag(0,9);
         }
      }
      
      public function legacyTrack(param1:String, param2:String, param3:Array = null) : void
      {
         Logger.log("legacyTrack(" + param1 + ", " + param2 + ", " + param3 + ")");
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.legacyTrack",param1,param2,param3 == null ? [] : param3);
         }
         else
         {
            Logger.log("com.sulake.habbo.tracking: ExternalInterface is not available, tracking is disabled");
         }
      }
      
      private function onWidgetTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE:
               setErrorContextFlag(0,8);
               break;
            case HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT:
               setErrorContextFlag(1,8);
               break;
            case HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE:
               setErrorContextFlag(2,8);
               break;
            case HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS:
               setErrorContextFlag(3,8);
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_275 = param2 as IAdManager;
         var_275.events.addEventListener(AdEvent.const_394,onRoomAdLoad);
      }
      
      private function onInvetoryTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED:
               setErrorContextFlag(0,5);
               break;
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI:
               setErrorContextFlag(1,5);
               break;
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS:
               setErrorContextFlag(2,5);
               break;
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES:
               setErrorContextFlag(3,5);
               break;
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS:
               setErrorContextFlag(4,5);
               break;
            case HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING:
               setErrorContextFlag(5,5);
         }
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         if(!var_2292)
         {
            trackLoginStep(HabboLoginTrackingStep.const_1311);
            var_2292 = true;
         }
         var _loc2_:RoomEntryInfoMessageParser = RoomEntryInfoMessageEvent(param1).getParser();
         if(_loc2_.guestRoom)
         {
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_869,String(_loc2_.guestRoomId));
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_628,String(true));
            legacyTrack("navigator","private",[_loc2_.guestRoomId]);
         }
         else if(_loc2_.publicSpace != null)
         {
            if(_loc2_.publicSpace.worldId == 0)
            {
               legacyTrack("navigator","public",[_loc2_.publicSpace.unitPropertySet]);
            }
            else
            {
               legacyTrack("navigator","public",[_loc2_.publicSpace.unitPropertySet + "/" + _loc2_.publicSpace.worldId]);
            }
         }
      }
      
      private function onFriendlistTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED:
               setErrorContextFlag(0,6);
               break;
            case HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS:
               setErrorContextFlag(1,6);
               break;
            case HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH:
               setErrorContextFlag(2,6);
               break;
            case HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST:
               setErrorContextFlag(3,6);
               break;
            case HabboFriendListTrackingEvent.const_330:
               setErrorContextFlag(4,6);
         }
      }
      
      private function onRoomAdLoad(param1:AdEvent) : void
      {
         legacyTrack("room_ad","show",[getAliasFromAdTechUrl(param1.clickUrl)]);
      }
      
      private function setErrorContextFlag(param1:uint, param2:uint) : void
      {
         var_1426[param2] = param1;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(_instance == this)
            {
               _instance = null;
            }
            if(_communication)
            {
               _communication.release(new IIDHabboCommunicationManager());
               _communication = null;
            }
            if(var_143)
            {
               var_143.release(new IIDHabboConfigurationManager());
               var_143 = null;
            }
            if(_localization)
            {
               _localization.release(new IIDHabboLocalizationManager());
               _localization = null;
            }
            if(var_982)
            {
               var_982.release(new IIDHabboWindowManager());
               var_982 = null;
            }
            if(var_275)
            {
               var_275.release(new IIDHabboAdManager());
               var_275 = null;
            }
            if(var_51)
            {
               var_51.release(new IIDHabboRoomWidget());
               var_51 = null;
            }
            if(_navigator)
            {
               if(true)
               {
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH,onNavigatorTrackingEvent);
                  _navigator.events.removeEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED,onRoomSettingsTrackingEvent);
                  _navigator.events.removeEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT,onRoomSettingsTrackingEvent);
                  _navigator.events.removeEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED,onRoomSettingsTrackingEvent);
                  _navigator.events.removeEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS,onRoomSettingsTrackingEvent);
               }
               _navigator.release(new IIDHabboNavigator());
               _navigator = null;
            }
            if(_catalog)
            {
               if(true)
               {
                  _catalog.events.removeEventListener(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE,onCatalogTrackingEvent);
                  _catalog.events.removeEventListener(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN,onCatalogTrackingEvent);
               }
               _catalog.release(new IIDHabboCatalog());
               _catalog = null;
            }
            if(var_11)
            {
               if(true)
               {
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED,onInvetoryTrackingEvent);
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI,onInvetoryTrackingEvent);
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS,onInvetoryTrackingEvent);
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES,onInvetoryTrackingEvent);
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS,onInvetoryTrackingEvent);
                  Component(var_11).events.removeEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING,onInvetoryTrackingEvent);
               }
               var_11.release(new IIDHabboInventory());
               var_11 = null;
            }
            if(var_186)
            {
               if(true)
               {
                  Component(var_186).events.removeEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED,onFriendlistTrackingEvent);
                  Component(var_186).events.removeEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS,onFriendlistTrackingEvent);
                  Component(var_186).events.removeEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH,onFriendlistTrackingEvent);
                  Component(var_186).events.removeEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST,onFriendlistTrackingEvent);
                  Component(var_186).events.removeEventListener(HabboFriendListTrackingEvent.const_330,onFriendlistTrackingEvent);
               }
               var_186.release(new IIDHabboFriendList());
               var_186 = null;
            }
            if(var_156)
            {
               if(true)
               {
                  var_156.events.removeEventListener(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED,onHelpTrackingEvent);
                  var_156.events.removeEventListener(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT,onHelpTrackingEvent);
               }
               var_156.release(new IIDHabboHelp());
               var_156 = null;
            }
            if(_roomEngine)
            {
               if(true)
               {
                  Component(_roomEngine).events.removeEventListener(AvatarWalkWarpingWarningEvent.const_481,onLagWarningEvent);
               }
               _roomEngine.release(new IIDRoomEngine());
               _roomEngine = null;
            }
            removeUpdateReceiver(this);
            if(var_253 != null)
            {
               var_253.dispose();
               var_253 = null;
            }
            if(var_572 != null)
            {
               var_572.dispose();
               var_572 = null;
            }
            if(var_254 != null)
            {
               var_254.dispose();
               var_254 = null;
            }
            _connection = null;
            super.dispose();
         }
      }
      
      private function onRoomLeave(param1:CloseConnectionMessageEvent) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_628,String(false));
      }
      
      private function onWindowEvent(param1:Event) : void
      {
         if(param1.type == HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_SLEEP)
         {
            setErrorContextFlag(0,3);
         }
         else if(param1.type == HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_RENDER)
         {
            setErrorContextFlag(1,3);
         }
         else if(param1.type == HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_INPUT)
         {
            setErrorContextFlag(2,3);
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _communication = IHabboCommunicationManager(param2);
         if(_communication != null)
         {
            _communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(onAuthOK));
            _communication.addHabboConnectionMessageEvent(new RoomEntryInfoMessageEvent(onRoomEnter));
            _communication.addHabboConnectionMessageEvent(new CatalogIndexMessageEvent(onOpenCatalogue));
            _communication.addHabboConnectionMessageEvent(new HabboAchievementNotificationMessageEvent(onAchievementNotification));
            _connection = _communication.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
         Component(context).events.addEventListener(HabboCommunicationEvent.INIT,onConnectionEvent);
         Component(context).events.addEventListener(HabboCommunicationEvent.const_621,onConnectionEvent);
         Component(context).events.addEventListener(HabboCommunicationEvent.const_246,onConnectionEvent);
         Component(context).events.addEventListener(HabboCommunicationEvent.const_182,onConnectionEvent);
         Component(context).events.addEventListener(HabboCommunicationEvent.const_172,onConnectionEvent);
         Component(context).events.addEventListener(HabboCommunicationEvent.const_212,onConnectionEvent);
         Component(context).events.addEventListener(HabboHotelViewEvent.const_766,onHotelViewEvent);
         Component(context).events.addEventListener(HabboHotelViewEvent.const_64,onHotelViewEvent);
         Component(context).events.addEventListener(HabboHotelViewEvent.const_502,onHotelViewEvent);
      }
      
      private function onOpenCatalogue(param1:IMessageEvent) : void
      {
         legacyTrack("catalogue","open");
      }
      
      private function onLagWarningEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case AvatarWalkWarpingWarningEvent.const_481:
               var_983.warpingDetected();
         }
      }
      
      private function onCatalogPageOpened(param1:CatalogPageOpenedEvent) : void
      {
         legacyTrack("catalogue","page",[param1.pageLocalization]);
      }
      
      private function onConfigurationLoaded(param1:Event) : void
      {
         setErrorContextFlag(1,0);
         trackLoginStep(HabboLoginTrackingStep.const_174);
         if(var_143)
         {
            if(var_983 != null)
            {
               var_983.configure(var_143);
            }
            if(var_572 != null)
            {
               var_572.configure(var_143);
            }
            Component(var_143).events.removeEventListener(HabboConfigurationEvent.const_174,onConfigurationLoaded);
         }
      }
      
      private function onLocalizationLoaded(param1:Event) : void
      {
         setErrorContextFlag(1,1);
         trackLoginStep(HabboLoginTrackingStep.const_93);
         if(_localization)
         {
            Component(_localization).events.removeEventListener(LocalizationEvent.const_93,onLocalizationLoaded);
         }
      }
      
      private function onHelpReady(param1:IID, param2:IUnknown) : void
      {
         var_156 = param2 as IHabboHelp;
         var_156.events.addEventListener(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED,onHelpTrackingEvent);
         var_156.events.addEventListener(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT,onHelpTrackingEvent);
      }
      
      public function logError(param1:String) : void
      {
         Logger.log("logError(" + param1 + ")");
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.logError",param1);
         }
         else
         {
            Logger.log("com.sulake.habbo.tracking: ExternalInterface is not available, tracking is disabled");
         }
      }
      
      private function onCoreRunning(param1:Event) : void
      {
         trackLoginStep(HabboLoginTrackingStep.const_956);
         if(_coreComponent != null)
         {
            _coreComponent.events.removeEventListener(HabboLoginTrackingStep.const_956,onCoreRunning);
         }
      }
      
      private function onHelpTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED:
               setErrorContextFlag(0,10);
               break;
            case HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT:
               setErrorContextFlag(1,10);
         }
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _navigator = IHabboNavigator(param2) as IHabboNavigator;
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH,onNavigatorTrackingEvent);
         _navigator.events.addEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED,onRoomSettingsTrackingEvent);
         _navigator.events.addEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT,onRoomSettingsTrackingEvent);
         _navigator.events.addEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED,onRoomSettingsTrackingEvent);
         _navigator.events.addEventListener(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS,onRoomSettingsTrackingEvent);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_982 = IHabboWindowManager(param2);
         if(var_982)
         {
            Component(context).events.addEventListener(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_INPUT,onWindowEvent);
            Component(context).events.addEventListener(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_RENDER,onWindowEvent);
            Component(context).events.addEventListener(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_SLEEP,onWindowEvent);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = getTimer();
         if(var_1161 > -1 && _loc2_ < var_1161)
         {
            ++var_1675;
            ErrorReportStorage.addDebugData("Invalid time counter","Invalid times: " + var_1675);
         }
         if(var_1161 > -1 && _loc2_ - var_1161 > 15000)
         {
            ++var_1676;
            ErrorReportStorage.addDebugData("Time leap counter","Time leaps: " + var_1676);
         }
         var_1161 = _loc2_;
         if(var_253 != null)
         {
            var_253.update(param1);
         }
         if(var_254 != null)
         {
            var_254.update(param1);
         }
         if(var_572 != null)
         {
            var_572.trackUpdate(param1,this);
         }
      }
      
      public function trackLoginStep(param1:String, param2:String = null) : void
      {
         if(var_143 != null && !Boolean(var_143.getKey("processlog.enabled")))
         {
            return;
         }
         Logger.log("* Track Login Step: " + param1);
         if(false)
         {
            if(param2 != null)
            {
               ExternalInterface.call("FlashExternalInterface.logLoginStep",param1,param2);
            }
            else
            {
               ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
            }
         }
         else
         {
            Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
         }
      }
      
      private function onNavigatorTrackingEvent(param1:Event) : void
      {
         switch(param1.type)
         {
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED:
               setErrorContextFlag(0,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS:
               setErrorContextFlag(1,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS:
               setErrorContextFlag(2,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME:
               setErrorContextFlag(3,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL:
               setErrorContextFlag(4,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH:
               setErrorContextFlag(5,4);
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS:
               legacyTrack("navigator","latest_events");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES:
               legacyTrack("navigator","my_favorites");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS:
               legacyTrack("navigator","my_friends_rooms");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY:
               legacyTrack("navigator","my_history");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS:
               legacyTrack("navigator","my_rooms");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS:
               legacyTrack("navigator","official_rooms");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS:
               legacyTrack("navigator","popular_rooms");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE:
               legacyTrack("navigator","rooms_where_my_friends_are");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE:
               legacyTrack("navigator","highest_score");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH:
               legacyTrack("navigator","tag_search");
               break;
            case HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH:
               legacyTrack("navigator","text_search");
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomEngine = param2 as IRoomEngine;
         if(_roomEngine == null)
         {
            return;
         }
         Component(_roomEngine).events.addEventListener(AvatarWalkWarpingWarningEvent.const_481,onLagWarningEvent);
         Component(_roomEngine).events.addEventListener(RoomObjectRoomAdEvent.const_271,onRoomAdClick);
      }
      
      private function getAliasFromAdTechUrl(param1:String) : String
      {
         var _loc2_:Array = param1.match(/;alias=([^;]+)/);
         if(_loc2_ != null && _loc2_.length > 1)
         {
            return _loc2_[1];
         }
         return "unknown";
      }
      
      private function onAchievementNotification(param1:HabboAchievementNotificationMessageEvent) : void
      {
         legacyTrack("achievement","achievement",[param1.badgeID]);
      }
      
      public function track(param1:String, param2:String, param3:int = -1) : void
      {
         Logger.log("track(" + param1 + ", " + param2 + ", " + param3 + ")");
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.track",param1,param2,param3);
         }
         else
         {
            Logger.log("com.sulake.habbo.tracking: ExternalInterface is not available, tracking is disabled");
         }
      }
      
      private function onAuthOK(param1:IMessageEvent) : void
      {
         legacyTrack("authentication","authok");
      }
      
      private function onInventoryReady(param1:IID, param2:IUnknown) : void
      {
         var_11 = param2 as IHabboInventory;
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_CLOSED,onInvetoryTrackingEvent);
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI,onInvetoryTrackingEvent);
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS,onInvetoryTrackingEvent);
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES,onInvetoryTrackingEvent);
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS,onInvetoryTrackingEvent);
         Component(var_11).events.addEventListener(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING,onInvetoryTrackingEvent);
      }
      
      private function onFriendlistReady(param1:IID, param2:IUnknown) : void
      {
         var_186 = param2 as IHabboFriendList;
         Component(var_186).events.addEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED,onFriendlistTrackingEvent);
         Component(var_186).events.addEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_FRIENDS,onFriendlistTrackingEvent);
         Component(var_186).events.addEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_SEARCH,onFriendlistTrackingEvent);
         Component(var_186).events.addEventListener(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_REQUEST,onFriendlistTrackingEvent);
         Component(var_186).events.addEventListener(HabboFriendListTrackingEvent.const_330,onFriendlistTrackingEvent);
      }
      
      private function onError(param1:ErrorEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1.critical && !_crashed)
         {
            _crashed = true;
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_20,new Date().getTime().toString());
            if(var_143)
            {
               if(var_143.keyExists("client.fatal.error.url"))
               {
                  _loc2_ = var_143.getKey("client.fatal.error.url");
                  _loc3_ = new URLRequest(_loc2_);
                  _loc4_ = new URLVariables();
                  _loc5_ = ErrorReportStorage.getParameterNames();
                  _loc6_ = _loc5_.length;
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_)
                  {
                     _loc4_[_loc5_[_loc7_]] = ErrorReportStorage.getParameter(_loc5_[_loc7_]);
                     _loc7_++;
                  }
                  _loc8_ = "";
                  for each(_loc9_ in var_1426)
                  {
                     _loc8_ += String(_loc9_);
                  }
                  _loc4_["null"] = _loc8_;
                  if(var_253 != null)
                  {
                     _loc4_["null"] = var_253.flashVersion;
                     _loc4_["null"] = var_253.averageUpdateInterval;
                  }
                  ErrorReportStorage.addDebugData("Flash memory usage","Memory usage: " + Math.round(0 / (1024 * 1024)) + " MB");
                  _loc4_["null"] = ErrorReportStorage.getDebugData();
                  _loc3_.data = _loc4_;
                  _loc3_.method = URLRequestMethod.POST;
                  navigateToURL(_loc3_,"_self");
               }
            }
         }
         logError(_coreComponent.getLastErrorMessage());
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _localization = IHabboLocalizationManager(param2);
         if(_localization)
         {
            Component(_localization).events.addEventListener(LocalizationEvent.const_93,onLocalizationLoaded);
         }
      }
      
      private function onHotelViewEvent(param1:Event) : void
      {
         if(param1.type == HabboHotelViewEvent.const_766)
         {
            trackLoginStep(HabboLoginTrackingStep.const_1349);
         }
         else if(param1.type == HabboHotelViewEvent.const_502)
         {
            trackLoginStep(HabboLoginTrackingStep.const_1421);
         }
         else if(param1.type == HabboHotelViewEvent.const_64)
         {
            trackLoginStep(HabboLoginTrackingStep.const_1420);
         }
      }
   }
}
