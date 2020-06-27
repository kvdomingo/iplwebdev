from django.contrib import admin
from .models import *


admin.site.register(Publication)
admin.site.register(Award)
admin.site.register(Member)
admin.site.register(News)
admin.site.register(Project)
admin.site.register(Subgroup)

admin.site.index_title = 'Admin'
admin.site.site_title = 'Instrumentation Physics Laboratory'
admin.site.site_header = 'IPL Web Admin'
