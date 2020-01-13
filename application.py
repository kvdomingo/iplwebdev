import os
from dotenv import load_dotenv
from calendar import month_name
from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, json
from flask_sqlalchemy import SQLAlchemy


load_dotenv(os.path.join(".env"))

app = Flask(__name__,
            static_url_path="",
            static_folder="web/static",
            template_folder="web/templates")
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ["DATABASE_URL"]
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy(app)
from models import *


@app.context_processor
def inject_now():
    return {"now": datetime.now()}


@app.context_processor
def inject_month():
    month_list = [m for m in month_name]
    return {"month_list": month_list}


@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html.j2"), 404


@app.route("/")
def index():
    slider_files = os.listdir("web/templates/content/home")
    adviser_names = ["Saloma", "Soriano", "Lim", "Tapang", "Bantang"]
    adviser_pics = [f"images/{f}.jpg" for f in adviser_names]
    recent_publ = Publication.query.filter(Publication.year == 2019) \
                                    .filter(Publication.pub_type != "spp") \
                                    .filter(Publication.volume != None) \
                                    .filter(Publication.authors != "C Saloma") \
                                    .order_by(Publication.month.desc()) \
                                    .limit(3) \
                                    .all()
    carousel_pics = ["IPL Text.png", "National_Institute_of_Physics_logo.png",
                    "ipl grp.jpg", "Saloma.jpg",
                    "Soriano.jpg", "Lim.jpg",
                    "Tapang.jpg", "Bantang.jpg",
                    "csdean.jpg", "Saloma.jpg"]
    research_pics = ["signalproc.png", "cxsystems.png",
                    "videoimgproc.png", "bio.png",
                    "optics.png"]
    return render_template("index.html.j2",
                            adviser_names=adviser_names,
                            slider_files=slider_files,
                            adviser_pics=adviser_pics,
                            recent_publ=recent_publ,
                            carousel_pics=carousel_pics,
                            research_pics=research_pics)


@app.route("/about")
def about():
    return render_template("about.html.j2")


@app.route("/principal-investigators")
def principals():
    adviser_names = ["Caesar A. Saloma", "Maricor N. Soriano", "May T. Lim", "Giovanni A. Tapang", "Johnrob Y. Bantang"]
    adviser_surnames = [n.split(" ")[-1] for n in adviser_names]
    return render_template("principals.html.j2",
                            summary=zip(adviser_names, adviser_surnames))


@app.route("/profile/<string:principal>")
def principal_bio(principal):
    with open(f"web/static/content/profile/{principal}.json", encoding="utf-8") as f:
        data = json.load(f)
    awards = Award.query.filter(Award.awardee.contains(principal[1:].capitalize())) \
                        .order_by(Award.year.desc()) \
                        .limit(5) \
                        .all()
    publications = Publication.query.filter(Publication.authors.contains(principal[1:].capitalize())) \
                                    .filter(Publication.pub_type == "reg") \
                                    .filter(Publication.url != None) \
                                    .filter(Publication.volume != None) \
                                    .order_by(Publication.year.desc()) \
                                    .limit(5) \
                                    .all()
    return render_template("profile.html.j2",
                            data=data,
                            principal=principal,
                            image_src=principal[1:].capitalize(),
                            awards=awards,
                            publications=publications)


@app.route("/publications")
def publications():
    reg_years = [2019, 2018, 2017, 2016, 2015, 2014, 2013]
    spp_years = [2019]
    regular = []
    spp = []
    for y in reg_years:
        res = Publication.query.filter(Publication.pub_type == "reg") \
                                .filter(Publication.year == y) \
                                .all()
        regular.append(res)
    for y in spp_years:
        res = Publication.query.filter(Publication.pub_type == "spp") \
                                .filter(Publication.year == y) \
                                .all()
        spp.append(res)
    return render_template("publications.html.j2",
                            regular=regular,
                            reg_years=reg_years,
                            spp=spp,
                            spp_years=spp_years)


@app.route("/research")
def research():
    return render_template("research.html.j2")


@app.route("/report-publication")
def add_publication():
    subgroups = ["Select subgroup...", "Team One", "Synchronization & BioOptics", "Video & Image Processing", "Complexity Science Group", "CX Team"]
    return render_template("add_publication.html.j2",
                            subgroups=subgroups)


@app.route("/success", methods=["POST"])
def add_publ_success():
    key, val = [], []
    form_items = {}
    month_keys = [f for f in month_name]
    month_values = [str(i) for i in range(len(month_keys))]
    subgroups = ["Team One", "Synchronization & BioOptics", "Video & Image Processing", "Complexity Science Group", "CX Team"]
    sub_abbrev = ["ITO", "SBO", "VIP", "CSG", "CXT"]
    subg_dict = dict(zip(subgroups, sub_abbrev))
    month_values[0] = None
    for k, v in request.form.items():
        if v == "":
            v = None
        if k == "authors":
            v = v.split(" and ")
            v = [a.split(", ") for a in v]
            auth = []
            for i in range(len(v)):
                if len(v) > 1 and i + 1 == len(v):
                    auth.append(f"and {v[i][1][0]} {v[i][0]}")
                else:
                    auth.append(f"{v[i][1][0]} {v[i][0]}")
            v = ", ".join(auth)
        if k == "submitter_name":
            submitter_name = v
            continue
        if k == "submitter_email":
            submitter_email = v
            continue
        form_items[k] = v
        if k == "subgroup":
            v = subg_dict[v]
    try:
        month_dict = dict(zip(month_keys, month_values))
        form_items["month"] = month_dict[form_items["month"]]
    except KeyError:
        pass
    form_items["pub_type"] = "reg"
    form_items["remarks"] = f"Submitted by: {submitter_name} via {url_for('add_publication')}\nContact: {submitter_email}."
    db.session.add(Publication(**form_items))
    db.session.commit()
    return render_template("success.html.j2")


if __name__ == "__main__":
    app.run()
