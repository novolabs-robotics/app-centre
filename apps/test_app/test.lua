-- test.lua
-- Create a panel (container)
local panel = lv_obj_create(lv_scr_act())
lv_obj_set_size(panel, 200, 150)
lv_obj_set_align(panel, lv.ALIGN_CENTER)  -- center on screen
lv_obj_set_style_bg_color(panel, lv.color_hex(0x3498db), lv.PART_MAIN) -- blue background
lv_obj_set_style_radius(panel, 15, lv.PART_MAIN)  -- rounded corners

-- Add a label
local label = lv_label_create(panel)
lv_label_set_text(label, "Hello Lua + LVGL!")
lv_obj_set_align(label, lv.ALIGN_TOP_MID)
lv_obj_set_style_text_color(label, lv.color_hex(0xffffff), lv.PART_MAIN)

-- Add a button
local btn = lv_btn_create(panel)
lv_obj_set_size(btn, 100, 40)
lv_obj_set_align(btn, lv.ALIGN_BOTTOM_MID)

local btn_label = lv_label_create(btn)
lv_label_set_text(btn_label, "Click Me")
lv_obj_set_style_text_color(btn_label, lv.color_hex(0x000000), lv.PART_MAIN)

-- Button event
lv_obj_add_event_cb(btn, function()
    lv_label_set_text(label, "Button Pressed!")
end, lv.EVENT_CLICKED)

-- Add an image
-- Make sure you have a binary image loaded as lv_img_dsc_t
-- local img = lv_img_create(panel)
-- lv_img_set_src(img, my_image_dsc)
-- lv_obj_set_align(img, lv.ALIGN_CENTER)

-- Animation example: fade in the panel
local anim = lv_anim_t()
lv_anim_init(anim)
lv_anim_set_var(anim, panel)
lv_anim_set_values(anim, 0, 255)   -- opacity from 0 to 255
lv_anim_set_time(anim, 1000)       -- 1 second
lv_anim_set_exec_cb(anim, function(obj, val)
    lv_obj_set_style_opa(obj, val, lv.PART_MAIN)
end)
lv_anim_start(anim)
