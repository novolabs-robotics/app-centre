-- Music Player
-- Created by novolabs

local scr = lv_scr_act()

-- Start audio system and build playlist
audio_start()
audio_build_playlist("/music")
audio_set_volume(30)

-- Cover Image (LVGL image object)
local coverImage = lv_img_create(scr)
lv_obj_set_size(coverImage, 120, 120)
lv_obj_set_align(coverImage, LV_ALIGN_TOP_MID)
lv_obj_set_pos(coverImage, 0, 10)

-- Song Label
local songLabel = lv_label_create(scr)
lv_obj_set_size(songLabel, 290, 21)
lv_label_set_text(songLabel, "Song label")
lv_obj_set_align(songLabel, LV_ALIGN_TOP_MID)
lv_obj_set_text_font(songLabel, "font_montserrat_18")
lv_obj_set_pos(songLabel, 0, 140)

-- Song playtime
local songPlayTime = lv_label_create(scr)
lv_label_set_text(songPlayTime, "00:00")
lv_obj_set_style_text_color(songPlayTime, lv_color_hex(0x808080), LV_PART_MAIN)
lv_obj_set_align(songPlayTime, LV_ALIGN_TOP_LEFT)
lv_obj_set_pos(songPlayTime, 15, 170)

-- Media Panel
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

-- Media Buttons
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

-- Labels for buttons
local function createBtnLabel(btn, txt)
    local lbl = lv_label_create(btn)
    lv_label_set_text(lbl, txt)
    lv_obj_set_align(lbl, LV_ALIGN_CENTER)
end

createBtnLabel(backwardBtn, "Backward")
createBtnLabel(playBtn, "Play")
createBtnLabel(pauseBtn, "Pause")
createBtnLabel(fowardBtn, "Foward")

-- Button events
lua_lv_obj_add_event_cb(playBtn, function()
    if not audio_is_playing() then
        audio_play_current()
    else
        audio_resume()
    end
end, LV_EVENT_CLICKED)

lua_lv_obj_add_event_cb(pauseBtn, function()
    audio_pause()
end, LV_EVENT_CLICKED)

lua_lv_obj_add_event_cb(fowardBtn, function()
    audio_next()
end, LV_EVENT_CLICKED)

lua_lv_obj_add_event_cb(backwardBtn, function()
    audio_prev()
end, LV_EVENT_CLICKED)

-- Update function (song label, time, cover)
local function updateUI()
    local currentSong = audio_get_current()
    if currentSong then
        lv_label_set_text(songLabel, currentSong)
    end

    local sec = math.floor(audio_get_position() / 1000)
    local min = math.floor(sec / 60)
    sec = sec % 60
    lv_label_set_text(songPlayTime, string.format("%02d:%02d", min, sec))

    local coverPath = audio_get_cover()
    if coverPath then
        lv_img_set_src(coverImage, coverPath)
    end
end

-- Create LVGL timer to call updateUI every 1 second
lv_timer_create(updateUI, 1000, nil)
