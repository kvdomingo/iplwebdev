from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from models import *


app = Flask(__name__,
            static_url_path="",
            static_folder="web/static",
            template_folder="web/templates")
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///application.db"
# app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://postgres:16431879199842@localhost/postgres"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# try:
#     serverhost = "localhost"
#     dbusername = "postgres"
#     dbpass = "16431879199842"
#     dbname = "postgres"
#     db = create_engine(f"postgresql://{dbusername}:{dbpass}@{serverhost}/{dbname}")
#     res = db.execute("SELECT * FROM spp")
#     print("Using local db")
# except exc.OperationalError:
#     serverhost = "ec2-107-22-216-123.compute-1.amazonaws.com"
#     dbusername = "nsrmkjoiqfjjsp"
#     dbpass = "6a666281fe79f531447f30f4b82c0d4faf7adb8fd4dd649bbca920bbd6a27384"
#     dbname = "d26ufums94l5nf"
#     db = create_engine(f"postgresql://{dbusername}:{dbpass}@{serverhost}/{dbname}")
#     res = db.execute("SELECT * FROM spp")
#     print("Using Heroku db")

db = SQLAlchemy(app)
migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command("db", MigrateCommand)


if __name__ == "__main__":
    manager.run()
