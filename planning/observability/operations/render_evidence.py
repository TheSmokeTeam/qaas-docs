"""Render a publication figure from actual Grafana API numeric responses (not a screenshot)."""
import argparse, json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

P=argparse.ArgumentParser(description=__doc__)
P.add_argument("--input",type=Path,default=Path("loopback-evidence.json"))
P.add_argument("--output",type=Path,default=Path("operations-query-evidence.png"))
cfg=P.parse_args()
data=json.loads(cfg.input.read_text())
nums={(x["panel_id"],x["ref"]):x["instant"][0] for x in data["targets"] if x["instant"]}
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":13,"text.color":"#213448",
                     "axes.labelcolor":"#3b5269","xtick.color":"#3b5269","ytick.color":"#3b5269"})
fig=plt.figure(figsize=(12.5,6.25),dpi=160,facecolor="#f1f5f9")
fig.text(.068,.88,"QaaS operational dashboard",fontsize=30,fontweight="bold",color="#14283a")
fig.text(.07,.808,"Synthetic loopback verification • Values returned by Grafana's Prometheus datasource",
         fontsize=13,color="#42576b")
left=fig.add_axes([.10,.31,.39,.36],facecolor="#e6eef6")
right=fig.add_axes([.59,.31,.34,.36],facecolor="#e6eef6")

def plot(ax,y,label,v,ceiling,fmt,color):
    ax.barh(y,v,height=.48,color=color,zorder=3)
    ax.text(v+ceiling*.027,y,fmt(v),va="center",color="#14283a",fontsize=13,fontweight="bold")
    ax.text(0,y+.42,label,va="center",fontsize=11)
    ax.set_xlim(0,ceiling)
for ax in (left,right):
    ax.set_ylim(-.55,2.8);ax.set_yticks([])
    ax.xaxis.grid(color="#c7d5e1",zorder=0)
    ax.tick_params(axis="both",length=0,pad=8)
    for spine in ax.spines.values():spine.set_visible(False)

colors=("#156a8a","#227a67","#ac5732")
for (y,label,key),color in zip(((2,"Queue occupancy / capacity",(3,"A")),
    (1,"Mocker hits / (hits + misses)",(10,"A")),
    (0,"Mocker internal errors / accepted",(10,"B"))),colors):
    plot(left,y,label,nums[key]*100,107,lambda v:f"{v:.0f}%",color)
left.set_xticks([0,20,40,60,80,100],["0%","20%","40%","60%","80%","100%"])
for (y,label,key),color in zip(((2,"Durable delivery p50",(7,"A")),
    (1,"Durable delivery p95",(7,"B")),
    (0,"Mocker HTTP handling p95",(11,"A"))),colors):
    plot(right,y,label,nums[key],3.4,lambda v:f"{v:.2f} s",color)
right.set_xticks([0,1,2,3],["0 s","1 s","2 s","3 s"])
fig.text(.07,.185,"11 panels • 21 expressions • 20 active range queries • missing job tested separately",
         fontsize=14,fontweight="bold",color="#203c53")
fig.text(.07,.11,f"Grafana {data['grafana']} + Prometheus {data['prometheus']} • Rendered from API evidence; not a Grafana screenshot.",
         fontsize=11,color="#42576b")
fig.savefig(cfg.output,dpi=160,facecolor=fig.get_facecolor())
