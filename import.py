import os
import csv
from dotenv import load_dotenv
from flask import Flask, render_template
from models import *


load_dotenv(os.path.join(".env"))

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ["DATABASE_URL"]
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)

def main():
    for c in ["publ.csv", "spp2019.csv"]:
        f = open(c)
        reader = csv.reader(f)
        for id, pub_type, authors, title, journal, volume, issue, month, year, page_start, page_end, url, doi in reader:
            if volume == "":
                volume = None
            if issue == "":
                issue = None
            if month == "":
                month = None
            if page_start == "":
                page_start = None
            if page_end == "":
                page_end = None
            if url == "":
                url = None
            if doi == "":
                doi = None
            pub = Publication(pub_type=pub_type, authors=authors, title=title, journal=journal, volume=volume, issue=issue, month=month, year=year, page_start=page_start, page_end=page_end, url=url, doi=doi)
            db.session.add(pub)
            print(f"Added {title} by {authors}")
    db.session.commit()


if __name__ == "__main__":
    with app.app_context():
        main()
