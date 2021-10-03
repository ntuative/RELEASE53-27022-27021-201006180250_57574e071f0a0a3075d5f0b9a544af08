package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.BotCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ICatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGroupCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import flash.events.Event;
   
   public class CatalogPage implements ICatalogPage
   {
      
      protected static const const_1434:String = "ctlg_";
       
      
      private var _localization:IPageLocalization;
      
      private var var_51:Array;
      
      protected var var_1473:XML;
      
      protected var _window:IWindowContainer;
      
      private var var_849:String;
      
      private var _catalog:HabboCatalog;
      
      private var var_1240:EventDispatcher;
      
      private var _pageId:int;
      
      private var var_890:ICatalogViewer;
      
      private var var_587:Array;
      
      public function CatalogPage(param1:ICatalogViewer, param2:int, param3:String, param4:IPageLocalization, param5:Array, param6:HabboCatalog)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var_51 = [];
         super();
         var_890 = param1;
         _pageId = param2;
         var_849 = param3;
         _localization = param4;
         var_587 = new Array();
         _catalog = param6;
         for each(_loc7_ in param5)
         {
            _loc8_ = new Offer(_loc7_,this);
            if(_loc8_.productContainer != null)
            {
               var_587.push(_loc8_);
            }
            else
            {
               _loc8_.dispose();
            }
         }
         var_1240 = new EventDispatcher();
         var_51 = new Array();
         init();
      }
      
      public function get pageId() : int
      {
         return _pageId;
      }
      
      protected function createWindow(param1:String) : void
      {
         var _loc2_:String = const_1434 + param1;
         var _loc3_:XmlAsset = viewer.catalog.assets.getAssetByName(_loc2_) as XmlAsset;
         if(_loc3_ == null)
         {
            Logger.log("Could not find asset for layout " + _loc2_);
            return;
         }
         var_1473 = _loc3_.content as XML;
         _window = viewer.catalog.windowManager.buildFromXML(var_1473) as IWindowContainer;
         if(_window == null)
         {
            Logger.log("Could not create layout " + param1);
         }
      }
      
      public function get hasLinks() : Boolean
      {
         return _localization.hasLinks(var_849);
      }
      
      public function init() : void
      {
         createWindow(layoutCode);
         createWidgets();
      }
      
      public function get viewer() : ICatalogViewer
      {
         return var_890;
      }
      
      private function createWidgets() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_window == null)
         {
            return;
         }
         var_51.push(new LocalizationCatalogWidget(_window));
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1310) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ItemGridCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1288) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ItemGroupCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1230) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ProductViewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1224) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new SingleViewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1378) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new PurchaseCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1424) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new PurseCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1342) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ColourGridCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1358) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new TraxPreviewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1334) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new RedeemItemCodeCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1253) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new SpacesCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1319) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new TrophyCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1412) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new PetsCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1273) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new BotCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1414) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new TextInputCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1402) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new SpecialInfoWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1177) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new RecyclerCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1206) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new RecyclerPrizesCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1231) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new MarketPlaceCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1271) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new MarketPlaceOwnItemsCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1390) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ClubGiftWidget(_loc1_,_catalog.getClubGiftController()));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1295) as IWindowContainer;
         if(_loc1_ != null)
         {
            var_51.push(new ClubBuyCatalogWidget(_loc1_));
         }
         for each(_loc2_ in var_51)
         {
            _loc2_.page = this;
            _loc2_.events = var_1240;
            _loc2_.init();
         }
         var_1240.dispatchEvent(new CatalogWidgetsInitializedEvent());
      }
      
      public function get offers() : Array
      {
         return var_587;
      }
      
      private function localize() : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_51)
         {
            _loc1_.dispose();
         }
         var_51 = null;
         _localization.dispose();
         for each(_loc2_ in var_587)
         {
            _loc2_.dispose();
         }
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         var_890 = null;
         var_1473 = null;
         _pageId = 0;
         var_849 = "";
      }
      
      public function dispatchWidgetEvent(param1:Event) : Boolean
      {
         return var_1240.dispatchEvent(param1);
      }
      
      public function get localization() : IPageLocalization
      {
         return _localization;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function get links() : Array
      {
         return _localization.getLinks(var_849);
      }
      
      public function get layoutCode() : String
      {
         return var_849;
      }
   }
}
