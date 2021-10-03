package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_763;
         param1["bitmap"] = const_696;
         param1["border"] = const_698;
         param1["border_notify"] = const_1375;
         param1["button"] = const_399;
         param1["button_thick"] = const_632;
         param1["button_icon"] = const_1267;
         param1["button_group_left"] = const_532;
         param1["button_group_center"] = const_687;
         param1["button_group_right"] = const_671;
         param1["canvas"] = const_586;
         param1["checkbox"] = const_689;
         param1["closebutton"] = const_841;
         param1["container"] = const_361;
         param1["container_button"] = const_565;
         param1["display_object_wrapper"] = const_530;
         param1["dropmenu"] = const_404;
         param1["dropmenu_item"] = const_413;
         param1["frame"] = const_311;
         param1["frame_notify"] = const_1386;
         param1["header"] = const_738;
         param1["icon"] = const_889;
         param1["itemgrid"] = const_974;
         param1["itemgrid_horizontal"] = const_467;
         param1["itemgrid_vertical"] = const_620;
         param1["itemlist"] = const_1047;
         param1["itemlist_horizontal"] = const_337;
         param1["itemlist_vertical"] = const_313;
         param1["maximizebox"] = const_1406;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1404;
         param1["submenu"] = const_981;
         param1["minimizebox"] = const_1360;
         param1["notify"] = const_1247;
         param1["LandscapePlane"] = const_666;
         param1["password"] = const_638;
         param1["radiobutton"] = const_571;
         param1["region"] = const_449;
         param1["restorebox"] = const_1331;
         param1["scaler"] = const_646;
         param1["scaler_horizontal"] = const_1405;
         param1["scaler_vertical"] = const_1226;
         param1["scrollbar_horizontal"] = const_479;
         param1["scrollbar_vertical"] = const_669;
         param1["scrollbar_slider_button_up"] = const_955;
         param1["scrollbar_slider_button_down"] = const_927;
         param1["scrollbar_slider_button_left"] = const_859;
         param1["scrollbar_slider_button_right"] = const_862;
         param1["scrollbar_slider_bar_horizontal"] = const_914;
         param1["scrollbar_slider_bar_vertical"] = const_937;
         param1["scrollbar_slider_track_horizontal"] = const_964;
         param1["scrollbar_slider_track_vertical"] = const_988;
         param1["scrollable_itemlist"] = const_1394;
         param1["scrollable_itemlist_vertical"] = const_438;
         param1["scrollable_itemlist_horizontal"] = const_901;
         param1["selector"] = const_758;
         param1["selector_list"] = const_540;
         param1["submenu"] = const_981;
         param1["tab_button"] = const_612;
         param1["tab_container_button"] = const_912;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_970;
         param1["tab_selector"] = const_648;
         param1["text"] = const_623;
         param1["input"] = const_719;
         param1["toolbar"] = const_1298;
         param1["tooltip"] = const_303;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
