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

MEMBER_STATUS = (
    ('faculty', 'Faculty'),
    ('graduate', 'Graduate student'),
    ('undergraduate', 'Undergraduate student'),
    ('alumni', 'Alumni'),
)

class Publication(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    publication_type = models.CharField(choices=PUB_TYPES, max_length=3)
    authors = models.CharField(max_length=255)
    title = models.CharField(max_length=255)
    journal = models.CharField(max_length=255)
    volume = models.IntegerField(blank=True, null=True)
    issue = models.IntegerField(blank=True, null=True)
    month = models.IntegerField(choices=MONTH, blank=True, null=True)
    year = models.IntegerField()
    start_page = models.IntegerField(blank=True, null=True)
    end_page = models.IntegerField(blank=True, null=True)
    url = models.URLField(max_length=255, blank=True, null=True)
    subgroup = models.ForeignKey(
        'Subgroup',
        on_delete=models.SET_NULL,
        to_field='code',
        null=True,
    )
    comments = models.TextField(blank=True, null=True)

    class Meta:
        ordering = ['-year', '-month']

    def __str__(self):
        return f"{self.authors}. {self.title}, {self.journal} ({self.year})"


class Award(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    awardee = models.CharField(max_length=255)
    award = models.CharField(max_length=255)
    awarding_body = models.CharField(max_length=255)
    year = models.IntegerField()
    url = models.URLField(max_length=255, blank=True)

    class Meta:
        ordering = ['-year']

    def __str__(self):
        return f"{self.awardee}: {self.award}, {self.awarding_body} ({self.year})"


class Member(models.Model):
    first_name = models.CharField(max_length=64)
    middle_name = models.CharField(max_length=64, blank=True)
    last_name = models.CharField(max_length=64)
    honorific = models.CharField(max_length=32, blank=True)
    suffix = models.CharField(max_length=32, blank=True)
    status = models.CharField(choices=MEMBER_STATUS, max_length=32)
    subgroup = models.ForeignKey(
        'Subgroup',
        on_delete=models.CASCADE,
        to_field='code',
    )

    def __str__(self):
        return f'{self.first_name} {self.last_name}'


class News(models.Model):
    year = models.IntegerField()
    source = models.CharField(max_length=64)
    url = models.URLField()
    description = models.TextField()
    subgroup = models.ForeignKey(
        'Subgroup',
        on_delete=models.CASCADE,
        to_field='code',
    )

    class Meta:
        ordering = ['-year']

    def __str__(self):
        return self.description


class Project(models.Model):
    name = models.CharField(max_length=255)
    project_leader = models.CharField(max_length=255)
    collaborators = models.CharField(max_length=255)
    funding = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField(blank=True)
    overview = models.TextField()
    subgroup = models.ForeignKey(
        'Subgroup',
        on_delete=models.CASCADE,
        to_field='code',
    )

    class Meta:
        ordering = ['-end_date', '-start_date']

    def __str__(self):
        return self.name


class Subgroup(models.Model):
    slug = models.SlugField(unique=True)
    code = models.CharField(choices=SUBGROUP, max_length=3, unique=True)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name
