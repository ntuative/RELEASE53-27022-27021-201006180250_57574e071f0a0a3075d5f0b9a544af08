package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1436:uint = 2;
      
      protected static const const_1435:uint = 1;
      
      public static const const_976:int = 5;
      
      protected static const name_2:uint = 7;
      
      protected static const const_1438:uint = 4;
      
      protected static const const_1437:uint = 3;
       
      
      protected var var_299:int;
      
      protected var var_2405:String = "";
      
      protected var var_148:int = 0;
      
      protected var var_523:XML;
      
      protected var var_1194:Boolean = true;
      
      protected var var_579:Boolean = false;
      
      protected var var_825:int;
      
      protected var var_471:uint = 0;
      
      protected var var_14:Loader;
      
      protected var var_2406:String = "";
      
      protected var var_472:Boolean = false;
      
      protected var var_40:URLRequest;
      
      protected var var_683:Boolean = false;
      
      protected var var_192:int;
      
      protected var _name:String;
      
      protected var var_361:Class;
      
      protected var var_2528:uint = 0;
      
      protected var var_16:LoaderContext;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         if(param1 == null)
         {
            var_16 = new LoaderContext();
            var_16.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            var_16 = param1;
         }
         var_472 = param2;
         var_683 = param3;
         var_148 = 0;
         var_14 = new Loader();
         var_14.contentLoaderInfo.addEventListener(Event.INIT,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_14.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2405;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc11_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = "";
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_[1];
         }
         var _loc7_:Array = _loc5_.split("&");
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc11_ = _loc7_[_loc9_];
            if(_loc11_.indexOf("counterparameter=") >= 0)
            {
               _loc11_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc11_;
               _loc8_ = true;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         var _loc10_:String = _loc4_;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(_loc9_ == 0)
            {
               _loc10_ = _loc10_ + "?" + _loc7_[_loc9_];
            }
            else
            {
               _loc10_ = _loc10_ + "&" + _loc7_[_loc9_];
            }
            _loc9_++;
         }
         param1.url = _loc10_;
      }
      
      protected function failure(param1:String) : void
      {
         var_2406 = param1;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,var_148,bytesTotal,bytesLoaded,elapsedTime));
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get resource() : Class
      {
         return var_361;
      }
      
      public function get request() : URLRequest
      {
         return var_40;
      }
      
      public function getLastErrorMessage() : String
      {
         return var_2406;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return var_14.contentLoaderInfo.applicationDomain.hasDefinition(param1);
      }
      
      public function get bytesTotal() : uint
      {
         return var_14.contentLoaderInfo.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,var_148,bytesTotal,bytesLoaded,elapsedTime));
            try
            {
               var_14.close();
               var_14.unload();
            }
            catch(e:Error)
            {
            }
            var_14 = null;
            var_16 = null;
            var_361 = null;
            var_523 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return var_579;
      }
      
      public function resume() : void
      {
         if(var_472 && !_disposed)
         {
            var_472 = false;
            if(!var_579 && var_40)
            {
               var_192 = -1;
               var_825 = getTimer();
               var_14.load(var_40);
            }
         }
      }
      
      public function get paused() : Boolean
      {
         return var_472;
      }
      
      protected function prepareLibrary() : void
      {
         var xmlClass:Class = null;
         debug("Preparing library \"" + _name + "\"");
         var_361 = this.getDefinition(_name) as Class;
         if(var_361 == null)
         {
            failure("Failed to find resource class \"" + _name + "\" in library " + var_40.url + "!");
            return;
         }
         try
         {
            xmlClass = var_361.manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            failure("Failed to find embedded manifest.xml in library undefined!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         var_523 = new XML(bytes.readUTFBytes(bytes.length));
      }
      
      public function get manifest() : XML
      {
         return var_523;
      }
      
      public function get domain() : ApplicationDomain
      {
         return var_14.contentLoaderInfo.applicationDomain;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(var_14.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return var_14.contentLoaderInfo.applicationDomain.getDefinition(param1);
         }
         return null;
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:DisplayObject = var_14.content;
         debug("Analyzing library \"" + _name + "\", content " + (_loc1_ is MovieClip ? "is" : "is not") + " a MovieClip");
         debug("\tBytes loaded: " + var_14.contentLoaderInfo.bytesLoaded + "/" + var_14.contentLoaderInfo.bytesTotal);
         if(_loc1_ is MovieClip)
         {
            _loc2_ = _loc1_ as MovieClip;
            _loc4_ = _loc2_.currentLabels;
            debug("\tLibrary \"" + _name + "\" is in frame " + _loc2_.currentFrame + "(" + _loc2_.currentLabel + ")");
            if(_loc4_.length > 1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_ = _loc4_[_loc5_] as FrameLabel;
                  if(_loc3_.name == _name)
                  {
                     if(_loc3_.frame != _loc2_.currentFrame)
                     {
                        _loc2_.addEventListener(Event.ENTER_FRAME,loadEventHandler);
                        return false;
                     }
                  }
                  _loc5_++;
               }
            }
         }
         return true;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_14.contentLoaderInfo.bytesLoaded;
      }
      
      protected function debug(param1:String) : void
      {
         var_2405 = param1;
         if(var_683)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,var_148,bytesTotal,bytesLoaded,elapsedTime));
         }
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.INIT:
               debug("Load event INIT for file \"" + var_14.contentLoaderInfo.url + "\"");
               var_471 |= 0;
               break;
            case Event.COMPLETE:
               debug("Load event COMPLETE for file \"" + var_14.contentLoaderInfo.url + "\"");
               var_471 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               var_148 = HTTPStatusEvent(param1).status;
               debug("Load event STATUS " + var_148 + " for file \"" + var_14.contentLoaderInfo.url + "\"");
               break;
            case Event.UNLOAD:
               debug("Load event UNLOAD for file \"" + var_14.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,var_148,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case ProgressEvent.PROGRESS:
               debug("Load event PROGRESS for file \"" + var_14.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,var_148,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case IOErrorEvent.IO_ERROR:
               debug("Load event IO ERROR for file \"" + var_14.contentLoaderInfo.url + "\"");
               if(!handleHttpStatus(var_148))
               {
                  var_192 = getTimer();
                  failure("IO Error, send or load operation failed for file \"" + var_14.contentLoaderInfo.url + "\"");
                  removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               var_192 = getTimer();
               failure("Security Error, security violation with file \"" + var_14.contentLoaderInfo.url + "\"");
               removeEventListeners();
               break;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(var_471 == LibraryLoader.const_1437)
         {
            if(analyzeLibrary())
            {
               var_471 |= 0;
            }
         }
         if(var_471 == LibraryLoader.name_2)
         {
            var_579 = true;
            var_192 = getTimer();
            prepareLibrary();
            removeEventListeners();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,var_148,bytesTotal,bytesLoaded,elapsedTime));
         }
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         var statusCode:int = param1;
         if(statusCode == 0 || statusCode >= 400)
         {
            if(var_299 > 0)
            {
               try
               {
                  var_14.close();
                  var_14.unload();
               }
               catch(e:Error)
               {
               }
               addRequestCounterToUrlRequest(var_40,const_976 - var_299);
               if(var_1194)
               {
                  var_40.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_40.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1194 = false;
               }
               var_14.load(var_40,var_16);
               --var_299;
               return true;
            }
            failure("HTTP Error " + statusCode + " \"" + var_14.contentLoaderInfo.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      public function get elapsedTime() : uint
      {
         return !!var_579 ? uint(var_192 - var_825) : uint(getTimer() - var_825);
      }
      
      public function get url() : String
      {
         return !!var_40 ? "null" : null;
      }
      
      public function get status() : int
      {
         return var_148;
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         var_579 = false;
         var_40 = param1;
         var_299 = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         _name = parseNameFromUrl(var_40.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         if(!var_472)
         {
            var_192 = -1;
            var_825 = getTimer();
            var_14.load(var_40,var_16);
         }
      }
      
      protected function removeEventListeners() : void
      {
         if(var_14)
         {
            if(false)
            {
               var_14.content.removeEventListener(Event.ENTER_FRAME,loadEventHandler);
            }
            var_14.contentLoaderInfo.removeEventListener(Event.INIT,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_14.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         }
      }
   }
}
