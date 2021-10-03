package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_406:String;
      
      private var var_1615:UserTagManager;
      
      private var var_764:Array;
      
      private var var_920:int = 0;
      
      private var var_447:Map;
      
      private var var_1616:Boolean = false;
      
      private var var_1614:GroupDetailsView;
      
      private var _name:String;
      
      private var var_527:int = 0;
      
      private var var_640:FurnitureDataParser;
      
      private var var_641:Array;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_19:IRoomSessionManager;
      
      private var var_1357:BadgeImageManager;
      
      private var _wallItems:Map;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1460:String;
      
      private var var_448:Map;
      
      private var var_2122:Boolean;
      
      private var _id:int;
      
      private var var_919:IgnoredUsersManager;
      
      private var var_963:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1102:HabboGroupInfoManager;
      
      private var var_599:String;
      
      private var var_918:Array;
      
      private var var_2123:Boolean;
      
      private var var_526:ProductDataParser;
      
      private var var_143:IHabboConfigurationManager;
      
      private var _respectTotal:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_764 = [];
         var_1615 = new UserTagManager(events);
         var_1102 = new HabboGroupInfoManager(this,events);
         var_919 = new IgnoredUsersManager(this);
         var_963 = new Dictionary();
         var_918 = [];
         var_641 = [];
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         var_526.removeEventListener(ProductDataParser.const_113,onProductsReady);
         var_1616 = true;
         for each(_loc2_ in var_918)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         var_918 = [];
      }
      
      public function getUserTags(param1:int) : Array
      {
         return var_1615.getTags(param1);
      }
      
      private function onCreditBalance(param1:CreditBalanceEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CreditBalanceParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(events != null)
         {
            events.dispatchEvent(new SessionCreditBalanceEvent(_loc2_.balance));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == _id)
         {
            _name = _loc3_.newName;
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var_448 = new Map();
         _wallItems = new Map();
         var_447 = new Map();
         var _loc2_:String = var_143.getKey("furnidata.load.url");
         var _loc3_:String = var_143.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_640 = new FurnitureDataParser(_loc2_,var_448,_wallItems,var_447,_localization);
         var_640.addEventListener(FurnitureDataParser.const_113,onFurnitureReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!var_1616)
         {
            loadProductData();
         }
         return var_963[param1];
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_1102.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_919.unignoreUser(param1);
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      override public function dispose() : void
      {
         if(var_448)
         {
            var_448.dispose();
            var_448 = null;
         }
         if(var_447)
         {
            var_447.dispose();
            var_447 = null;
         }
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_19)
         {
            var_19.release(new IIDHabboRoomSessionManager());
            var_19 = null;
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
         var_641 = null;
         if(var_640)
         {
            var_640.removeEventListener(FurnitureDataParser.const_113,onFurnitureReady);
            var_640.dispose();
            var_640 = null;
         }
         if(var_526)
         {
            var_526.removeEventListener(ProductDataParser.const_113,onProductsReady);
            var_526.dispose();
            var_526 = null;
         }
         super.dispose();
      }
      
      public function get systemOpen() : Boolean
      {
         return var_2122;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1357.getBadgeImage(param1,BadgeImageManager.const_965);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_143;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         _id = _loc3_.id;
         _name = _loc3_.name;
         _respectTotal = _loc3_.respectTotal;
         var_920 = _loc3_.respectLeft;
         var_527 = _loc3_.petRespectLeft;
         var_406 = _loc3_.figure;
         var_599 = _loc3_.sex;
         var_1460 = _loc3_.realName;
         var_919.initIgnoreList();
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(var_19 == null || _windowManager == null)
         {
            return;
         }
         var session:IRoomSession = var_19.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || isAnyRoomController)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_169)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return var_1102.getGroupDetails(param1);
      }
      
      public function getFloorItemDataByName(param1:String) : IFurnitureData
      {
         if(var_447 == null)
         {
            return null;
         }
         return getFloorItemData(parseInt(var_447.getValue(param1)));
      }
      
      public function get userId() : int
      {
         return _id;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_919.isIgnored(param1);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return var_527;
      }
      
      public function get realName() : String
      {
         return var_1460;
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         initBadgeImageManager();
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_2122 = _loc2_.isOpen;
         var_2123 = _loc2_.onShutDown;
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_1616)
         {
            return true;
         }
         if(var_918.indexOf(param1) == -1)
         {
            var_918.push(param1);
         }
         if(var_526 == null)
         {
            _loc2_ = var_143.getKey("productdata.load.url");
            _loc3_ = var_143.getKey("external.hash");
            _loc2_ = _loc2_.replace("%hash%",_loc3_);
            var_526 = new ProductDataParser(_loc2_,var_963);
            var_526.addEventListener(ProductDataParser.const_113,onProductsReady);
         }
         return false;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1357.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_920 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         var_920 = var_920 - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         var_143 = param2 as IHabboConfigurationManager;
         initBadgeImageManager();
         (var_143 as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(var_1614 == null)
         {
            var_1614 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = var_1102.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            var_1614.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var_640.removeEventListener(FurnitureDataParser.const_113,onFurnitureReady);
         for each(_loc2_ in var_641)
         {
            _loc2_.furniDataReady();
         }
         var_641 = [];
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_527 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         var_527 = var_527 - 1;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(false && var_641.indexOf(param1) == -1)
         {
            var_641.push(param1);
            return null;
         }
         var _loc2_:Array = var_448.getValues();
         return _loc2_.concat(_wallItems.getValues());
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_406 = _loc2_.figure;
            var_599 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(_id,var_406,var_599));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(var_143 != null)
         {
            urlString = var_143.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(var_764 == null)
         {
            return false;
         }
         return var_764.indexOf(param1) >= 0;
      }
      
      public function getWallItemDataByName(param1:String) : IFurnitureData
      {
         if(var_447 == null)
         {
            return null;
         }
         return getWallItemData(parseInt(var_447.getValue(param1)));
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_919.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         var_764 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         if(_communication == null)
         {
            return;
         }
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(onAvailabilityStatus));
         _communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(onCreditBalance));
         _communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(onPetRespectFailed));
         var_1615.communication = _communication;
         var_1102.communication = _communication;
         var_919.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_2123;
      }
      
      public function get gender() : String
      {
         return var_599;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++var_527;
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(var_448 == null)
         {
            return null;
         }
         return var_448.getValue(param1.toString());
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(var_764 == null)
         {
            return false;
         }
         return var_764.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(_wallItems == null)
         {
            return null;
         }
         return _wallItems.getValue(param1.toString());
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(var_1357 != null)
         {
            return;
         }
         if(var_143 == null || _localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         var_1357 = new BadgeImageManager(_loc1_,events,var_143,_localization);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_19 = param2 as IRoomSessionManager;
      }
      
      public function get respectLeft() : int
      {
         return var_920;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_19;
      }
      
      public function get figure() : String
      {
         return var_406;
      }
   }
}
