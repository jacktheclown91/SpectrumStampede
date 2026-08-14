# Spectrum Stampede

A tiny browser arcade racer about a unicorn, a prismatic road, and a deeply
unreasonable amount of weather.

Collect the spectrum in order from RED to VIOLET, trigger Rainbow Burst, and
try not to get shoved off a sky-road that was apparently designed by someone
with a grudge against guardrails. If you make it far enough, the Color Eater is
waiting to turn the whole thing into tasteful grayscale. Rude.

## Controls

- **A / D** or **Left / Right** — steer
- **Space** — jump / start / restart
- **Shift** — drift

## Run

Open `index.html` in a browser.

## Build

Requires Python 3:

```bash
python tools/build.py
```

This rebuilds `index.html` from `src/index.html` plus the checked audio fragment and writes the js13k submission ZIP under `release/`.

The repository is self-contained for normal rebuilding. `audio/source.pan` is the procedural audio source, and `audio/fragment.js` is the checked runtime audio fragment used by the standalone build.

## Public package contents

- `index.html` — ready-to-run game
- `src/index.html` — source template
- `audio/source.pan` — procedural audio source
- `audio/fragment.js` — checked runtime audio fragment
- `tools/build.py` — deterministic public build script
- `release/SpectrumStampede_M18_JS13K.zip` — submission-ready one-file ZIP

No external assets, packages, network services, credentials, or private development evidence are required.

All visuals and audio are generated at runtime from code. The game is small
because the zip limit is small, not because the horse made wise life choices.
