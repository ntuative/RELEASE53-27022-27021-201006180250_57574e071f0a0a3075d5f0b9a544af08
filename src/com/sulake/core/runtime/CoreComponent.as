package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.runtime.events.LibraryProgressEvent;
   import com.sulake.core.runtime.events.WarningEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.LibraryLoaderQueue;
   import com.sulake.core.utils.ZipLoader;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_142:uint = 3;
      
      private static const const_1150:String = "zip-libraries";
      
      private static const const_1152:String = "library";
      
      private static const const_1156:String = "library";
      
      private static const const_1155:String = "asset-libraries";
      
      private static const const_1151:String = "library";
      
      private static const const_1154:String = "service-libraries";
      
      private static const const_1149:String = "library";
      
      private static const const_1153:String = "component-libraries";
       
      
      private var var_791:IEventDispatcher;
      
      private var var_957:Profiler;
      
      private var var_284:uint;
      
      private var var_550:Array;
      
      private var var_285:LibraryLoaderQueue;
      
      private var var_659:Array;
      
      private var var_792:ProfilerViewer;
      
      private var var_249:uint;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_683 = (param2 & 0) == Core.CORE_SETUP_DEBUG;
         var_550 = new Array();
         var_659 = new Array();
         var_221 = param1;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_142)
         {
            var_550.push(new Array());
            var_659.push(0);
            _loc3_++;
         }
         var_284 = getTimer();
         attachComponent(this,[new IIDCore()]);
         switch(param2 & 0)
         {
            case Core.const_1244:
               debug("Core; using simple frame update handler");
               var_221.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_827:
               debug("Core; using complex frame update handler");
               var_221.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1343:
               debug("Core; using profiler frame update handler");
               var_221.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_957 = new Profiler(this);
               attachComponent(var_957,[new IIDProfiler()]);
               var_792 = new ProfilerViewer();
               var_221.addChild(var_792);
               break;
            case Core.CORE_SETUP_DEBUG:
               debug("Core; using debug frame update handler");
               var_221.addEventListener(Event.ENTER_FRAME,debugFrameUpdateHandler);
         }
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,Core.const_1333);
         if(!_isDisposed)
         {
            updateLoadingProcess(param1);
         }
      }
      
      override public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_142)
         {
            _loc3_ = var_550[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getNumberOfFilesLoaded() : uint
      {
         return var_249 - getNumberOfFilesPending();
      }
      
      private function updateLoadingProgress(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         if(var_791)
         {
            _loc2_ = param1.target as LibraryLoader;
            var_791.dispatchEvent(new LibraryProgressEvent(_loc2_.url,param1.bytesLoaded,param1.bytesTotal,_loc2_.elapsedTime));
         }
      }
      
      private function debugFrameUpdateHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc2_:uint = getTimer();
         var _loc3_:uint = _loc2_ - var_284;
         var_284 = _loc2_;
         _loc4_ = 0;
         while(_loc4_ < CoreComponent.const_142)
         {
            var_659[_loc4_] = 0;
            _loc5_ = var_550[_loc4_];
            _loc8_ = 0;
            _loc7_ = uint(_loc5_.length);
            while(_loc8_ != _loc7_)
            {
               _loc6_ = IUpdateReceiver(_loc5_[_loc8_]);
               if(_loc6_ == null || _loc6_.disposed)
               {
                  _loc5_.splice(_loc8_,1);
                  _loc7_--;
               }
               else
               {
                  _loc6_.update(_loc3_);
                  _loc8_++;
               }
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_1010;
      }
      
      public function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void
      {
         var node:XML = null;
         var list:XMLList = null;
         var item:XML = null;
         var url:String = null;
         var loader:LibraryLoader = null;
         var config:XML = param1;
         var loadingEventDelegate:IEventDispatcher = param2;
         var context:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain,null);
         debug("Parsing config document");
         var_791 = loadingEventDelegate;
         if(var_285 == null)
         {
            var_285 = new LibraryLoaderQueue(var_683);
         }
         try
         {
            node = config.child(const_1150)[0];
            if(node != null)
            {
               list = node.child(const_1152);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new ZipLoader(context,true,var_683);
                  assets.loadFromFile(loader,true);
                  loader.load(new URLRequest(url));
                  var_285.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_249;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse zip libraries from config xml!",true,Core.const_179,e);
         }
         try
         {
            node = config.child(const_1155)[0];
            if(node != null)
            {
               list = node.child(const_1151);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_683);
                  assets.loadFromFile(loader,true);
                  loader.load(new URLRequest(url));
                  var_285.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_249;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse asset libraries from config xml!",true,Core.const_179,e);
         }
         try
         {
            node = config.child(const_1154)[0];
            if(node != null)
            {
               list = node.child(const_1149);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_683);
                  loader.load(new URLRequest(url));
                  var_285.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_249;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse interfaces from config xml!",true,Core.const_179,e);
         }
         try
         {
            node = config.child(const_1153)[0];
            if(node != null)
            {
               list = node.child(const_1156);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  loader = new LibraryLoader(context,true,var_683);
                  loader.load(new URLRequest(url));
                  var_285.push(loader);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
                  loader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
                  ++var_249;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse components from config xml!",true,Core.const_179,e);
         }
         if(!disposed)
         {
            updateLoadingProcess();
         }
      }
      
      override public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_142 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_550[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var_284 = msCurrentTime;
         var_957.start();
         criticality = 0;
         while(criticality < CoreComponent.const_142)
         {
            var_659[criticality] = 0;
            receivers = var_550[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_957.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_957.stop();
         var_792.refresh(var_957);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_221.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_221.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_221.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_221 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_142)
            {
               _loc2_ = var_550[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_285 != null)
            {
               var_285.dispose();
               var_285 = null;
            }
            if(var_792 != null)
            {
               var_792.dispose();
               var_792 = null;
            }
            super.dispose();
         }
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param4)
         {
            ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
         }
         ErrorReportStorage.setParameter("error_cat",String(param3));
         ErrorReportStorage.setParameter("error_desc",param1);
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      private function finalizeLoadingEventDelegate() : void
      {
         if(var_791)
         {
            var_791.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function warning(param1:String) : void
      {
         var_2480 = param1;
         if(events == null)
         {
            Logger.log("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new WarningEvent(Component.COMPONENT_EVENT_WARNING,param1));
         }
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var maxTimePerFrame:uint = 1000 / var_221.stage.frameRate;
         var_284 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_142)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_659[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_659[criticality] = 0;
               receivers = var_550[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = IUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2399;
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_284;
         var_284 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_142)
         {
            var_659[criticality] = 0;
            receivers = var_550[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     trace(e.getStackTrace());
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function getNumberOfFilesPending() : uint
      {
         return var_285.length;
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               _loc2_.dispose();
               if(var_791)
               {
                  var_791.dispatchEvent(new LibraryProgressEvent(_loc2_.url,var_249 - 0,var_249,_loc2_.elapsedTime));
               }
            }
         }
         if(false)
         {
            finalizeLoadingEventDelegate();
            debug("All libraries loaded, Core is now running");
         }
      }
   }
}
