from datetime import datetime
from application import db


class TimestampMixin:
    date_created = db.Column(db.DateTime, nullable=False, default=datetime.now)
    last_updated = db.Column(db.DateTime, default=datetime.now, nullable=False, onupdate=datetime.now)


class Publication(TimestampMixin, db.Model):
    __tablename__ = "publications"
    id = db.Column(db.Integer, primary_key=True)
    pub_type = db.Column(db.String(3), nullable=False)
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
    subgroup = db.Column(db.String(3), nullable=False)
    remarks = db.Column(db.String)

    def __repr__(self):
        return f"<Publication: {self.authors}. ({self.year}). {self.title}. {self.journal} {self.volume}>"

    def __str__(self):
        return f"{self.authors}. {self.title}. <a href='{self.url}' target='_blank'><i>{self.journal} <b>{self.volume}</b></i></a>. ({self.year})"


class Award(TimestampMixin, db.Model):
    __tablename__ = "awards"
    id = db.Column(db.Integer, primary_key=True)
    awardee = db.Column(db.String, nullable=False)
    award = db.Column(db.String, nullable=False)
    awarding_body = db.Column(db.String, nullable=False)
    year = db.Column(db.Integer, nullable=False)
    url = db.Column(db.String)

    def __repr__(self):
        return f"<Award: {self.awardee}, {self.award}, {self.year}>"

    def __str__(self):
        return f"{self.award}<br /><small class='text-secondary'>{self.awarding_body}, {self.year}</small>"


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String)
    last_name = db.Column(db.String)
    username = db.Column(db.String, unique=True, nullable=False)
    email = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)

    @property
    def is_authenticated(self):
        return True

    @property
    def is_active(self):
        return True

    @property
    def is_anonymous(self):
        return False

    def get_id(self):
        return self.id

    def __unicode__(self):
        return self.username
