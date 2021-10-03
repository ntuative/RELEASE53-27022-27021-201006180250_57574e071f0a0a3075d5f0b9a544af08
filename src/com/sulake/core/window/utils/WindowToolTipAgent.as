package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_339:Timer;
      
      protected var var_1008:String;
      
      protected var var_1009:uint;
      
      protected var var_1187:Point;
      
      protected var var_257:IToolTipWindow;
      
      protected var var_1188:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1187 = new Point();
         var_1188 = new Point(20,20);
         var_1009 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_339 != null)
         {
            var_339.stop();
            var_339.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_339 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1187);
            if(var_257 != null && true)
            {
               var_257.x = param1 + var_1188.x;
               var_257.y = param2 + var_1188.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_339 != null)
         {
            var_339.reset();
         }
         if(_window && true)
         {
            if(var_257 == null || false)
            {
               var_257 = _window.context.create("undefined::ToolTip",var_1008,WindowType.const_303,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_257.x = _loc2_.x + var_1187.x + var_1188.x;
            var_257.y = _loc2_.y + var_1187.y + var_1188.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_1008 = IInteractiveWindow(param1).toolTipCaption;
               var_1009 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_1008 = param1.caption;
               var_1009 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1187);
            if(var_1008 != null && var_1008 != "")
            {
               if(var_339 == null)
               {
                  var_339 = new Timer(var_1009,1);
                  var_339.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_339.reset();
               var_339.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_257 != null && true)
         {
            var_257.destroy();
            var_257 = null;
         }
      }
   }
}
