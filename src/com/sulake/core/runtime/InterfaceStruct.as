package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_468:uint;
      
      private var var_1174:IUnknown;
      
      private var var_1441:String;
      
      private var var_1173:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1173 = param1;
         var_1441 = getQualifiedClassName(var_1173);
         var_1174 = param2;
         var_468 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1173;
      }
      
      public function get disposed() : Boolean
      {
         return var_1174 == null;
      }
      
      public function get references() : uint
      {
         return var_468;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_468) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1174;
      }
      
      public function get iis() : String
      {
         return var_1441;
      }
      
      public function reserve() : uint
      {
         return ++var_468;
      }
      
      public function dispose() : void
      {
         var_1173 = null;
         var_1441 = null;
         var_1174 = null;
         var_468 = 0;
      }
   }
}
