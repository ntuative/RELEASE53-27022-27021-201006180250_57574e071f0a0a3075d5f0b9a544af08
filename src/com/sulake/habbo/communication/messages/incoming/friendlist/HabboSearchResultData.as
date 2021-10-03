package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2454:Boolean;
      
      private var var_2451:int;
      
      private var var_2452:Boolean;
      
      private var var_1571:String;
      
      private var var_1460:String;
      
      private var var_1727:int;
      
      private var var_1971:String;
      
      private var var_2453:String;
      
      private var var_1970:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1727 = param1.readInteger();
         this.var_1571 = param1.readString();
         this.var_1971 = param1.readString();
         this.var_2454 = param1.readBoolean();
         this.var_2452 = param1.readBoolean();
         param1.readString();
         this.var_2451 = param1.readInteger();
         this.var_1970 = param1.readString();
         this.var_2453 = param1.readString();
         this.var_1460 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1460;
      }
      
      public function get avatarName() : String
      {
         return this.var_1571;
      }
      
      public function get avatarId() : int
      {
         return this.var_1727;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2454;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2453;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1970;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2452;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1971;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2451;
      }
   }
}
