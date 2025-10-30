-- test.lua

-- Get the active screen
local scr = lv_scr_act()

-- Create a panel (generic object)
local panel = lv_obj_create(scr)
lv_obj_set_size(panel, 200, 120)
lv_obj_set_align(panel, LV_ALIGN_CENTER)
lv_obj_set_style_bg_color(panel, lv_color_hex(52, 152, 219), LV_PART_MAIN)
lv_obj_set_style_radius(panel, 10, LV_PART_MAIN)

-- Add a label on the panel
local label = lv_label_create(panel)
lv_label_set_text(label, "Hello LVGL Lua!")
lv_obj_set_align(label, LV_ALIGN_CENTER)

-- Add a button
local btn = lv_btn_create(panel)
lv_obj_set_size(btn, 80, 40)
lv_obj_set_align(btn, LV_ALIGN_BOTTOM_MID)
lv_obj_set_style_bg_color(btn, lv_color_hex(231, 76, 60), LV_PART_MAIN)

-- Add a label on the button
local btn_label = lv_label_create(btn)
lv_label_set_text(btn_label, "Click Me")
lv_obj_set_align(btn_label, LV_ALIGN_CENTER)

-- Animate the panel horizontally (X position)
lv_anim_x(panel, 50, 150, 2000)       -- moves X from 50 -> 150 in 2s
-- Animate the panel vertically (Y position)
lv_anim_y(panel, 60, 100, 2000)       -- moves Y from 60 -> 100 in 2s
-- Animate the panel width
lv_anim_width(panel, 200, 250, 2000)  -- width 200 -> 250
-- Animate the panel height
lv_anim_height(panel, 120, 180, 2000) -- height 120 -> 180
-- Animate the corner radius
lv_anim_radius(panel, 10, 30, 2000)   -- radius 10 -> 30
