from django.db import models


PUB_TYPES = (
    ('reg', 'publication'),
    ('spp', 'conference paper'),
)

MONTH = (
    (1, 'January'),
    (2, 'February'),
    (3, 'March'),
    (4, 'April'),
    (5, 'May'),
    (6, 'June'),
    (7, 'July'),
    (8, 'August'),
    (9, 'September'),
    (10, 'October'),
    (11, 'November'),
    (12, 'December'),
)

SUBGROUP = (
    ('ITO', 'IPL Team One'),
    ('VIP', 'Video and Image Processing'),
    ('CXT', 'Complex Systems Team'),
    ('SBO', 'SyncBioOptics'),
    ('CSG', 'Complexity Science Group'),
)

class Publication(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    publication_type = models.CharField(choices=PUB_TYPES, max_length=3)
    authors = models.CharField(max_length=256)
    title = models.CharField(max_length=256)
    journal = models.CharField(max_length=256)
    volume = models.IntegerField(blank=True, null=True)
    issue = models.IntegerField(blank=True, null=True)
    month = models.IntegerField(choices=MONTH, blank=True, null=True)
    year = models.IntegerField()
    start_page = models.IntegerField(blank=True, null=True)
    end_page = models.IntegerField(blank=True, null=True)
    url = models.URLField(max_length=255, blank=True, null=True)
    subgroup = models.CharField(choices=SUBGROUP, max_length=3)
    comments = models.TextField(blank=True, null=True)

    def __repr__(self):
        return f"<Publication: {self.authors}. ({self.year}). {self.title}. {self.journal} {self.volume}>"

    def __str__(self):
        return f"{self.authors}. {self.title}. <a href='{self.url}' target='_blank'><i>{self.journal} <b>{self.volume}</b></i></a>. ({self.year})"


class Award(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    awardee = models.CharField(max_length=64)
    award = models.CharField(max_length=64)
    awarding_body = models.CharField(max_length=64)
    year = models.IntegerField()
    url = models.URLField(max_length=255, blank=True)

    def __repr__(self):
        return f"<Award: {self.awardee}, {self.award}, {self.year}>"

    def __str__(self):
        return f"{self.award}<br /><small class='text-secondary'>{self.awarding_body}, {self.year}</small>"
