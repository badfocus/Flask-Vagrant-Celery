from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

from config import config

from celery import Celery
from config import Config

db = SQLAlchemy()

celery = Celery(__name__, broker=Config.CELERY_BROKER_URL)


def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    db.init_app(app)

    celery.conf.update(app.config)

    from .v1 import v1 as v1_blueprint
    app.register_blueprint(v1_blueprint, url_prefix='/v1')

    return app
