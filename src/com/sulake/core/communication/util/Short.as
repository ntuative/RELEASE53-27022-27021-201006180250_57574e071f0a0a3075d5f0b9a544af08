package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_785:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_785 = new ByteArray();
         var_785.writeShort(param1);
         var_785.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_785.position = 0;
         if(false)
         {
            _loc1_ = var_785.readShort();
            var_785.position = 0;
         }
         return _loc1_;
      }
   }
}
