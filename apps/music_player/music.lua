-- Music Player
-- Created by novolabs

local scr = lv_scr_act()

local songLabel = lv_label_create(scr)
lv_label_set_text(songLabel, "Loading song...")
lv_obj_set_align(songLabel, LV_ALIGN_BOTTOM_MID)
lv_obj_set_text_font(songLabel, "font_montserrat_18")
lv_obj_set_pos(songLabel, 0, -115)

local songPlayTime = lv_label_create(scr)
lv_label_set_text(songPlayTime, "00:00")
lv_obj_set_align(songPlayTime, LV_ALIGN_BOTTOM_LEFT)
lv_obj_set_pos(songPlayTime, 15, -95)

local panel = lv_obj_create(scr)
lv_obj_set_size(panel, 320, 50)
lv_obj_set_align(panel, LV_ALIGN_BOTTOM_MID)
lv_obj_set_pos(panel, 0, -15)
lv_obj_set_style_bg_color(panel, lv_color_hex(0, 0, 0), LV_PART_MAIN)
lv_obj_set_style_radius(panel, 0, LV_PART_MAIN)
lv_obj_set_flex_flow(panel, LV_FLEX_FLOW_ROW)
lv_obj_set_flex_align(panel, LV_FLEX_ALIGN_SPACE_BETWEEN, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_CENTER)

local backwardBtn = lv_btn_create(panel)
lv_obj_set_size(backwardBtn, 50, 50)
lv_obj_set_style_bg_color(backwardBtn, lv_color_hex(20, 20, 20), LV_PART_MAIN)

local playBtn = lv_btn_create(panel)
lv_obj_set_size(playBtn, 50, 50)
lv_obj_set_style_bg_color(playBtn, lv_color_hex(20, 20, 20), LV_PART_MAIN)

local pauseBtn = lv_btn_create(panel)
lv_obj_set_size(pauseBtn, 50, 50)
lv_obj_set_style_bg_color(pauseBtn, lv_color_hex(20, 20, 20), LV_PART_MAIN)

local fowardBtn = lv_btn_create(panel)
lv_obj_set_size(fowardBtn, 50, 50)
lv_obj_set_style_bg_color(fowardBtn, lv_color_hex(20, 20, 20), LV_PART_MAIN)

audio.start()
audio.setVolume(15)
audio.play("1.mp3")
