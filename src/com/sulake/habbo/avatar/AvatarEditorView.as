package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.events.AvatarEditorSavedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1705:IWindowContainer;
      
      public static var var_1469:IWindowContainer;
      
      public static var var_2397:int = 6710886;
       
      
      private var var_1630:Boolean = true;
      
      private var var_1115:Array;
      
      private var var_368:Timer;
      
      private var var_538:ITabSelectorWindow;
      
      private var _window:IWindowContainer;
      
      private var var_537:IFrameWindow;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2171:Boolean = true;
      
      private var var_1629:String;
      
      private var var_1025:Array;
      
      private var var_263:String;
      
      private var _controller:HabboAvatarEditor;
      
      private var var_2172:Number = 0;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:IHabboWindowManager, param3:IHabboCatalog, param4:Array, param5:Boolean)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var_1115 = [];
         var_1025 = [AvatarEditorFigureCategory.const_721,AvatarEditorFigureCategory.const_45,AvatarEditorFigureCategory.const_241,AvatarEditorFigureCategory.const_672,AvatarEditorFigureCategory.HOTLOOKS,AvatarEditorFigureCategory.const_97];
         super();
         _controller = param1;
         _windowManager = param2;
         _catalog = param3;
         if(var_1469 == null)
         {
            _loc7_ = _controller.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1469 = _controller.windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         }
         if(var_1705 == null)
         {
            _loc8_ = _controller.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1705 = _controller.windowManager.buildFromXML(_loc8_.content as XML) as IWindowContainer;
         }
         var_368 = new Timer(1000);
         var_368.addEventListener(TimerEvent.TIMER,onUpdate);
         if(param4 == null)
         {
            param4 = var_1025;
         }
         for each(_loc6_ in param4)
         {
            var_1115.push(_loc6_);
         }
         createWindow(param5);
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.type == WindowEvent.const_61)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != var_263)
            {
               _controller.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(_controller.hasInvalidClubItems())
                  {
                     displayStripClubDialog();
                     return;
                  }
                  _loc4_ = _controller.figureData.getFigureString();
                  _controller.saveCurrentSelection();
                  var_2172 = new Date().valueOf();
                  var_1630 = false;
                  var_368.start();
                  _window.findChildByName("save").disable();
                  _controller.events.dispatchEvent(new AvatarEditorSavedEvent(_loc4_));
                  break;
               case "cancel":
                  _controller.close();
                  break;
               case "wardrobe":
                  toggleWardrobe();
            }
            if(param2.name == "header_button_close")
            {
               hide();
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(_catalog)
         {
            _catalog.openCatalogPage(CatalogPageName.const_245,true);
         }
      }
      
      public function update() : void
      {
         var _loc1_:IWindowContainer = _controller.figureData.view.window;
         var _loc2_:IWindowContainer = _window.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         var _loc3_:IContainerButtonWindow = _window.findChildByName("wardrobe") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = _controller.sessionData.hasUserRight("fuse_use_wardrobe") && _controller.isWardrobeAllowed();
         }
         var _loc4_:String = "null";
         if(_controller.sessionData.hasUserRight("fuse_use_wardrobe") && (var_1629 == AvatarEditorSideCategory.const_97 || var_2171))
         {
            if(_controller.isWardrobeAllowed())
            {
               _loc4_ = "null";
            }
         }
         if(_controller.isClubTryoutAllowed() && true)
         {
            _loc4_ = "null";
         }
         setSideContent(_loc4_);
         setViewToCategory(var_263);
      }
      
      public function toggle() : void
      {
         _window.visible = true;
         if(false)
         {
            var_368.start();
         }
         else
         {
            var_368.stop();
         }
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Array = var_1025;
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _window.findChildByName(_loc2_) as IWindowContainer;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
               if(_loc4_ != null)
               {
                  _loc5_ = _controller.assets.getAssetByName("ae_tabs_" + _loc2_) as BitmapDataAsset;
                  _loc6_ = (_loc5_.content as BitmapData).clone();
                  _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
                  _loc7_ = (_loc4_.width - _loc6_.width) / 2;
                  _loc8_ = (_loc4_.height - _loc6_.height) / 2;
                  _loc4_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_,_loc8_));
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_368 != null)
         {
            var_368.stop();
            var_368.removeEventListener(TimerEvent.TIMER,onUpdate);
            var_368 = null;
         }
         if(_window != null)
         {
            _loc1_ = _window.findChildByName("figureContainer") as IWindowContainer;
            if(_loc1_ != null)
            {
               while(_loc1_.numChildren > 0)
               {
                  _loc1_.removeChildAt(0);
               }
            }
            _loc2_ = _window.findChildByName("contentArea") as IWindowContainer;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren > 0)
               {
                  _loc2_.removeChildAt(0);
               }
            }
            _loc3_ = _window.findChildByName("sideContainer") as IWindowContainer;
            if(_loc3_ != null)
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
            _window.dispose();
            _window = null;
         }
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_537)
         {
            _loc1_ = _controller.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               throw new Error("Failed to initialize strip club info dialog; missing asset!");
            }
            _loc2_ = _loc1_.content as XML;
            var_537 = _windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            var_537.procedure = stripClubDialogEventProc;
            var_537.center();
         }
         else
         {
            var_537.visible = true;
            var_537.center();
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function createWindow(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(_window == null)
         {
            if(param1)
            {
               _window = _windowManager.buildFromXML((_controller.assets.getAssetByName("AvatarEditor") as XmlAsset).content as XML) as IWindowContainer;
            }
            else
            {
               _window = _windowManager.buildFromXML((_controller.assets.getAssetByName("AvatarEditorSimple") as XmlAsset).content as XML) as IWindowContainer;
            }
            _loc3_ = _windowManager.buildFromXML((_controller.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML) as IWindowContainer;
            _window.addChild(_loc3_);
         }
         _window.procedure = windowEventProc;
         var_538 = _window.findChildByName("mainTabs") as ITabSelectorWindow;
         var _loc2_:int = -1;
         while(_loc2_ >= 0)
         {
            _loc4_ = var_538.getSelectableAt(_loc2_);
            if(_loc4_ != null && var_1115.indexOf(_loc4_.name) < 0)
            {
               _loc5_ = var_538.removeSelectable(_loc4_);
               _loc6_ = _loc2_ + 1;
               while(_loc6_ < var_538.numSelectables)
               {
                  var_538.getSelectableAt(_loc6_).x = var_538.getSelectableAt(_loc6_).x - _loc5_.width;
                  _loc6_++;
               }
            }
            _loc2_--;
         }
         attachImages();
         update();
      }
      
      private function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_2172 > 5000;
      }
      
      public function validateAvailableCategories(param1:Array) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return validateAvailableCategories(var_1025);
         }
         if(param1.length != var_1115.length)
         {
            return false;
         }
         for each(_loc2_ in param1)
         {
            if(var_1115.indexOf(_loc2_) < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  var_537.visible = false;
                  break;
               case "strip_button_ok":
                  if(_controller)
                  {
                     _controller.stripClubItems();
                  }
                  var_537.visible = false;
                  break;
               case "strip_button_club_info":
                  openCatalogClubPage();
                  var_537.visible = false;
            }
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(canChangeOutfit())
         {
            var_1630 = canChangeOutfit();
            var_368.stop();
            if(_window)
            {
               _window.findChildByName("save").enable();
            }
         }
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc2_:IWindowContainer = _window.findChildByName("sideContainer") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarEditorSideCategory.const_619:
               break;
            case AvatarEditorSideCategory.const_482:
               _loc3_ = _controller.getSideContentWindowContainer(AvatarEditorSideCategory.const_482);
               break;
            case AvatarEditorSideCategory.const_97:
               _loc3_ = _controller.getSideContentWindowContainer(AvatarEditorSideCategory.const_97);
         }
         _loc2_.removeChildAt(0);
         _loc2_.invalidate();
         if(_loc3_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.visible = true;
            _loc2_.width = _loc3_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         var_1629 = param1;
      }
      
      private function toggleWardrobe() : void
      {
         if(var_1629 == AvatarEditorSideCategory.const_97)
         {
            var_2171 = false;
            setSideContent(AvatarEditorSideCategory.const_619);
         }
         else
         {
            setSideContent(AvatarEditorSideCategory.const_97);
         }
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         setViewToCategory(param1);
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = _controller.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         var_263 = param1;
         var_538.setSelected(var_538.getSelectableByName(param1));
         _window.invalidate();
      }
      
      public function show() : void
      {
         _window.visible = true;
      }
   }
}
