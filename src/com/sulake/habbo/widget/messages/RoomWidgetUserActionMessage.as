package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_626:String = "RWUAM_RESPECT_USER";
      
      public static const const_655:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_702:String = "RWUAM_START_TRADING";
      
      public static const const_678:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_556:String = "RWUAM_WHISPER_USER";
      
      public static const const_645:String = "RWUAM_IGNORE_USER";
      
      public static const const_465:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_596:String = "RWUAM_BAN_USER";
      
      public static const const_662:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_379:String = "RWUAM_KICK_USER";
      
      public static const const_553:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_552:String = " RWUAM_RESPECT_PET";
      
      public static const const_495:String = "RWUAM_KICK_BOT";
      
      public static const const_1208:String = "RWUAM_TRAIN_PET";
      
      public static const const_573:String = "RWUAM_PICKUP_PET";
      
      public static const const_710:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_555:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
