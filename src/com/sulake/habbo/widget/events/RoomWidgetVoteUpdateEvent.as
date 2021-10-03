package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWPUE_VOTE_RESULT";
      
      public static const const_119:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1422:int;
      
      private var var_1022:String;
      
      private var var_811:Array;
      
      private var var_1113:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1022 = param2;
         var_1113 = param3;
         var_811 = param4;
         if(var_811 == null)
         {
            var_811 = [];
         }
         var_1422 = param5;
      }
      
      public function get votes() : Array
      {
         return var_811.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1422;
      }
      
      public function get question() : String
      {
         return var_1022;
      }
      
      public function get choices() : Array
      {
         return var_1113.slice();
      }
   }
}
