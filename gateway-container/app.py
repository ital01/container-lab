from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Gateway API - use /hello, /bye, /study, /thanks"})

@app.route('/hello')
def hello():
    r = requests.get('http://hello-container:5000/')
    return jsonify({"hello": r.text})

@app.route('/bye')
def bye():
    r = requests.get('http://bye-container:5000/')
    return jsonify({"bye": r.text})

@app.route('/study')
def study():
    r = requests.get('http://study-container:5000/')
    return jsonify({"study": r.text})

@app.route('/thanks')
def thanks():
    r = requests.get('http://thanks-container:5000/')
    return jsonify({"thanks": r.text})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
