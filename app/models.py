from . import db

from flask import current_app

from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash

from itsdangerous import (TimedJSONWebSignatureSerializer as
                          Serializer, BadSignature, SignatureExpired)

from datetime import date


'''class User(db.Model):
    """Main user model."""

    __tablename__ = 'users'''
