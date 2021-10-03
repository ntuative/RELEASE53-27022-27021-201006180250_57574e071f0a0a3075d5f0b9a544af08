package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_722:int = 6;
      
      public static const const_232:int = 5;
      
      public static const const_529:int = 2;
      
      public static const const_334:int = 9;
      
      public static const const_317:int = 4;
      
      public static const const_250:int = 2;
      
      public static const const_760:int = 4;
      
      public static const const_243:int = 8;
      
      public static const const_624:int = 7;
      
      public static const const_273:int = 3;
      
      public static const const_347:int = 1;
      
      public static const const_216:int = 5;
      
      public static const const_508:int = 12;
      
      public static const const_333:int = 1;
      
      public static const const_731:int = 11;
      
      public static const const_639:int = 3;
      
      public static const const_1606:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_465:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_465 = new Array();
         var_465.push(new Tab(_navigator,const_347,const_508,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_484));
         var_465.push(new Tab(_navigator,const_250,const_333,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_484));
         var_465.push(new Tab(_navigator,const_317,const_731,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_1049));
         var_465.push(new Tab(_navigator,const_273,const_232,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_484));
         var_465.push(new Tab(_navigator,const_216,const_243,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_708));
         setSelectedTab(const_347);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_465)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_465)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_465)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_317;
      }
      
      public function get tabs() : Array
      {
         return var_465;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
