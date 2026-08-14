package spectrum.stampede
module spectrum.stampede.audio

use pan.core.math
use pan.core.collections
use pan.game.audio

const Roots: Seq<f32> = [110, 98, 123, 147, 165, 92, 104, 82]
const Waves: Seq<i32> = [1, 2, 2, 0, 1, 0, 2, 3]
const Motif: Seq<i32> = [0, 4, 7, 11, 12, 9, 7, 4]

state AudioState {
  cursor: i32
}

action Note(i: i32) {
  write Audio
  do => { let f: f32 = 220 * pow(2, i / 12.0); tone(f, 0.09, 0.035, 1, f * 1.22) }
}

action Music(clock: f32, scene: i32, progress: i32, boost: i32, shields: i32) {
  read AudioState
  write AudioState
  write Audio
  do => { let b: i32 = i32(clock * (1.9 + scene * 0.08)); if b != AudioState.cursor => { AudioState.cursor = b; if scene != 7 or shields != 3 or rem(b, 3) == 0 => { let r: f32 = Roots.at(scene); let j: i32 = and32(b, 7); let p: i32 = Motif.at(j) + min(progress, 5); let w: i32 = Waves.at(scene); tone(r * pow(2, p / 12.0), 0.08, 0.011, w); if and32(b, 1) == 0 => { tone(r / 2, 0.055, 0.009, 0, r * 0.48); if boost > 0 => { tone(r * 2, 0.07, 0.01, 1, r * 3) } }; if scene == 7 and shields < 3 and rem(b, 3) == 0 => { tone(r * pow(2, (7 - shields * 2) / 12.0), 0.1, 0.008, 1) } } } }
}

system SpectrumAudioHostContract {
  read AudioState
  write AudioState
  write Audio
  world box 1,1 @16
  menu start "Spectrum Audio" "Host"
  menu end "Spectrum Audio" "Host"
  hud "{AudioState.cursor}"
}
