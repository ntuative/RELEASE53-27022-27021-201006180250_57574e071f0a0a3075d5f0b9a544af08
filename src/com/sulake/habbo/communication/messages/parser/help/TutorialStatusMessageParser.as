package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1131:Boolean;
      
      private var var_1129:Boolean;
      
      private var var_1130:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1131;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1129;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1130 = param1.readBoolean();
         var_1129 = param1.readBoolean();
         var_1131 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1130;
      }
      
      public function flush() : Boolean
      {
         var_1130 = false;
         var_1129 = false;
         var_1131 = false;
         return true;
      }
   }
}
