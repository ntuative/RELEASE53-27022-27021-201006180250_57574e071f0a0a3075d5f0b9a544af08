package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarActionUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const EFFECT_ACTIVE:String = "EFFECT_ACTIVE";
      
      public static const EFFECT_INACTIVE:String = "EFFECT_INACTIVE";
      
      public static const const_757:String = "RWBIUE_AVATAR_ACTION";
       
      
      private var var_207:String = "";
      
      public function RoomWidgetAvatarActionUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_757,param3,param4);
         switch(param1)
         {
            case "fx":
               if(param2 == "0")
               {
                  var_207 = EFFECT_INACTIVE;
               }
               else
               {
                  var_207 = EFFECT_ACTIVE;
               }
               break;
            default:
               Logger.log("RoomWidgetAvatarActionUpdateEvent, unknown actiontype: " + param1);
         }
      }
      
      public function get actionType() : String
      {
         return var_207;
      }
   }
}
