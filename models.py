from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class Publication(db.Model):
    __tablename__ = "publications"
    id = db.Column(db.Integer, primary_key=True)
    authors = db.Column(db.String, nullable=False)
    title = db.Column(db.String, nullable=False)
    journal = db.Column(db.String, nullable=False)
    volume = db.Column(db.Integer)
    issue = db.Column(db.Integer)
    page_start = db.Column(db.Integer)
    page_end = db.Column(db.Integer)
    url = db.Column(db.String)
    doi = db.Column(db.String)
