package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2225:int;
      
      private var var_2230:String;
      
      private var var_1650:IActionDefinition;
      
      private var var_2228:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2227:String;
      
      private var var_2229:String;
      
      private var var_2226:Boolean;
      
      private var var_2224:ColorTransform;
      
      private var var_2103:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2230 = param1;
         var_2227 = param2;
         var_2225 = param3;
         _color = param4;
         _frames = param5;
         var_1650 = param6;
         var_2226 = param7;
         var_2103 = param8;
         var_2229 = param9;
         var_2228 = param10;
         var_2224 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_2226;
      }
      
      public function get partType() : String
      {
         return var_2227;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2103;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2228;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2225;
      }
      
      public function get flippedPartType() : String
      {
         return var_2229;
      }
      
      public function get bodyPartId() : String
      {
         return var_2230;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1650;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2224;
      }
   }
}
