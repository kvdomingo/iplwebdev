from django.db import models
from django.utils import timezone


# Create your models here.
class Publication(models.Model):
    authors = models.CharField(max_length=512)
    title = models.CharField(max_length=512)
    journal = models.CharField(max_length=512)
    volume = models.IntegerField(blank=True)
    issue = models.IntegerField(blank=True)
    page_start = models.IntegerField(blank=True)
    page_end = models.IntegerField(blank=True)
    month = models.IntegerField(blank=True)
    year = models.IntegerField(blank=True)
    pubtype = models.CharField(max_length=3)
    date_inserted = models.DateTimeField(default=timezone.now())
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.authors}. {self.title}. <i>{self.journal}</i>, {self.volume}. ({self.year})."
