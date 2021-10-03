package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_125:String = "RSPE_VOTE_RESULT";
      
      public static const const_119:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1422:int = 0;
      
      private var var_1022:String = "";
      
      private var var_811:Array;
      
      private var var_1113:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1113 = [];
         var_811 = [];
         super(param1,param2,param7,param8);
         var_1022 = param3;
         var_1113 = param4;
         var_811 = param5;
         if(var_811 == null)
         {
            var_811 = [];
         }
         var_1422 = param6;
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
