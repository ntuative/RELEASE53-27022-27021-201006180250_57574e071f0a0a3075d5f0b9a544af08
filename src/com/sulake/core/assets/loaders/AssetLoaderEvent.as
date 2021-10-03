package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_893:String = "AssetLoaderEventUnload";
      
      public static const const_47:String = "AssetLoaderEventError";
      
      public static const const_993:String = "AssetLoaderEventOpen";
      
      public static const const_910:String = "AssetLoaderEventProgress";
      
      public static const const_1035:String = "AssetLoaderEventStatus";
      
      public static const ASSET_LOADER_EVENT_COMPLETE:String = "AssetLoaderEventComplete";
       
      
      private var var_148:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_148 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_148;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_148);
      }
   }
}
