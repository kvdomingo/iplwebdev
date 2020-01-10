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
    f = open("awards.csv")
    reader = csv.reader(f)
    for awardee, award, awarding_body, year, url in reader:
        if url == "":
            url = None
        aw = Award(awardee=awardee, award=award, awarding_body=awarding_body, year=year, url=url)
        db.session.add(aw)
        print(f"Added {award} for {awardee}")
    db.session.commit()


if __name__ == "__main__":
    with app.app_context():
        main()
