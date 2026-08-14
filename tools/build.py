from pathlib import Path
import zipfile

R=Path(__file__).resolve().parents[1]
template=R/'src/index.html'
frag=R/'audio/fragment.js'

s=template.read_text(encoding='utf8')
marker='/*__AUDIO_FRAGMENT__*/'
if s.count(marker)!=1:
    raise SystemExit('missing or duplicate audio marker')
s=s.replace(marker,frag.read_text(encoding='utf8'))
(R/'index.html').write_text(s,encoding='utf8')

out=R/'release/SpectrumStampede_M18_JS13K.zip'
out.parent.mkdir(exist_ok=True)
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED,compresslevel=9) as z:
    zi=zipfile.ZipInfo('index.html',(2026,8,14,0,0,0))
    zi.compress_type=zipfile.ZIP_DEFLATED
    zi.external_attr=0o644<<16
    z.writestr(zi,(R/'index.html').read_bytes())

size=out.stat().st_size
limit=13*1024
if size>limit:
    raise SystemExit(f'ZIP is {size} bytes, above 13 KiB ({limit})')
print(f'{out.name}: {size} bytes ({limit-size} bytes headroom)')
