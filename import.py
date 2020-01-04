import csv
from flask import Flask, render_template
from models import *


app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///application.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)

def main():
    f = open("publ.csv")
    reader = csv.reader(f)
    for id, pub_type, authors, title, journal, volume, issue, month, year, page_start, page_end, url, doi in reader:
        pub = Publication(pub_type=pub_type, authors=authors, title=title, journal=journal, volume=volume, issue=issue, month=month, year=int(year), page_start=page_start, page_end=page_end, url=url, doi=doi)
        db.session.add(pub)
        print(f"Added {title} by {authors}")
    db.session.commit()


if __name__ == "__main__":
    with app.app_context():
        main()
