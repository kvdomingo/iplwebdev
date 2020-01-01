from django.db import models


# Create your models here.
class Publication(models.Model):
    authors = models.CharField(max_length=512)
    title = models.CharField(max_length=512)
    journal = models.CharField(max_length=512)
    volume = models.CharField(max_length=32)
    month = models.CharField(max_length=16)
    year = models.IntegerField()
    pubtype = models.CharField(max_length=3)

    def __str__(self):
        return f"{self.authors}. {self.title}. <i>{self.journal}</i>, {self.volume}. ({self.year})."
