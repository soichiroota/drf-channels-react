from .base import (
    AUTH_PASSWORD_VALIDATORS,
    BASE_DIR,
    DATABASES,
    DEFAULT_AUTO_FIELD,
    INSTALLED_APPS,
    LANGUAGE_CODE,
    MIDDLEWARE,
    ROOT_URLCONF,
    SECRET_KEY,
    TEMPLATES,
    TIME_ZONE,
    USE_I18N,
    USE_L10N,
    USE_TZ,
    WSGI_APPLICATION,
    ASGI_APPLICATION,
    CHANNEL_LAYERS
)

__all__ = [
    "BASE_DIR",
    "SECRET_KEY",
    "MIDDLEWARE",
    "ROOT_URLCONF",
    "TEMPLATES",
    "WSGI_APPLICATION",
    "DATABASES",
    "AUTH_PASSWORD_VALIDATORS",
    "LANGUAGE_CODE",
    "TIME_ZONE",
    "USE_I18N",
    "USE_L10N",
    "USE_TZ",
    "DEFAULT_AUTO_FIELD",
    "ASGI_APPLICATION",
    "CHANNEL_LAYERS"
]


DEBUG = True

ALLOWED_HOSTS = ["*"]


INSTALLED_APPS += ["django_extensions", "silk"]

DEFAULTS = {
    "DEFAULT_RENDERER_CLASSES": [
        "rest_framework.renderers.JSONRenderer",
        "rest_framework.renderers.BrowsableAPIRenderer",
    ]
}

MIDDLEWARE += ("silk.middleware.SilkyMiddleware",)
