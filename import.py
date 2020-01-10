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
    f = open("import_old.csv")
    reader = csv.reader(f)
    for pub_type, authors, title, journal, volume, issue, month, year, page_start, page_end, url, subgroup in reader:
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
        pub = Publication(pub_type=pub_type, authors=authors, title=title, journal=journal, volume=volume, issue=issue, month=month, year=year, page_start=page_start, page_end=page_end, url=url, subgroup=subgroup)
        db.session.add(pub)
        print(f"Added {title} by {authors}")
    db.session.commit()


if __name__ == "__main__":
    with app.app_context():
        main()
