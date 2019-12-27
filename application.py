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
except exc.OperationalError:
    serverhost = "ec2-54-235-86-101.compute-1.amazonaws.com"
    dbusername = "pdaycgrbifbsro"
    dbpass = "e3e53bca35bc08407da364143594b1cb66c6c4d40d641c20f9cd1d7e45982b48"
    dbname = "d8g032nnrlavph"
    engine = create_engine(f"postgresql://{dbusername}:{dbpass}@{serverhost}/{dbname}")
    db = scoped_session(sessionmaker(bind=engine))
    res = db.execute("SELECT * FROM spp")


@app.route("/")
def index():
    this_year = datetime.now().year
    slider_files = os.listdir("web/templates/content")
    adviser_names = ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"]
    adviser_pics = [f"web/static/images/{f}.jpg" for f in adviser_names]
    recent_publ = db.execute("SELECT * FROM spp WHERE year = '2019' LIMIT 5").fetchall()
    return render_template("index.html",
                            this_year=this_year,
                            adviser_names=adviser_names,
                            slider_files=slider_files,
                            adviser_pics=adviser_pics,
                            recent_publ=recent_publ)


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
