package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1164:int = 0;
      
      private var var_1224:int = 0;
      
      private var var_1784:String = "";
      
      private var var_1165:int = 0;
      
      private var var_1782:String = "";
      
      private var var_1778:int = 0;
      
      private var var_1684:String = "";
      
      private var var_1781:int = 0;
      
      private var var_1779:int = 0;
      
      private var var_1783:String = "";
      
      private var var_1780:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1781 = param1;
         var_1783 = param2;
         var_1684 = param3;
         var_1784 = param4;
         var_1782 = param5;
         if(param6)
         {
            var_1224 = 1;
         }
         else
         {
            var_1224 = 0;
         }
         var_1778 = param7;
         var_1779 = param8;
         var_1165 = param9;
         var_1780 = param10;
         var_1164 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1781,var_1783,var_1684,var_1784,var_1782,var_1224,var_1778,var_1779,var_1165,var_1780,var_1164];
      }
      
      public function dispose() : void
      {
      }
   }
}
