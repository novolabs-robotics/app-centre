-- Music Player
-- Created by novolabs

audio.start()
audio.setVolume(15)
audio.play("1.mp3")

while true do
  audio.loop()
end
