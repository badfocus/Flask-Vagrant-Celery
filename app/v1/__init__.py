from flask import Blueprint

v1 = Blueprint('v1', __name__,
               static_folder='static',
               template_folder='templates')

from . import views
