package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1574:String;
      
      private var var_1519:String;
      
      private var var_1139:String;
      
      private var var_452:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1574 = String(param1.@align);
         var_1139 = String(param1.@base);
         var_1519 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_452 = Number(_loc2_);
            if(var_452 > 1)
            {
               var_452 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1574;
      }
      
      public function get ink() : String
      {
         return var_1519;
      }
      
      public function get base() : String
      {
         return var_1139;
      }
      
      public function get isBlended() : Boolean
      {
         return var_452 != 1;
      }
      
      public function get blend() : Number
      {
         return var_452;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
