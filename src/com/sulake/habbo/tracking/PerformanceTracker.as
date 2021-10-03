package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1683:GarbageMonitor = null;
      
      private var var_1340:int = 0;
      
      private var var_1224:Boolean = false;
      
      private var var_1784:String = "";
      
      private var var_1684:String = "";
      
      private var var_384:Number = 0;
      
      private var var_1432:int = 10;
      
      private var var_2474:Array;
      
      private var var_689:int = 0;
      
      private var var_1431:int = 60;
      
      private var var_1164:int = 0;
      
      private var var_1165:int = 0;
      
      private var var_1782:String = "";
      
      private var var_2307:Number = 0;
      
      private var var_1433:int = 1000;
      
      private var var_2309:Boolean = true;
      
      private var var_2308:Number = 0.15;
      
      private var var_143:IHabboConfigurationManager = null;
      
      private var var_1783:String = "";
      
      private var var_1434:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2474 = [];
         super();
         var_1684 = Capabilities.version;
         var_1784 = Capabilities.os;
         var_1224 = Capabilities.isDebugger;
         var_1783 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1683 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1340 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1683.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1683.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_384;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1431 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1684;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1165;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1433)
         {
            ++var_1164;
            _loc3_ = true;
         }
         else
         {
            ++var_689;
            if(var_689 <= 1)
            {
               var_384 = param1;
            }
            else
            {
               _loc4_ = Number(var_689);
               var_384 = var_384 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1340 > var_1431 * 1000 && var_1434 < var_1432)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_384);
            _loc5_ = true;
            if(var_2309 && var_1434 > 0)
            {
               _loc6_ = differenceInPercents(var_2307,var_384);
               if(_loc6_ < var_2308)
               {
                  _loc5_ = false;
               }
            }
            var_1340 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2307 = var_384;
               if(sendReport())
               {
                  ++var_1434;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1432 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1433 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1783,var_1684,var_1784,var_1782,var_1224,_loc4_,_loc3_,var_1165,var_384,var_1164);
            _connection.send(_loc1_);
            var_1165 = 0;
            var_384 = 0;
            var_689 = 0;
            var_1164 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_143 = param1;
         var_1431 = int(var_143.getKey("performancetest.interval","60"));
         var_1433 = int(var_143.getKey("performancetest.slowupdatelimit","1000"));
         var_1432 = int(var_143.getKey("performancetest.reportlimit","10"));
         var_2308 = Number(var_143.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2309 = Boolean(int(var_143.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
