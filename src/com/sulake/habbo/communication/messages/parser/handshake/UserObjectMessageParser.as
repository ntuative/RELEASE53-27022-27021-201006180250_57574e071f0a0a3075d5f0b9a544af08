package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_406:String;
      
      private var var_2425:String;
      
      private var var_2426:int;
      
      private var var_2424:int;
      
      private var var_616:String;
      
      private var var_1460:String;
      
      private var _name:String;
      
      private var var_527:int;
      
      private var var_920:int;
      
      private var var_2423:int;
      
      private var _respectTotal:int;
      
      private var var_2427:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2424;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1460;
      }
      
      public function get customData() : String
      {
         return this.var_2425;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_527;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2426;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2427;
      }
      
      public function get figure() : String
      {
         return this.var_406;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_616;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_406 = param1.readString();
         this.var_616 = param1.readString();
         this.var_2425 = param1.readString();
         this.var_1460 = param1.readString();
         this.var_2423 = param1.readInteger();
         this.var_2427 = param1.readString();
         this.var_2426 = param1.readInteger();
         this.var_2424 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_920 = param1.readInteger();
         this.var_527 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2423;
      }
      
      public function get respectLeft() : int
      {
         return this.var_920;
      }
   }
}
