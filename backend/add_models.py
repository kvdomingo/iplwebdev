import os, sys
sys.path.append('.')

import json
from dotenv import load_dotenv
load_dotenv()

import django
django.setup()

from django.conf import settings
from backend.models import Award, Publication


def main():
    with open(os.path.join(settings.BASE_DIR, 'backend/publication/publications.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        obj, created = Publication.objects.update_or_create(id=data[d]['id'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} publication entry with id {obj.id}')

    with open(os.path.join(settings.BASE_DIR, 'backend/publication/awards.json'), 'r') as f:
        data = json.load(f)
    for d in data:
        obj, created = Award.objects.update_or_create(id=data[d]['id'], defaults=dict(**data[d]))
        status = 'Created' if created else 'Updated'
        print(f'{status} award entry with id {obj.id}')


if __name__ == '__main__':
    main()
