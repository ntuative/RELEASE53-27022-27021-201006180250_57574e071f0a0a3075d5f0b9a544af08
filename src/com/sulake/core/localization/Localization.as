package com.sulake.core.localization
{
   import flash.utils.Dictionary;
   
   public class Localization implements ILocalization
   {
       
      
      private var var_614:String;
      
      private var var_1219:Dictionary;
      
      private var var_167:Boolean = false;
      
      private var var_703:Array;
      
      private var var_176:String;
      
      public function Localization(param1:String, param2:String = null)
      {
         super();
         var_703 = new Array();
         var_1219 = new Dictionary();
         var_614 = param1;
         var_176 = param2;
      }
      
      public function removeListener(param1:ILocalizable) : void
      {
         var _loc2_:int = var_703.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_703 = var_703.splice(_loc2_,1);
         }
      }
      
      public function get raw() : String
      {
         return var_176;
      }
      
      public function get isInitialized() : Boolean
      {
         return var_176 != null;
      }
      
      public function registerParameter(param1:String, param2:String, param3:String = "%") : void
      {
         param1 = param3 + param1 + param3;
         var_1219[param1] = param2;
         updateListeners();
      }
      
      public function registerListener(param1:ILocalizable) : void
      {
         var_703.push(param1);
         param1.localization = value;
      }
      
      public function get value() : String
      {
         return fillParameterValues();
      }
      
      private function fillParameterValues() : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:String = var_176;
         for(_loc2_ in var_1219)
         {
            _loc3_ = "null";
            _loc4_ = new RegExp(_loc2_,"gim");
            if(_loc1_ != null)
            {
               _loc1_ = _loc1_.replace(_loc4_,_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function setValue(param1:String) : void
      {
         var_176 = param1;
         updateListeners();
      }
      
      public function updateListeners() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_703)
         {
            _loc1_.localization = value;
         }
      }
      
      public function get key() : String
      {
         return var_614;
      }
   }
}
