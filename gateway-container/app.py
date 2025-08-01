from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Gateway API - use /hello, /bye, /study, /thanks"})


@app.route('/hello')
def hello():
    r = requests.get('http://hello-container:3000/')
    return jsonify({"hello": r.text})


@app.route('/bye')
def bye():
    r = requests.get('http://bye-container:3000/')
    return jsonify({"bye": r.text})


@app.route('/study')
def study():
    try:
        r = requests.get('http://study-container:3000/', timeout=5)
        r.raise_for_status()
        return jsonify({"study": r.text})
    except requests.exceptions.RequestException as e:
        app.logger.error(f"Study service error: {str(e)}")
        return jsonify({"error": "Service temporarily unavailable"}), 500


@app.route('/thanks')
def thanks():
    try:
        r = requests.get('http://thanks-container:3000/', timeout=5)
        r.raise_for_status()
        return jsonify({"thanks": r.text})
    except requests.exceptions.RequestException as e:
        app.logger.error(f"Thanks service error: {str(e)}")
        return jsonify({"error": "Service temporarily unavailable"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
