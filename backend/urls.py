from django.urls import path
from . import views


urlpatterns = [
    path('profile', views.profile),
    path('publication', views.PublicationApi.as_view()),
    path('award', views.AwardApi.as_view()),
]
