package com.sulake.habbo.widget.chooser
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.events.RoomWidgetChooserContentEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class FurniChooserWidget extends ChooserWidgetBase
   {
       
      
      private var var_541:ChooserView;
      
      public function FurniChooserWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChooserContentEvent.const_587,onChooserContent);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_134,onUpdateFurniChooser);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_610,onUpdateFurniChooser);
         super.registerUpdateEvents(param1);
      }
      
      override public function dispose() : void
      {
         if(var_541 != null)
         {
            var_541.dispose();
            var_541 = null;
         }
         super.dispose();
      }
      
      private function onUpdateFurniChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(var_541 == null || !var_541.isOpen())
         {
            return;
         }
         var _loc2_:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.REQUEST_FURNI_CHOOSER);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onChooserContent(param1:RoomWidgetChooserContentEvent) : void
      {
         if(param1 == null || param1.items == null)
         {
            return;
         }
         if(var_541 == null)
         {
            var_541 = new ChooserView(this,"${widget.chooser.furni.title}");
         }
         var_541.populate(param1.items,param1.isAnyRoomController);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChooserContentEvent.const_587,onChooserContent);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_134,onUpdateFurniChooser);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_610,onUpdateFurniChooser);
      }
   }
}
