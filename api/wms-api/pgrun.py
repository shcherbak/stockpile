from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

application = Flask(__name__)
application.config.from_object('config')
db = SQLAlchemy(application)


class Brand(db.Model):
    id = db.Column(db.Integer, primary_key=True)

@application.route('/')
def documentation():
    all = Brand.query.all()
    db.session.remove() #don't need this since it's called on teardown
    return str(len(all))

if __name__ == '__main__':
    application.run(host='0.0.0.0', debug=True)