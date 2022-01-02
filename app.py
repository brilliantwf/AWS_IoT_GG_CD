from flask import Flask

app = Flask(__name__)

counter = 0

@app.route('/')
def hello():
    global counter
    counter += 1
    return '<h1>Hello Felix!,This is a Demo App for GG CI V1. I have been seen {} times.\n</h1>'.format(counter)
