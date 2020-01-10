import os
from dotenv import load_dotenv
from flask import Flask, render_template
from models import *


load_dotenv(os.path.join(".env"))

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ["DATABASE_URL"]
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)

def main():
    response = Publication.query.all()
    for row in response:
        if row.authors.find("Saloma") != -1:
            subgroup = "ITO"
        elif row.authors.find("Soriano") != -1:
            subgroup = "VIP"
        elif row.authors.find("Lim") != -1:
            subgroup = "CXT"
        elif row.authors.find("Tapang") != -1:
            subgroup = "SBO"
        elif row.authors.find("Bantang") != -1 or row.authors.find("Batac") != -1:
            subgroup = "CSG"
        else:
            raise ValueError(f"No valid adviser found for {row}")
        row.subgroup = subgroup
    db.session.commit()


if __name__ == "__main__":
    with app.app_context():
        main()
