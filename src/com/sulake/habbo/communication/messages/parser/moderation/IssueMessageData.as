package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_145:int = 1;
      
      public static const const_1389:int = 3;
      
      public static const const_457:int = 2;
       
      
      private var var_1759:int;
      
      private var var_1754:int;
      
      private var var_1752:int;
      
      private var var_1755:int;
      
      private var var_35:int;
      
      private var var_425:int;
      
      private var var_1392:int;
      
      private var var_1756:int;
      
      private var var_1166:int;
      
      private var _roomResources:String;
      
      private var var_1761:int;
      
      private var var_1757:int;
      
      private var var_1763:String;
      
      private var var_1751:String;
      
      private var var_1760:int = 0;
      
      private var var_1435:String;
      
      private var _message:String;
      
      private var var_1762:int;
      
      private var var_1758:String;
      
      private var var_1218:int;
      
      private var var_803:String;
      
      private var var_1753:String;
      
      private var var_1495:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1166 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1760 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1757;
      }
      
      public function set roomName(param1:String) : void
      {
         var_803 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1761 = param1;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_803;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1755 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_35 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1754;
      }
      
      public function get priority() : int
      {
         return var_1759 + var_1760;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1756 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1751;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1495) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1218;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1757 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1392;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1763 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1761;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1755;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1753 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1435 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1756;
      }
      
      public function set priority(param1:int) : void
      {
         var_1759 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1754 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1763;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1752 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1751 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1762 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1435;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1392 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1752;
      }
      
      public function set flatId(param1:int) : void
      {
         var_425 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1218 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1495 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1762;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1758 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1495;
      }
      
      public function get reportedUserId() : int
      {
         return var_1166;
      }
      
      public function get flatId() : int
      {
         return var_425;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1753;
      }
      
      public function get reporterUserName() : String
      {
         return var_1758;
      }
   }
}
