from django.templatetags.static import static
from django.urls import reverse
from django.conf import settings
from webpack_loader.templatetags.webpack_loader import render_bundle
from jinja2 import Environment
from datetime import datetime


def environment(**options):
    env = Environment(**options)
    env.globals.update({
        'now': datetime.now(),
        'render_bundle': render_bundle,
        'settings': settings,
        'static': static,
        'url': reverse,
        'zip': zip,
    })
    return env
