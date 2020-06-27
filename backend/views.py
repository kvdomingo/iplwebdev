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
    queryset = Publication.objects.all().order_by('-year', '-month')
    serializer_class = PublicationSerializer
    filterset_fields = ['publication_type', 'year', 'subgroup__slug']


class AwardApi(generics.ListAPIView):
    queryset = Award.objects.all().order_by('-year')
    serializer_class = AwardSerializer
    filterset_fields = ['awardee', 'year']


class MemberApi(generics.ListAPIView):
    queryset = Member.objects.all()
    serializer_class = MemberSerializer
    filterset_fields = ['subgroup__slug', 'status']


class NewsApi(generics.ListAPIView):
    queryset = News.objects.all().order_by('-year')
    serializer_class = NewsSerializer
    filterset_fields = ['subgroup__slug', 'year']


class ProjectApi(generics.ListAPIView):
    queryset = Project.objects.all().order_by('-end_date')
    serializer_class = ProjectSerializer
    filterset_fields = ['subgroup__slug', 'start_date', 'end_date']


class SubgroupApi(generics.ListAPIView):
    queryset = Subgroup.objects.all()
    serializer_class = SubgroupSerializer
    filterset_fields = ['slug', 'code']
