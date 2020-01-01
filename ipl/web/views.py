import os
from django.shortcuts import render
from django.http import HttpResponse
from .models import Publication
from datetime import datetime

# Create your views here.
def index(request):
    adviser_names = ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"],
    slider_files = os.listdir("web/templates/web/content")
    slider_range = range(len(slider_files))
    card_names = ["Dr. Caesar Saloma", "Dr. Maricor Soriano",
                    "Dr. May Lim", "Dr. Giovanni Tapang",
                    "Dr. Johnrob Bantang"]
    card_tags = ["#" + (f.split(" ")[-1]).lower() for f in card_names]
    context = {
        "recent_publ": Publication.objects.all()[:10],
        "this_year": datetime.now().year,
        "slider_files": slider_files,
        "slider_range": slider_range,
        "adviser_names": ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"],
        "adviser_names": ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"],
        "adviser_pics": [f"images/{f}.jpg" for f in adviser_names],
        "carousel_pics": ["IPL Text.png", "National_Institute_of_Physics_logo.png",
                        "ipl grp.jpg", "Saloma.jpg",
                        "Soriano.jpg", "Lim.jpg",
                        "Tapang.jpg", "Bantang.jpg",
                        "csdean.jpg", "Saloma.jpg"],
        "research_pics": ["signalproc.png", "cxsystems.png",
                        "videoimgproc.png", "bio.png",
                        "optics.png"],
        "research_names": ["Signal Processing", "Complex Systems & Networks",
                        "Video & Image Processing", "Biological Systems", "Optics"],
        "card_names": ["Dr. Caesar Saloma", "Dr. Maricor Soriano",
                        "Dr. May Lim", "Dr. Giovanni Tapang",
                        "Dr. Johnrob Bantang"],
        "names": zip(card_names, card_tags)
    }
    return render(request, "web/index.html", context)
