package com.sulake.habbo.navigator.userdefinedroomevents
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.UserDefinedRoomEvent;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.AddActionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.AddEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.AddTriggerMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.ReloadEventsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.RemoveActionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.RemoveEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.RemoveTriggerMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.userdefinedroomevents.actiontypes.ActionType;
   import com.sulake.habbo.navigator.userdefinedroomevents.actiontypes.ActionTypes;
   import com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs.TriggerConf;
   import com.sulake.habbo.navigator.userdefinedroomevents.triggerconfs.TriggerConfs;
   
   public class UserDefinedRoomEventsCtrl
   {
      
      private static var var_1640:int = 16;
       
      
      private var var_85:int = 1;
      
      private const const_370:int = 1;
      
      private const const_807:int = 4;
      
      private var var_544:IWindowContainer;
      
      private var _window:IWindowContainer;
      
      private const const_1142:int = 3;
      
      private var var_2190:IButtonWindow;
      
      private var var_780:int;
      
      private var var_2189:IButtonWindow;
      
      private var var_1123:ActionTypes;
      
      private var _active:Boolean;
      
      private var var_1389:String;
      
      private var var_545:IWindowContainer;
      
      private var var_2188:IButtonWindow;
      
      private var var_1124:IWindowContainer;
      
      private var var_207:ActionType;
      
      private var var_543:IWindowContainer;
      
      private var var_782:IWindowContainer;
      
      private var var_208:TriggerConf;
      
      private const const_1470:int = 2;
      
      private var var_781:IWindowContainer;
      
      private var _navigator:HabboNavigator;
      
      private const const_1469:int = 6;
      
      private var var_1125:TriggerConfs;
      
      private var var_1267:IWindowContainer;
      
      private const const_808:int = 7;
      
      private var var_329:int;
      
      private const const_1471:int = 5;
      
      public function UserDefinedRoomEventsCtrl(param1:HabboNavigator)
      {
         var_1125 = new TriggerConfs();
         super();
         _navigator = param1;
         var_1123 = new ActionTypes(param1);
      }
      
      private function refreshAction(param1:IWindowContainer, param2:int, param3:ActionDefinition) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(param1.getChildByName("" + param2));
         if(_loc4_ == null)
         {
            _loc4_ = IWindowContainer(_navigator.getXmlWindow("ude_action"));
            _loc4_.name = "" + param2;
            _loc4_.id = param2;
            param1.addChild(_loc4_);
            _navigator.refreshButton(_loc4_,"remove_bitmap",true,onRemoveActionButton,0,"ude_remove");
         }
         _loc4_.visible = true;
         refreshActionDesc(_loc4_,param3);
         _loc4_.y = param2 * var_1640;
      }
      
      private function isStuffSelectionMode() : Boolean
      {
         return this.var_85 == const_1142 || this.var_85 == const_1469;
      }
      
      private function onRemoveTriggerButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.parent.id;
         var _loc4_:int = param2.parent.parent.parent.id;
         Logger.log("remove trigger clicked: " + _loc4_ + ", " + _loc3_);
         this._navigator.send(new RemoveTriggerMessageComposer(_loc4_,_loc3_));
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
         var_85 = const_370;
      }
      
      private function refreshSelectFurni() : void
      {
         if(!isStuffSelectionMode())
         {
            this.var_1124.visible = false;
            return;
         }
         this.var_1124.visible = true;
         var _loc1_:IWindow = this.var_1124.findChildByName("furni_name_txt");
         var _loc2_:IButtonWindow = IButtonWindow(this.var_1124.findChildByName("select_furni_button"));
         if(var_329 > 0)
         {
            _loc2_.enable();
            _loc1_.caption = var_1389 + " (" + var_329 + ")";
            _loc1_.visible = true;
         }
         else
         {
            _loc2_.disable();
            _loc1_.visible = false;
         }
      }
      
      private function onSelectFurni(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Select furni clicked: " + _loc3_);
         this.var_85 = var_85 == const_1142 ? int(const_807) : int(const_808);
         this.prepareForConfigure();
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function reload() : void
      {
         this._navigator.roomInfoViewCtrl.reload();
      }
      
      private function onAddTrigger(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         addTrigger();
      }
      
      private function onAddAction(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         addAction();
      }
      
      private function refreshEvent(param1:int, param2:UserDefinedRoomEvent) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(var_545.getChildByName("" + param1));
         if(_loc3_ == null)
         {
            _loc3_ = IWindowContainer(_navigator.getXmlWindow("ude_event"));
            _loc3_.name = "" + param1;
            var_545.addChild(_loc3_);
            _navigator.refreshButton(_loc3_,"remove_event",true,onRemoveEventButton,0,"ude_remove");
            _navigator.refreshButton(_loc3_,"add_trigger",true,onAddTriggerButton,0,"ude_add_trigger");
            _navigator.refreshButton(_loc3_,"add_action",true,onAddActionButton,0,"ude_add_action");
         }
         _loc3_.id = param2.id;
         _loc3_.visible = true;
         refreshTriggers(_loc3_,param2);
         refreshActions(_loc3_,param2);
         Util.moveChildrenToColumn(_loc3_,["triggers_container","actions_container"],0,3);
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.getChildByName("ruler"));
         _loc4_.visible = false;
         _loc4_.y = Util.getLowestPoint(_loc3_) + 3;
         _loc4_.visible = true;
         _loc3_.height = Util.getLowestPoint(_loc3_) + 3;
      }
      
      private function refreshActions(param1:IWindowContainer, param2:UserDefinedRoomEvent) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.getChildByName("actions_container"));
         Util.hideChildren(_loc3_);
         var _loc4_:Array = param2.actions;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            refreshAction(_loc3_,_loc5_,_loc4_[_loc5_]);
            _loc5_++;
         }
         _loc3_.height = Util.getLowestPoint(_loc3_) + 1;
      }
      
      private function refreshTriggerDesc(param1:IWindowContainer, param2:TriggerDefinition) : void
      {
         var _loc3_:TriggerConf = var_1125.getByCode(param2.triggerConf);
         param1.findChildByName("desc_txt").caption = _loc3_.getDesc(param2);
      }
      
      private function onSelectActionType(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Select action type clicked: " + _loc3_);
         var_207 = this.var_1123.getByCode(_loc3_);
         Logger.log("Found action type: undefined, undefined, undefined");
         var_85 = !true ? int(const_1469) : int(const_808);
         this.prepareForConfigure();
      }
      
      private function refreshSelectActionType() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_85 != const_1471)
         {
            this.var_782.visible = false;
            return;
         }
         this.var_782.visible = true;
         var _loc1_:IWindowContainer = IWindowContainer(var_782.findChildByName("action_types_container"));
         if(_loc1_.numChildren < 1)
         {
            _loc3_ = 25;
            _loc4_ = 0;
            while(_loc4_ < this.var_1123.types.length)
            {
               _loc5_ = this.var_1123.types[_loc4_];
               _loc6_ = _navigator.getXmlWindow("ude_action_type");
               _loc1_.addChild(_loc6_);
               _loc6_.y = _loc4_ * _loc3_;
               _loc6_.id = _loc5_.code;
               _loc6_.procedure = onSelectActionType;
               _loc6_.caption = _loc5_.name;
               _loc4_++;
            }
         }
         _loc1_.height = Util.getLowestPoint(_loc1_);
         var _loc2_:int = _loc1_.height + _loc1_.y + 5;
         var_782.getChildByName("cancel_add_action_button").y = _loc2_;
         var_782.height = Util.getLowestPoint(var_782);
      }
      
      private function onReloadButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Reload clicked");
         _navigator.send(new ReloadEventsMessageComposer());
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function stuffSelected(param1:int, param2:String) : void
      {
         if(!this._active)
         {
            return;
         }
         if(!isStuffSelectionMode())
         {
            return;
         }
         var_329 = param1;
         var_1389 = param2;
         reload();
      }
      
      private function onRemoveEventButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.parent.id;
         Logger.log("remove event clicked: " + _loc3_);
         this._navigator.send(new RemoveEventMessageComposer(_loc3_));
      }
      
      private function prepareForConfigure() : void
      {
         if(var_85 == const_807 && true)
         {
            addTrigger();
         }
         else if(var_85 == const_808 && true)
         {
            addAction();
         }
         else
         {
            _navigator.data.stuffStates = null;
            this.reload();
         }
      }
      
      private function refreshTriggers(param1:IWindowContainer, param2:UserDefinedRoomEvent) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(param1.getChildByName("triggers_container"));
         Util.hideChildren(_loc3_);
         var _loc4_:Array = param2.triggers;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            refreshTrigger(_loc3_,_loc5_,_loc4_[_loc5_]);
            _loc5_++;
         }
         _loc3_.height = Util.getLowestPoint(_loc3_) + 1;
      }
      
      private function addAction() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_544.findChildByName("custom_inputs_container"));
         var _loc2_:IWindowContainer = IWindowContainer(_loc1_.getChildByName("undefined"));
         var _loc3_:String = var_207.readParamsFromForm(_loc2_);
         this._navigator.send(new AddActionMessageComposer(var_780,var_207.code,var_329,var_329 > 0 ? var_1389 : "",_loc3_));
         this.var_85 = const_370;
      }
      
      private function onBackButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("cancel clicked");
         this._navigator.roomInfoViewCtrl.backToRoomSettings();
      }
      
      private function onSelectTriggerConf(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Select trigger conf clicked: " + _loc3_);
         var_208 = this.var_1125.getByCode(_loc3_);
         Logger.log("Found trigger conf: undefined, undefined, undefined");
         var_85 = !true ? int(const_1142) : int(const_807);
         this.prepareForConfigure();
      }
      
      private function getImgSelectorContainer(param1:int) : IWindowContainer
      {
         return IWindowContainer(_window.findChildByName("img_selector_container_" + param1));
      }
      
      private function prepareWindow(param1:IWindowContainer) : void
      {
         if(this._window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("ude_main"));
         param1.addChildAt(_window,0);
         var_2188 = IButtonWindow(find("add_event_button"));
         var_2189 = IButtonWindow(find("back_button"));
         var_2190 = IButtonWindow(find("reload_button"));
         var_545 = IWindowContainer(find("events_container"));
         var_781 = IWindowContainer(find("select_trigger_type_container"));
         var_543 = IWindowContainer(find("configure_trigger_container"));
         var_782 = IWindowContainer(find("select_action_type_container"));
         var_544 = IWindowContainer(find("configure_action_container"));
         var_1124 = IWindowContainer(find("select_furni_container"));
         var_1267 = IWindowContainer(find("footer_container"));
         Util.setProcDirectly(var_2188,onAddEventButton);
         Util.setProcDirectly(var_2189,onBackButton);
         Util.setProcDirectly(var_2190,onReloadButton);
         Util.setProcDirectly(find("cancel_add_trigger_button"),onBackToNormal);
         Util.setProcDirectly(find("cancel_add_action_button"),onBackToNormal);
         Util.setProcDirectly(find("cancel_save_trigger_button"),onBackToNormal);
         Util.setProcDirectly(find("save_trigger_button"),onAddTrigger);
         Util.setProcDirectly(find("cancel_save_action_button"),onBackToNormal);
         Util.setProcDirectly(find("save_action_button"),onAddAction);
         Util.setProcDirectly(find("cancel_select_furni_button"),onBackToNormal);
         Util.setProcDirectly(find("select_furni_button"),onSelectFurni);
      }
      
      private function onAddEventButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Add event clicked");
         _navigator.send(new AddEventMessageComposer());
      }
      
      public function refresh(param1:IWindowContainer) : void
      {
         if(!_active)
         {
            return;
         }
         prepareWindow(param1);
         refreshEvents();
         refreshSelectTriggerType();
         refreshConfigureTrigger();
         refreshSelectActionType();
         refreshConfigureAction();
         refreshSelectFurni();
         var_1267.visible = false;
         if(var_85 == const_370)
         {
            var_1267.y = Util.getLowestPoint(this._window);
            var_1267.visible = true;
         }
         _window.height = Util.getLowestPoint(this._window) + 4;
         _window.visible = true;
      }
      
      private function refreshConfigureAction() : void
      {
         var _loc3_:* = null;
         if(var_85 != const_808)
         {
            this.var_544.visible = false;
            return;
         }
         this.var_544.visible = true;
         var _loc1_:IWindowContainer = IWindowContainer(var_544.findChildByName("custom_inputs_container"));
         Util.hideChildren(_loc1_);
         if(false)
         {
            _loc3_ = IWindowContainer(_loc1_.getChildByName("undefined"));
            if(_loc3_ == null)
            {
               _loc3_ = IWindowContainer(_navigator.getXmlWindow("ude_action_inputs_undefined"));
               _loc3_.name = "undefined";
               _loc1_.addChild(_loc3_);
               var_207.onInit(_loc3_);
            }
            var_207.onEditStart(_loc3_,var_329);
            _loc3_.visible = true;
         }
         _loc1_.height = Util.getLowestPoint(_loc1_);
         var _loc2_:int = _loc1_.height + _loc1_.y;
         var_544.getChildByName("save_action_button").y = _loc2_;
         var_544.getChildByName("cancel_save_action_button").y = _loc2_;
         var_544.height = Util.getLowestPoint(var_544) + 1;
      }
      
      private function refreshSelectTriggerType() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_85 != const_1470)
         {
            this.var_781.visible = false;
            return;
         }
         this.var_781.visible = true;
         var _loc1_:IWindowContainer = IWindowContainer(var_781.findChildByName("trigger_types_container"));
         if(_loc1_.numChildren < 1)
         {
            _loc3_ = 25;
            _loc4_ = 0;
            while(_loc4_ < this.var_1125.confs.length)
            {
               _loc5_ = this.var_1125.confs[_loc4_];
               _loc6_ = _navigator.getXmlWindow("ude_trigger_conf");
               _loc1_.addChild(_loc6_);
               _loc6_.y = _loc4_ * _loc3_;
               _loc6_.id = _loc5_.code;
               _loc6_.procedure = onSelectTriggerConf;
               _loc6_.caption = _loc5_.name;
               _loc4_++;
            }
         }
         _loc1_.height = Util.getLowestPoint(_loc1_);
         var _loc2_:int = _loc1_.height + _loc1_.y + 5;
         var_781.getChildByName("cancel_add_trigger_button").y = _loc2_;
         var_781.height = Util.getLowestPoint(var_781);
      }
      
      private function refreshEvents() : void
      {
         if(var_85 != const_370)
         {
            var_545.visible = false;
            return;
         }
         var_545.visible = true;
         Util.hideChildren(this.var_545);
         var _loc1_:Array = _navigator.data.userDefinedRoomEvents.events;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            refreshEvent(_loc2_,_loc1_[_loc2_]);
            _loc2_++;
         }
         Util.moveAllChildrenToColumn(this.var_545,0,0);
         this.var_545.height = Util.getLowestPoint(this.var_545);
      }
      
      private function refreshTrigger(param1:IWindowContainer, param2:int, param3:TriggerDefinition) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(param1.getChildByName("" + param2));
         if(_loc4_ == null)
         {
            _loc4_ = IWindowContainer(_navigator.getXmlWindow("ude_trigger"));
            _loc4_.name = "" + param2;
            _loc4_.id = param2;
            param1.addChild(_loc4_);
            _navigator.refreshButton(_loc4_,"remove_bitmap",true,onRemoveTriggerButton,0,"ude_remove");
         }
         _loc4_.visible = true;
         refreshTriggerDesc(_loc4_,param3);
         _loc4_.y = param2 * var_1640;
      }
      
      private function addTrigger() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_543.findChildByName("custom_inputs_container"));
         var _loc2_:IWindowContainer = IWindowContainer(_loc1_.getChildByName("undefined"));
         var _loc3_:String = var_208.readParamsFromForm(_loc2_);
         this._navigator.send(new AddTriggerMessageComposer(var_780,var_208.code,var_329,var_329 > 0 ? var_1389 : "",_loc3_));
         this.var_85 = const_370;
      }
      
      private function onAddTriggerButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_329 = 0;
         var_780 = param2.parent.id;
         Logger.log("add trigger clicked: " + var_780);
         this.var_85 = const_1470;
         this.reload();
      }
      
      private function onBackToNormal(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Reload clicked");
         var_85 = const_370;
         reload();
      }
      
      private function refreshConfigureTrigger() : void
      {
         var _loc3_:* = null;
         if(var_85 != const_807)
         {
            this.var_543.visible = false;
            return;
         }
         this.var_543.visible = true;
         var _loc1_:IWindowContainer = IWindowContainer(var_543.findChildByName("custom_inputs_container"));
         Util.hideChildren(_loc1_);
         if(false)
         {
            _loc3_ = IWindowContainer(_loc1_.getChildByName("undefined"));
            if(_loc3_ == null)
            {
               _loc3_ = IWindowContainer(_navigator.getXmlWindow("ude_trigger_inputs_undefined"));
               _loc3_.name = "undefined";
               _loc1_.addChild(_loc3_);
               var_208.onInit(_loc3_);
            }
            var_208.onEditStart(_loc3_);
            _loc3_.visible = true;
         }
         _loc1_.height = Util.getLowestPoint(_loc1_);
         var _loc2_:int = _loc1_.height + _loc1_.y;
         var_543.getChildByName("save_trigger_button").y = _loc2_;
         var_543.getChildByName("cancel_save_trigger_button").y = _loc2_;
         var_543.height = Util.getLowestPoint(var_543) + 1;
      }
      
      private function onAddActionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_329 = 0;
         var_780 = param2.parent.id;
         Logger.log("add action clicked: " + var_780);
         this.var_85 = const_1471;
         this.reload();
      }
      
      private function onRemoveActionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.parent.id;
         var _loc4_:int = param2.parent.parent.parent.id;
         Logger.log("remove action clicked: " + _loc4_ + ", " + _loc3_);
         this._navigator.send(new RemoveActionMessageComposer(_loc4_,_loc3_));
      }
      
      private function refreshActionDesc(param1:IWindowContainer, param2:ActionDefinition) : void
      {
         var _loc3_:ActionType = var_1123.getByCode(param2.type);
         param1.findChildByName("desc_txt").caption = _loc3_.getDesc(param2);
      }
      
      public function close() : void
      {
         this._active = false;
      }
   }
}
