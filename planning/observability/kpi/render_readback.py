"""Render real Grafana API readback as a clearly labelled editorial PNG, not a screenshot."""
import argparse
from datetime import datetime, timezone
import json
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
from PIL.PngImagePlugin import PngInfo

HERE=Path(__file__).resolve().parent
FONTS=Path("/usr/share/fonts/truetype/dejavu")

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--source",type=Path,default=HERE/"evidence/grafana-verification.json")
    parser.add_argument("--output",type=Path,default=HERE/"evidence/usage-query-results.png")
    a=parser.parse_args()
    d=json.loads(a.source.read_text())
    assert d["records_source"].startswith("Captured Grafana /api/ds/query")
    seven=d["records"]["7d|all|all"]
    month=d["records"]["30d|all|all"]
    empty=d["records"]["7d|payments|staging"]
    image=Image.new("RGB",(1440,1080),"#0b1220")
    draw=ImageDraw.Draw(image)
    WHITE="#f1f5f9"
    MUTE="#9fb0c8"
    ACCENT="#8de2cd"
    BLUE="#a2c5ff"
    CARD="#152238"
    EDGE="#293a55"
    def text(x,y,t,sz=23,c=WHITE,b=False,anchor=None):
        font=ImageFont.truetype(str(FONTS/f"DejaVuSans{'-Bold' if b else ''}.ttf"),sz)
        l,top,r,bt=draw.textbbox((x,y),t,font=font,anchor=anchor)
        assert l>=0 and r<1440 and top>=0 and bt<1080,(t,(l,top,r,bt))
        draw.text((x,y),t,fill=c,font=font,anchor=anchor)
    def box(rect,fill,outline=None,rad=15):
        draw.rounded_rectangle(rect,radius=rad,fill=fill,outline=outline,width=1)
    def pair(r,num,den):
        return f"{int(r[num])} / {int(r[den])}"
    def pct(r,key):
        return f"{r[key]:.1%}"
    cutoff=datetime.fromtimestamp(seven["as_of_timestamp_seconds"],timezone.utc).strftime("%d %b %Y, %H:%M UTC")
    draw.rectangle((0,0,1439,7),fill=ACCENT)
    box((56,42,626,89),"#13352e",rad=10)
    text(74,55,"SYNTHETIC FIXTURE  /  GRAFANA QUERY RESULTS",19,ACCENT,True)
    text(56,111,"QaaS usage, adoption & reliability",43,b=True)
    text(58,178,"Rendered from captured Grafana API values. Not a browser screenshot.",24,MUTE)
    text(58,218,f"All teams  /  All environments  /  Snapshot cutoff: {cutoff}",22,BLUE)
    tiles=[
        ("7-day adoption",pct(seven,"adoption_ratio"),pair(seven,"active_projects","eligible_projects")+" eligible projects active",ACCENT),
        ("30-day adoption",pct(month,"adoption_ratio"),pair(month,"active_projects","eligible_projects")+" eligible projects active",ACCENT),
        ("7-day telemetry coverage",pct(seven,"coverage_ratio"),pair(seven,"covered","expected")+" expected attempts covered",BLUE),
    ]
    for i,(label,number,detail,accent) in enumerate(tiles):
        x=56+i*448
        box((x,272,x+432,428),CARD,EDGE)
        text(x+23,292,label,23,b=True)
        text(x+23,332,number,47,accent,True)
        text(x+23,390,detail,20,MUTE)
    box((56,456,1384,993),CARD,EDGE)
    text(79,481,"Metric",24,b=True)
    text(542,481,"7 days",24,ACCENT,True)
    text(964,481,"30 days",24,BLUE,True)
    rows=[
        ("Enrolled projects",lambda r:pair(r,"enrolled_projects","eligible_projects"),"of eligible"),
        ("Terminal throughput",lambda r:f'{r["attempts"]:g} attempts  ·  {r["throughput_per_day"]:.3g}/day',""),
        ("Capability use",lambda r:" / ".join(f'{r[f"capability_{c}_attempts"]:g}' for c in ("run","act","assert")),"Run / Act / Assert"),
        ("Functional failure",lambda r:pair(r,"assertion_failure","functional_evaluable"),"assertion failures / functional outcomes"),
        ("Observed infra share",lambda r:pair(r,"infra_failure","evaluable"),"infra failures / noncancelled terminals"),
        ("Platform good / expected",lambda r:pair(r,"platform_good","expected"),"valid test outcomes / expected"),
        ("Telemetry coverage",lambda r:pair(r,"covered","expected"),"covered / expected"),
        ("Duration p50 / p95",lambda r:f'{r["duration_p50_seconds"]:g} s / {r["duration_p95_seconds"]:g} s',"noncancelled terminal attempts"),
    ]
    for i,(label,render,note) in enumerate(rows):
        y=526+i*56
        draw.line((78,y,1362,y),fill=EDGE,width=1)
        text(79,y+8,label,21,b=True)
        if note:
            text(79,y+32,note,15,MUTE)
        text(542,y+15,render(seven),23,WHITE,True)
        text(964,y+15,render(month),23,WHITE,True)
    assert empty["attempts"]==0 and empty["coverage_ratio"] is None and empty["adoption_ratio"] is None
    text(58,1014,"Empty payments × staging scope: 0 terminal attempts; adoption and coverage are N/A.",21,MUTE)
    text(1381,1058,f"Grafana {d['grafana']}  /  Prometheus {d['prometheus']}",16,BLUE,anchor="rs")
    meta=PngInfo()
    meta.add_text("Description","Synthetic QaaS values rendered from local Grafana data-frame API readback; not a screenshot.")
    image.save(a.output,optimize=True,pnginfo=meta)
    with Image.open(a.output) as reloaded:
        assert reloaded.size==(1440,1080)
        assert "not a screenshot" in reloaded.info["Description"]
        reloaded.verify()

if __name__=="__main__": main()
