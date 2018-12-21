"""
Docstring
"""
from flask import Flask, request

APP = Flask(__name__)


@APP.route("/")
def hello():
    """
    Docstring
    """
    client_ip = request.environ.get('HTTP_X_REAL_IP', request.remote_addr)

    return f'<h3>Hello!</h3> <br/><b>client ip: </b>{client_ip}<br/>'


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=80)
