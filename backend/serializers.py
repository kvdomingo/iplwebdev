from rest_framework import serializers
from .models import *


class PublicationSerializer(serializers.ModelSerializer):
    # subgroup = SubgroupSerializer()
    class Meta:
        model = Publication
        fields = '__all__'

class AwardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Award
        fields = '__all__'

class MemberSerializer(serializers.ModelSerializer):
    # subgroup = SubgroupSerializer()
    class Meta:
        model = Member
        fields = '__all__'

class NewsSerializer(serializers.ModelSerializer):
    # subgroup = SubgroupSerializer()
    class Meta:
        model = News
        fields = '__all__'

class ProjectSerializer(serializers.ModelSerializer):
    # subgroup = SubgroupSerializer()
    class Meta:
        model = Project
        fields = '__all__'


class SubgroupSerializer(serializers.ModelSerializer):
    member_set = MemberSerializer(many=True)
    publication_set = PublicationSerializer(many=True)
    news_set = NewsSerializer(many=True)
    project_set = ProjectSerializer(many=True)
    class Meta:
        model = Subgroup
        fields = '__all__'
