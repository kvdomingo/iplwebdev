import os, json
from django.shortcuts import render
from django.http import JsonResponse
from django.conf import settings
from .models import *
from .serializers import *
from rest_framework import generics


def profile(request):
    profiles = ['csaloma', 'msoriano', 'mlim', 'gtapang', 'jbantang']
    response = {}
    for profile in profiles:
        with open(os.path.join(settings.BASE_DIR, f'backend/profile/{profile}.json'), 'r') as f:
            response[profile] = json.load(f)
    return JsonResponse(response)


class PublicationApi(generics.ListAPIView):
    queryset = Publication.objects.all().order_by('-id')
    serializer_class = PublicationSerializer
    filterset_fields = ['publication_type', 'year']


class AwardApi(generics.ListAPIView):
    queryset = Award.objects.all().order_by('-year')
    serializer_class = AwardSerializer
    filterset_fields = ['awardee', 'year']
