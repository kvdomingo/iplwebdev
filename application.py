import os
from datetime import datetime
from flask import Flask, render_template
from sqlalchemy import create_engine, exc
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__,
            static_url_path="",
            static_folder="web/static",
            template_folder="web/templates")

try:
    serverhost = "localhost"
    dbusername = "postgres"
    dbpass = "16431879199842"
    dbname = "postgres"
    engine = create_engine(f"postgresql://{dbusername}:{dbpass}@{serverhost}/{dbname}")
    db = scoped_session(sessionmaker(bind=engine))
    res = db.execute("SELECT * FROM spp")
    print("Using local db")
except exc.OperationalError:
    serverhost = "ec2-107-22-216-123.compute-1.amazonaws.com"
    dbusername = "nsrmkjoiqfjjsp"
    dbpass = "6a666281fe79f531447f30f4b82c0d4faf7adb8fd4dd649bbca920bbd6a27384"
    dbname = "d26ufums94l5nf"
    engine = create_engine(f"postgresql://{dbusername}:{dbpass}@{serverhost}/{dbname}")
    db = scoped_session(sessionmaker(bind=engine))
    res = db.execute("SELECT * FROM spp")
    print("Using Heroku db")

@app.route("/")
def index():
    this_year = datetime.now().year
    slider_files = os.listdir("web/templates/content")
    adviser_names = ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"]
    adviser_pics = [f"images/{f}.jpg" for f in adviser_names]
    recent_publ = db.execute("SELECT * FROM spp WHERE year = '2019' LIMIT 5").fetchall()
    carousel_pics = ["IPL Text.png", "National_Institute_of_Physics_logo.png",
                    "ipl grp.jpg", "Saloma.jpg",
                    "Soriano.jpg", "Lim.jpg",
                    "Tapang.jpg", "Bantang.jpg",
                    "csdean.jpg", "Saloma.jpg"]
    research_pics = ["signalproc.png", "cxsystems.png",
                    "videoimgproc.png", "bio.png",
                    "optics.png"]
    return render_template("index.html",
                            this_year=this_year,
                            adviser_names=adviser_names,
                            slider_files=slider_files,
                            adviser_pics=adviser_pics,
                            recent_publ=recent_publ,
                            carousel_pics=carousel_pics,
                            research_pics=research_pics)


@app.route("/publications")
def publications():
    reg_years = [2019, 2018, 2017]
    spp_years = [2019]
    regular = []
    spp = []
    for y in reg_years:
        res = db.execute("SELECT * FROM regular WHERE year = :year",
                        {"year": y}).fetchall()
        regular.append(res)
    for y in spp_years:
        res = db.execute("SELECT * FROM spp WHERE year = :year",
                        {"year": str(y)}).fetchall()
        spp.append(res)
    return render_template("publications.html",
                            regular=regular,
                            reg_years=reg_years,
                            spp=spp,
                            spp_years=spp_years)
