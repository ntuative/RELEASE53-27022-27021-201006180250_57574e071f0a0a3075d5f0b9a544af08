package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2022:Boolean = false;
      
      private var var_2021:int = 0;
      
      private var var_1592:int = 0;
      
      private var var_2019:int = 0;
      
      private var var_2020:Boolean = false;
      
      private var var_1647:int = 0;
      
      private var var_1591:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1647 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2021;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2022;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2022 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2020;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2021 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1592 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1647;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2020 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2019 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1592;
      }
      
      public function get pixelBalance() : int
      {
         return var_2019;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1591 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1591;
      }
   }
}
