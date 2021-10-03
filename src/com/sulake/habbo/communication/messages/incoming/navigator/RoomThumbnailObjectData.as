package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1564:int;
      
      private var var_1563:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1564;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1564 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1564 = this.var_1564;
         _loc1_.var_1563 = this.var_1563;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1563 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1563;
      }
   }
}
