package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1838:Date;
      
      private var var_1248:Boolean = false;
      
      private var _type:int;
      
      private var var_392:BitmapData;
      
      private var var_282:Boolean = false;
      
      private var var_1235:int;
      
      private var var_600:int = 1;
      
      private var var_1043:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_392;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_600;
         if(var_600 < 0)
         {
            var_600 = 0;
         }
         var_1043 = var_1235;
         var_282 = false;
         var_1248 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1043 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_282;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_392 = param1;
      }
      
      public function get duration() : int
      {
         return var_1235;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1248;
      }
      
      public function get effectsInInventory() : int
      {
         return var_600;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_392;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_282)
         {
            var_1838 = new Date();
         }
         var_282 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_600 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_282)
         {
            _loc1_ = var_1043 - (new Date().valueOf() - var_1838.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1043;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1248 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1235 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
