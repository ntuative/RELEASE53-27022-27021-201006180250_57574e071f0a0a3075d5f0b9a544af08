package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1567:int = 2;
      
      public static const const_1209:int = 4;
      
      public static const const_1237:int = 1;
      
      public static const const_1280:int = 3;
       
      
      private var var_1160:int = 0;
      
      private var var_981:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1160;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1160 = param1.readInteger();
         if(var_1160 == 3)
         {
            var_981 = param1.readString();
         }
         else
         {
            var_981 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1160 = 0;
         var_981 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_981;
      }
   }
}
