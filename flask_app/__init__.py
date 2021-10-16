from flask import Flask, session
import os
app = Flask(__name__)
app.secret_key = "CanadaMooseMoose"
app.config['UPLOAD_FOLDER'] = "static/images/"
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024