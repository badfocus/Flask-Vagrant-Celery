import os

from . import v1
from .. import db

from flask import request
from flask import jsonify
from flask import json
from flask import g
from flask import current_app
from flask.ext.httpauth import HTTPBasicAuth

from werkzeug import secure_filename

from app import celery
#from app.models import User

http_auth = HTTPBasicAuth()


@v1.route('/')
def v1():

    return 'OK'
