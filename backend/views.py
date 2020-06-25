import os, json
from django.shortcuts import render
from django.http import JsonResponse
from django.conf import settings


def profile(request):
    profiles = ['csaloma', 'msoriano', 'mlim', 'gtapang', 'jbantang']
    response = {}
    for profile in profiles:
        with open(os.path.join(settings.BASE_DIR, f'backend/profile/{profile}.json'), 'r') as f:
            response[profile] = json.load(f)
    return JsonResponse(response)
