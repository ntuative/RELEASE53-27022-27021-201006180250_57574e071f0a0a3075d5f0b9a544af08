package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1175:Array;
      
      private var var_2345:Boolean;
      
      private var var_1176:Array;
      
      private var var_2341:Boolean;
      
      private var var_2344:Boolean;
      
      private var var_2347:Boolean;
      
      private var var_154:Array;
      
      private var var_2346:Boolean;
      
      private var var_2342:Boolean;
      
      private var var_991:Array;
      
      private var var_2343:Boolean;
      
      private var var_2348:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_154 = [];
         var_1176 = [];
         var_1175 = [];
         var_991 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               var_154.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1176.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_991.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2346 = param1.readBoolean();
         var_2347 = param1.readBoolean();
         var_2341 = param1.readBoolean();
         var_2344 = param1.readBoolean();
         var_2348 = param1.readBoolean();
         var_2342 = param1.readBoolean();
         var_2345 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1175.push(param1.readString());
            _loc4_++;
         }
         var_2343 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return var_2348;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1176;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2341;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2345;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2346;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_1176 = null;
         var_1175 = null;
         var_154 = null;
         for each(_loc1_ in var_991)
         {
            _loc1_.dispose();
         }
         var_991 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return var_1175;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2342;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2344;
      }
      
      public function get offenceCategories() : Array
      {
         return var_991;
      }
      
      public function get issues() : Array
      {
         return var_154;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2343;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2347;
      }
   }
}
