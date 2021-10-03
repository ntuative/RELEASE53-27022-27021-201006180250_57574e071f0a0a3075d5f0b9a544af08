package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1007:String = "inventory_badges";
      
      public static const const_1220:String = "inventory_clothes";
      
      public static const const_1359:String = "inventory_furniture";
      
      public static const const_704:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1020:String = "inventory_effects";
       
      
      private var var_1853:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_704);
         var_1853 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1853;
      }
   }
}
