import os, sys
sys.path.append('.')

import json
from dotenv import load_dotenv
load_dotenv()

import django
django.setup()

from django.conf import settings
from backend.models import *


def main():
    # Subgroups
    with open(os.path.join(settings.BASE_DIR, 'backend/subgroup/subgroup.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        obj, created = Subgroup.objects.update_or_create(slug=data[d]['slug'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} subgroup entry with {obj.name}')

    # Members
    with open(os.path.join(settings.BASE_DIR, 'backend/subgroup/members.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        data[d]['subgroup'] = Subgroup.objects.get(code=data[d]['subgroup'])
        obj, created = Member.objects.update_or_create(
            first_name=data[d]['first_name'],
            last_name=data[d]['last_name'],
            defaults=dict(**data[d]),
        )
        status = 'Created' if created else 'Updated'
        print(f'{status} member entry {obj.first_name} {obj.last_name}')

    # Publications
    with open(os.path.join(settings.BASE_DIR, 'backend/publication/publications.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        data[d]['subgroup'] = Subgroup.objects.get(code=data[d]['subgroup'])
        obj, created = Publication.objects.update_or_create(id=data[d]['id'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} publication entry with id {obj.id}')

    # Projects
    with open(os.path.join(settings.BASE_DIR, 'backend/subgroup/projects.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        data[d]['subgroup'] = Subgroup.objects.get(code=data[d]['subgroup'])
        obj, created = Project.objects.update_or_create(name=data[d]['name'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} project entry {obj.name}')

    # News
    with open(os.path.join(settings.BASE_DIR, 'backend/subgroup/news.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        data[d]['subgroup'] = Subgroup.objects.get(code=data[d]['subgroup'])
        obj, created = News.objects.update_or_create(description=data[d]['description'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} news entry {obj.description}')

    # Awards
    with open(os.path.join(settings.BASE_DIR, 'backend/publication/awards.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        obj, created = Award.objects.update_or_create(id=data[d]['id'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} award entry with id {obj.id}')


if __name__ == '__main__':
    main()
