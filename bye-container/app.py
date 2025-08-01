from flask import Flask
app = Flask(__name__)

@app.route('/')
def bye():
    return 'Bye from bye-container!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
