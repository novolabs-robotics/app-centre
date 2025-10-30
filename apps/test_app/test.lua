-- test.lua

-- Get the active screen
local scr = lv_scr_act()

-- Create a panel (generic object)
local panel = lv_obj_create(scr)
lv_obj_set_size(panel, 200, 120)
lv_obj_set_align(panel, LV_ALIGN_CENTER)
lv_obj_set_style_bg_color(panel, lv_color_hex(0x3498db), LV_PART_MAIN)
lv_obj_set_style_radius(panel, 10, LV_PART_MAIN)

-- Add a label on the panel
local label = lv_label_create(panel)
lv_label_set_text(label, "Hello LVGL Lua!")
lv_obj_set_align(label, LV_ALIGN_CENTER)

-- Add a button
local btn = lv_btn_create(panel)
lv_obj_set_size(btn, 80, 40)
lv_obj_set_align(btn, LV_ALIGN_BOTTOM_MID)
lv_obj_set_style_bg_color(btn, lv_color_hex(0xe74c3c), LV_PART_MAIN)
lv_obj_set_style_radius(btn, 5, LV_PART_MAIN)

-- Add a label on the button
local btn_label = lv_label_create(btn)
lv_label_set_text(btn_label, "Click Me")
lv_obj_set_align(btn_label, LV_ALIGN_CENTER)

-- Optional: add a simple horizontal animation for the panel
local anim = lv_anim_t()
lv_anim_init(anim)
lv_anim_set_var(anim, panel)
lv_anim_set_exec_cb(anim, function(obj, v)
    lv_obj_set_x(obj, v)
end)
lv_anim_set_values(anim, 50, 150)
lv_anim_set_time(anim, 2000)
lv_anim_set_playback_time(anim, 2000)
lv_anim_set_repeat_count(anim, LV_ANIM_REPEAT_INFINITE)
lv_anim_start(anim)
