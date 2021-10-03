package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1217:String = "WN_CREATED";
      
      public static const const_1015:String = "WN_DISABLE";
      
      public static const const_1045:String = "WN_DEACTIVATED";
      
      public static const const_887:String = "WN_OPENED";
      
      public static const const_1048:String = "WN_CLOSED";
      
      public static const const_878:String = "WN_DESTROY";
      
      public static const const_1547:String = "WN_ARRANGED";
      
      public static const const_483:String = "WN_PARENT_RESIZED";
      
      public static const const_942:String = "WN_ENABLE";
      
      public static const const_999:String = "WN_RELOCATE";
      
      public static const const_932:String = "WN_FOCUS";
      
      public static const const_921:String = "WN_PARENT_RELOCATED";
      
      public static const const_486:String = "WN_PARAM_UPDATED";
      
      public static const const_613:String = "WN_PARENT_ACTIVATED";
      
      public static const const_175:String = "WN_RESIZED";
      
      public static const const_961:String = "WN_CLOSE";
      
      public static const const_1008:String = "WN_PARENT_REMOVED";
      
      public static const const_295:String = "WN_CHILD_RELOCATED";
      
      public static const const_606:String = "WN_ENABLED";
      
      public static const const_291:String = "WN_CHILD_RESIZED";
      
      public static const const_831:String = "WN_MINIMIZED";
      
      public static const const_599:String = "WN_DISABLED";
      
      public static const const_218:String = "WN_CHILD_ACTIVATED";
      
      public static const const_385:String = "WN_STATE_UPDATED";
      
      public static const const_652:String = "WN_UNSELECTED";
      
      public static const const_471:String = "WN_STYLE_UPDATED";
      
      public static const const_1703:String = "WN_UPDATE";
      
      public static const const_480:String = "WN_PARENT_ADDED";
      
      public static const const_576:String = "WN_RESIZE";
      
      public static const const_563:String = "WN_CHILD_REMOVED";
      
      public static const const_1709:String = "";
      
      public static const const_996:String = "WN_RESTORED";
      
      public static const const_339:String = "WN_SELECTED";
      
      public static const const_850:String = "WN_MINIMIZE";
      
      public static const const_848:String = "WN_FOCUSED";
      
      public static const const_1203:String = "WN_LOCK";
      
      public static const const_301:String = "WN_CHILD_ADDED";
      
      public static const const_895:String = "WN_UNFOCUSED";
      
      public static const const_426:String = "WN_RELOCATED";
      
      public static const const_1032:String = "WN_DEACTIVATE";
      
      public static const const_1239:String = "WN_CRETAE";
      
      public static const const_966:String = "WN_RESTORE";
      
      public static const const_312:String = "WN_ACTVATED";
      
      public static const const_1291:String = "WN_LOCKED";
      
      public static const const_416:String = "WN_SELECT";
      
      public static const const_1009:String = "WN_MAXIMIZE";
      
      public static const const_972:String = "WN_OPEN";
      
      public static const const_674:String = "WN_UNSELECT";
      
      public static const const_1623:String = "WN_ARRANGE";
      
      public static const const_1351:String = "WN_UNLOCKED";
      
      public static const const_1489:String = "WN_UPDATED";
      
      public static const const_1014:String = "WN_ACTIVATE";
      
      public static const const_1287:String = "WN_UNLOCK";
      
      public static const const_968:String = "WN_MAXIMIZED";
      
      public static const const_864:String = "WN_DESTROYED";
      
      public static const const_1017:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1711,cancelable);
      }
   }
}
