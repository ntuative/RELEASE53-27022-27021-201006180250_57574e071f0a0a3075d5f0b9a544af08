package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2355:XML;
      
      private var var_1695:ITextWindow;
      
      private var var_1694:ITextWindow;
      
      private var var_2352:XML;
      
      private var var_993:IWindowContainer;
      
      private var var_2477:ITextWindow;
      
      private var var_2353:String = "";
      
      private var var_2527:IButtonWindow;
      
      private var var_2354:XML;
      
      private var var_1696:ITextWindow;
      
      private var var_2356:XML;
      
      private var var_994:IButtonWindow;
      
      private var var_77:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_310:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2352) as IWindowContainer;
               break;
            case Offer.const_454:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2356) as IWindowContainer;
               break;
            case Offer.const_395:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2355) as IWindowContainer;
               break;
            case Offer.const_642:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2354) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_993 != null)
            {
               _window.removeChild(var_993);
               var_993.dispose();
            }
            var_993 = _loc2_;
            _window.addChild(_loc2_);
            var_993.x = 0;
            var_993.y = 0;
         }
         var_1696 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1694 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1695 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2477 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_994 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_994 != null)
         {
            var_994.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_994.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_77 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_77,page,var_2353);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2352 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2356 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2355 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2354 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_949,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2353 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_77 = param1.offer;
         attachStub(var_77.priceType);
         if(var_1696 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_77.priceInCredits));
            var_1696.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1694 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_77.priceInPixels));
            var_1694.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1695 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_77.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_77.priceInPixels));
            var_1695.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_994 != null)
         {
            var_994.enable();
         }
      }
   }
}
