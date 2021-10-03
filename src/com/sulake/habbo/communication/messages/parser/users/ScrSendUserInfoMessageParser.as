package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1361:int = 2;
      
      public static const const_1696:int = 1;
       
      
      private var var_2370:int;
      
      private var var_2366:int;
      
      private var var_2020:Boolean;
      
      private var var_2368:int;
      
      private var var_1416:String;
      
      private var var_2367:Boolean;
      
      private var var_2038:int;
      
      private var var_2369:int;
      
      private var var_2040:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2366;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2020;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2369;
      }
      
      public function get memberPeriods() : int
      {
         return var_2368;
      }
      
      public function get productName() : String
      {
         return var_1416;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2367;
      }
      
      public function get responseType() : int
      {
         return var_2370;
      }
      
      public function get pastClubDays() : int
      {
         return var_2040;
      }
      
      public function get pastVipDays() : int
      {
         return var_2038;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1416 = param1.readString();
         var_2366 = param1.readInteger();
         var_2368 = param1.readInteger();
         var_2369 = param1.readInteger();
         var_2370 = param1.readInteger();
         var_2367 = param1.readBoolean();
         var_2020 = param1.readBoolean();
         var_2040 = param1.readInteger();
         var_2038 = param1.readInteger();
         return true;
      }
   }
}
