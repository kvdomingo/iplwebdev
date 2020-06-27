from django.urls import path
from . import views


urlpatterns = [
    path('profile', views.profile),
    path('subgroup', views.SubgroupApi.as_view()),
    path('publication', views.PublicationApi.as_view()),
    path('award', views.AwardApi.as_view()),
    path('member', views.MemberApi.as_view()),
    path('news', views.NewsApi.as_view()),
    path('project', views.ProjectApi.as_view()),
]
