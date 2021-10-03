package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1708:int = 9;
      
      public static const const_1620:int = 4;
      
      public static const const_1532:int = 1;
      
      public static const const_1388:int = 10;
      
      public static const const_1637:int = 2;
      
      public static const const_1182:int = 7;
      
      public static const const_1211:int = 11;
      
      public static const const_1601:int = 3;
      
      public static const const_1339:int = 8;
      
      public static const const_1374:int = 5;
      
      public static const const_1534:int = 6;
      
      public static const const_1190:int = 12;
       
      
      private var var_1775:String;
      
      private var _roomId:int;
      
      private var var_1341:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1775;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1341 = param1.readInteger();
         var_1775 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1341;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
