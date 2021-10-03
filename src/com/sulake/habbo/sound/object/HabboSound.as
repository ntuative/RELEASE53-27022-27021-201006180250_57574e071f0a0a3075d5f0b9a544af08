package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1091:SoundChannel = null;
      
      private var var_906:Boolean;
      
      private var var_1090:Sound = null;
      
      private var var_705:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1090 = param1;
         var_1090.addEventListener(Event.COMPLETE,onComplete);
         var_705 = 1;
         var_906 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_906;
      }
      
      public function stop() : Boolean
      {
         var_1091.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_906 = false;
         var_1091 = var_1090.play(0);
         this.volume = var_705;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_705;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1091.position;
      }
      
      public function get length() : Number
      {
         return var_1090.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_705 = param1;
         if(var_1091 != null)
         {
            var_1091.soundTransform = new SoundTransform(var_705);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_906 = true;
      }
   }
}
