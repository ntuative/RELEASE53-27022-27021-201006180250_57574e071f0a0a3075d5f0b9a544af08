package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_940:String = "select_outfit";
       
      
      private var var_1869:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_940);
         var_1869 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1869;
      }
   }
}
