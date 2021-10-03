package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_277:String = "WE_CHILD_RESIZED";
      
      public static const const_1309:String = "WE_CLOSE";
      
      public static const const_1355:String = "WE_DESTROY";
      
      public static const const_116:String = "WE_CHANGE";
      
      public static const const_1264:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1624:String = "WE_PARENT_RESIZE";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1297:String = "WE_MAXIMIZE";
      
      public static const const_491:String = "WE_DESTROYED";
      
      public static const const_1021:String = "WE_UNSELECT";
      
      public static const const_1335:String = "WE_MAXIMIZED";
      
      public static const const_1531:String = "WE_UNLOCKED";
      
      public static const const_418:String = "WE_CHILD_REMOVED";
      
      public static const const_169:String = "WE_OK";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1324:String = "WE_ACTIVATE";
      
      public static const const_286:String = "WE_ENABLED";
      
      public static const const_501:String = "WE_CHILD_RELOCATED";
      
      public static const const_1188:String = "WE_CREATE";
      
      public static const const_579:String = "WE_SELECT";
      
      public static const const_190:String = "";
      
      public static const const_1651:String = "WE_LOCKED";
      
      public static const const_1692:String = "WE_PARENT_RELOCATE";
      
      public static const const_1685:String = "WE_CHILD_REMOVE";
      
      public static const const_1644:String = "WE_CHILD_RELOCATE";
      
      public static const const_1605:String = "WE_LOCK";
      
      public static const const_233:String = "WE_FOCUSED";
      
      public static const const_724:String = "WE_UNSELECTED";
      
      public static const const_858:String = "WE_DEACTIVATED";
      
      public static const const_1198:String = "WE_MINIMIZED";
      
      public static const const_1636:String = "WE_ARRANGED";
      
      public static const const_1583:String = "WE_UNLOCK";
      
      public static const const_1640:String = "WE_ATTACH";
      
      public static const const_1371:String = "WE_OPEN";
      
      public static const const_1277:String = "WE_RESTORE";
      
      public static const const_1647:String = "WE_PARENT_RELOCATED";
      
      public static const const_1318:String = "WE_RELOCATE";
      
      public static const const_1593:String = "WE_CHILD_RESIZE";
      
      public static const const_1533:String = "WE_ARRANGE";
      
      public static const const_1216:String = "WE_OPENED";
      
      public static const const_1373:String = "WE_CLOSED";
      
      public static const const_1548:String = "WE_DETACHED";
      
      public static const const_1518:String = "WE_UPDATED";
      
      public static const const_1329:String = "WE_UNFOCUSED";
      
      public static const const_503:String = "WE_RELOCATED";
      
      public static const const_1259:String = "WE_DEACTIVATE";
      
      public static const const_211:String = "WE_DISABLED";
      
      public static const const_667:String = "WE_CANCEL";
      
      public static const const_695:String = "WE_ENABLE";
      
      public static const const_1256:String = "WE_ACTIVATED";
      
      public static const const_1252:String = "WE_FOCUS";
      
      public static const const_1646:String = "WE_DETACH";
      
      public static const const_1214:String = "WE_RESTORED";
      
      public static const const_1392:String = "WE_UNFOCUS";
      
      public static const const_61:String = "WE_SELECTED";
      
      public static const const_1236:String = "WE_PARENT_RESIZED";
      
      public static const const_1183:String = "WE_CREATED";
      
      public static const const_1510:String = "WE_ATTACHED";
      
      public static const const_1380:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1711:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1478:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1711 = param3;
         var_1478 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1478;
      }
      
      public function get related() : IWindow
      {
         return var_1711;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1478 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
