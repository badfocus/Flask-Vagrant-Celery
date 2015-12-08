import os
basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'SOMETHING'

    SQLALCHEMY_COMMIT_ON_TEARDOWN = True

    CELERY_BROKER_URL = os.environ.get('RABBITMQ_BIGWIG_TX_URL') or \
        'amqp://guest@localhost//'
    UPLOAD_FOLDER = '/tmp/'

    @staticmethod
    def init_app(app):
        pass


class DevelopmentConfig(Config):
    DEBUG = True

    SQLALCHEMY_DATABASE_URI = os.environ.get('DEV_DATABASE_URL') or \
        'postgresql://master:m4st3r@localhost/api'


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or \
        'drive://user:password@domain/db'

config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,

    'default': DevelopmentConfig
}
