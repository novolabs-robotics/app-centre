-- test.lua

-- Get the active screen
local scr = lv_scr_act()

-- Create a panel (generic object)
local panel = lv_obj_create(scr)
lv_obj_set_size(panel, 200, 200)
lv_obj_set_align(panel, LV_ALIGN_CENTER)
lv_obj_set_style_bg_color(panel, lv_color_hex(0x101010), LV_PART_MAIN)
lv_obj_set_style_border_color(panel, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(panel, 20, LV_PART_MAIN)
lv_obj_clear_flag(panel, LV_OBJ_FLAG_SCROLLABLE)
--lv_obj_set_flex_flow(panel, LV_FLEX_FLOW_ROW)
--lv_obj_set_flex_align(panel, LV_FLEX_ALIGN_SPACE_BETWEEN, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_CENTER)

-- Add a label on the panel
local label = lv_label_create(panel)
lv_label_set_text(label, "Hello LVGL Lua!")
lv_obj_set_align(label, LV_ALIGN_TOP_MID)
lv_obj_set_text_font(label, "font_montserrat_18")

-- Add a button
local btn = lv_btn_create(panel)
lv_obj_set_size(btn, 80, 50)
lv_obj_set_align(btn, LV_ALIGN_BOTTOM_MID)
lv_obj_set_style_bg_color(btn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(btn, 100, LV_PART_MAIN)

-- Add a label on the button
local btn_label = lv_label_create(btn)
lv_label_set_text(btn_label, "Click Me")
lv_obj_set_align(btn_label, LV_ALIGN_CENTER)
lv_obj_set_style_text_color(btn_label, lv_color_hex(0x808080), LV_PART_MAIN)
