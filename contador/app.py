import os
from redis import Redis

from flask import Flask, session, render_template
from flask_session import Session


app = Flask(__name__, template_folder="templates")
versao = 0.2

REDIS_HOST = os.environ.get("REDIS_HOST", default='localhost')
REDIS_PORT = os.environ.get("REDIS_PORT", default=6379)
SESSION_TYPE = 'redis'
SESSION_REDIS = Redis(REDIS_HOST,port=REDIS_PORT)
app.config.from_object(__name__)
Session(app)




@app.route("/")
def index():
    if 'contador' not in session:
        session['contador'] = 1
    else:
        session['contador'] = int(session['contador']) + 1
    contador = session['contador']
    return render_template('index.html',acessos=contador , versao=versao )


if __name__ == "__main__":
    app.debug = True
    app.run(host='0.0.0.0')
