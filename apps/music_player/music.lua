-- Music Player
-- Created by novolabs

print("Starting audio test")

audio.setVolume(15)
audio.play("1.mp3")

while true do
  audio.loop()
end
