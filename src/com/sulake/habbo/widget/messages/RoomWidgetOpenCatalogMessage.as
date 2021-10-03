package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_842:String = "RWOCM_CLUB_MAIN";
      
      public static const const_535:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1906:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_535);
         var_1906 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1906;
      }
   }
}
