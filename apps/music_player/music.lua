-- Music Player
-- Created by novolabs

-- Screen
local scr = lv_scr_act()

-- Start audio
audio_start()
audio_build_playlist("/music")
audio_set_volume(30)

-- Cover Image
coverImg = lv_img_create(scr)
lv_obj_set_size(coverImg, 120, 120)
lv_obj_align(coverImg, LV_ALIGN_TOP_MID, 0, 10)

-- Song Label
local songLabel = lv_label_create(scr)
lv_obj_set_size(songLabel, 290, 21)
lv_label_set_text(songLabel, "No song playing")
lv_obj_set_align(songLabel, LV_ALIGN_TOP_MID)
lv_obj_set_text_font(songLabel, "font_montserrat_18")
lv_obj_set_pos(songLabel, 0, 140)
songLabel.lastSong = ""

-- Song playtime
local songPlayTime = lv_label_create(scr)
lv_label_set_text(songPlayTime, "00:00 / 00:00")
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

-- Buttons
local backwardBtn = lv_btn_create(panel)
lv_obj_set_size(backwardBtn, 50, 50)
lv_obj_set_style_bg_color(backwardBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(backwardBtn, 100, LV_PART_MAIN)
local backwardLabel = lv_label_create(backwardBtn)
lv_label_set_text(backwardLabel, "Prev")
lv_obj_set_align(backwardLabel, LV_ALIGN_CENTER)

local playBtn = lv_btn_create(panel)
lv_obj_set_size(playBtn, 50, 50)
lv_obj_set_style_bg_color(playBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(playBtn, 100, LV_PART_MAIN)
local playLabel = lv_label_create(playBtn)
lv_label_set_text(playLabel, "Play")
lv_obj_set_align(playLabel, LV_ALIGN_CENTER)

local pauseBtn = lv_btn_create(panel)
lv_obj_set_size(pauseBtn, 50, 50)
lv_obj_set_style_bg_color(pauseBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(pauseBtn, 100, LV_PART_MAIN)
local pauseLabel = lv_label_create(pauseBtn)
lv_label_set_text(pauseLabel, "Pause")
lv_obj_set_align(pauseLabel, LV_ALIGN_CENTER)

local fowardBtn = lv_btn_create(panel)
lv_obj_set_size(fowardBtn, 50, 50)
lv_obj_set_style_bg_color(fowardBtn, lv_color_hex(0x202020), LV_PART_MAIN)
lv_obj_set_style_radius(fowardBtn, 100, LV_PART_MAIN)
local fowardLabel = lv_label_create(fowardBtn)
lv_label_set_text(fowardLabel, "Next")
lv_obj_set_align(fowardLabel, LV_ALIGN_CENTER)

-- Button Events
lua_lv_obj_add_event_cb(playBtn, function()
    if not audio_is_playing() then
        audio_play_current()
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

-- Timer: update song label, time, and cover
lv_task_create(function()
    if audio_is_playing() then
        local pos = audio_get_position()
        local dur = audio_get_duration()
        local pos_min = math.floor(pos / 60000)
        local pos_sec = math.floor((pos % 60000) / 1000)
        local dur_min = math.floor(dur / 60000)
        local dur_sec = math.floor((dur % 60000) / 1000)
        lv_label_set_text(songPlayTime, string.format("%02d:%02d / %02d:%02d", pos_min, pos_sec, dur_min, dur_sec))

        -- Update song label if track changed
        local currentSong = audio_get_current()
        if currentSong and currentSong ~= songLabel.lastSong then
            lv_label_set_text(songLabel, currentSong)
            songLabel.lastSong = currentSong

            -- Update cover image
            local coverPath = audio_get_cover()
            if coverPath then
                lv_img_set_src(coverImg, coverPath)
            end
        end
    else
        lv_label_set_text(songPlayTime, "00:00 / 00:00")
    end
end, 1000)
