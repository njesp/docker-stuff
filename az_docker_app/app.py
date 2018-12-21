"""
Docstring
"""
import socket
from flask import Flask

APP = Flask(__name__)


@APP.route("/")
def hello():
    """
    Docstring
    """

    return f'<h3>Hello!</h3><b>Hostname:</b>{socket.gethostname()}<br/>'


if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=80)
