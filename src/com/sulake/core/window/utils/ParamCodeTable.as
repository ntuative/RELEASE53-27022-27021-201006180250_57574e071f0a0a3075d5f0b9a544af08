package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["LandscapePlane"] = const_127;
         param1["bound_to_parent_rect"] = const_92;
         param1["child_window"] = const_946;
         param1["embedded_controller"] = const_358;
         param1["resize_to_accommodate_children"] = const_65;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_706;
         param1["mouse_dragging_target"] = const_235;
         param1["mouse_dragging_trigger"] = const_307;
         param1["mouse_scaling_target"] = const_276;
         param1["mouse_scaling_trigger"] = const_415;
         param1["horizontal_mouse_scaling_trigger"] = const_226;
         param1["vertical_mouse_scaling_trigger"] = const_225;
         param1["observe_parent_input_events"] = const_855;
         param1["optimize_region_to_layout_size"] = const_469;
         param1["parent_window"] = const_934;
         param1["relative_horizontal_scale_center"] = const_187;
         param1["relative_horizontal_scale_fixed"] = const_132;
         param1["relative_horizontal_scale_move"] = const_314;
         param1["relative_horizontal_scale_strech"] = const_264;
         param1["relative_scale_center"] = const_1019;
         param1["relative_scale_fixed"] = const_584;
         param1["relative_scale_move"] = const_834;
         param1["relative_scale_strech"] = const_950;
         param1["relative_vertical_scale_center"] = const_191;
         param1["relative_vertical_scale_fixed"] = const_138;
         param1["relative_vertical_scale_move"] = const_318;
         param1["relative_vertical_scale_strech"] = const_251;
         param1["on_resize_align_left"] = const_614;
         param1["on_resize_align_right"] = const_387;
         param1["on_resize_align_center"] = const_455;
         param1["on_resize_align_top"] = const_545;
         param1["on_resize_align_bottom"] = const_405;
         param1["on_resize_align_middle"] = const_427;
         param1["on_accommodate_align_left"] = const_978;
         param1["on_accommodate_align_right"] = const_474;
         param1["on_accommodate_align_center"] = const_536;
         param1["on_accommodate_align_top"] = const_938;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_615;
         param1["route_input_events_to_parent"] = const_414;
         param1["use_parent_graphic_context"] = const_36;
         param1["draggable_with_mouse"] = const_886;
         param1["scalable_with_mouse"] = const_904;
         param1["reflect_horizontal_resize_to_parent"] = const_400;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_281;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
