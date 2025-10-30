-- Music Player
-- Created by novolabs

local scr = lv_scr_act()

local songLabel = lv_label_create(scr)
lv_obj_set_size(panel, 290, 21)
lv_label_set_text(songLabel, "Loading song...")
lv_obj_set_align(songLabel, LV_ALIGN_BOTTOM_MID)
lv_obj_set_text_font(songLabel, "font_montserrat_18")
lv_obj_set_pos(songLabel, 0, -120)

local songPlayTime = lv_label_create(scr)
lv_label_set_text(songPlayTime, "00:00")
lv_obj_set_style_text_color(songPlayTime, lv_color_hex(0x808080), LV_PART_MAIN)
lv_obj_set_align(songPlayTime, LV_ALIGN_BOTTOM_LEFT)
lv_obj_set_pos(songPlayTime, 15, -100)

local panel = lv_obj_create(scr)
lv_obj_set_size(panel, 290, 60)
lv_obj_set_align(panel, LV_ALIGN_BOTTOM_MID)
lv_obj_set_pos(panel, 0, -15)
lv_obj_set_style_bg_color(panel, lv_color_hex(0x101010), LV_PART_MAIN)
lv_obj_set_style_border_color(panel, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_clear_flag(panel, LV_OBJ_FLAG_SCROLLABLE)
lv_obj_set_flex_flow(panel, LV_FLEX_FLOW_ROW)
lv_obj_set_flex_align(panel, LV_FLEX_ALIGN_SPACE_BETWEEN, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_CENTER)
lv_obj_set_style_radius(panel, 100, LV_PART_MAIN)

local backwardBtn = lv_btn_create(panel)
lv_obj_set_size(backwardBtn, 50, 50)
lv_obj_set_style_bg_color(backwardBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(backwardBtn, 100, LV_PART_MAIN)

local playBtn = lv_btn_create(panel)
lv_obj_set_size(playBtn, 50, 50)
lv_obj_set_style_bg_color(playBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(playBtn, 100, LV_PART_MAIN)

local pauseBtn = lv_btn_create(panel)
lv_obj_set_size(pauseBtn, 50, 50)
lv_obj_set_style_bg_color(pauseBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(pauseBtn, 100, LV_PART_MAIN)

local fowardBtn = lv_btn_create(panel)
lv_obj_set_size(fowardBtn, 50, 50)
lv_obj_set_style_bg_color(fowardBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(fowardBtn, 100, LV_PART_MAIN)

local backwardBtn_label = lv_label_create(backwardBtn)
lv_label_set_text(backwardBtn_label, "Backward")
lv_obj_set_align(backwardBtn_label, LV_ALIGN_CENTER)

local playBtn_label = lv_label_create(playBtn)
lv_label_set_text(playBtn_label, "Play")
lv_obj_set_align(playBtn_label, LV_ALIGN_CENTER)

local pauseBtn_label = lv_label_create(pauseBtn)
lv_label_set_text(pauseBtn_label, "Pause")
lv_obj_set_align(pauseBtn_label, LV_ALIGN_CENTER)

local fowardBtn_label = lv_label_create(fowardBtn)
lv_label_set_text(fowardBtn_label, "Foward")
lv_obj_set_align(fowardBtn_label, LV_ALIGN_CENTER)

--audio.start()
--audio.setVolume(15)
--audio.play("1.mp3")
