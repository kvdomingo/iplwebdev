# Generated by Django 3.0.7 on 2020-06-27 19:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0010_auto_20200628_0257'),
    ]

    operations = [
        migrations.AddField(
            model_name='subgroup',
            name='cover_photo',
            field=models.URLField(blank=True),
        ),
    ]
