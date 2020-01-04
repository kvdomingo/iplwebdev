from datetime import datetime
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class TimestampMixin(object):
    date_created = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    last_updated = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)


class Publication(TimestampMixin, db.Model):
    __tablename__ = "publications"
    id = db.Column(db.Integer, primary_key=True)
    pub_type = db.Column(db.String, nullable=False)
    authors = db.Column(db.String, nullable=False)
    title = db.Column(db.String, nullable=False)
    journal = db.Column(db.String, nullable=False)
    volume = db.Column(db.Integer)
    issue = db.Column(db.Integer)
    month = db.Column(db.Integer)
    year = db.Column(db.Integer, nullable=False)
    page_start = db.Column(db.Integer)
    page_end = db.Column(db.Integer)
    url = db.Column(db.String)
    doi = db.Column(db.String)

    def __repr__(self):
        return f"<Publication: {self.authors}. ({self.year}). {self.title}. {self.journal} {self.volume}.>"

    def __str__(self):
        return f"{self.authors}. {self.title}. <a href='{self.url}' target='_blank'><i>{self.journal} <b>{self.volume}</b></i></a>({self.issue}). ({self.year})"
