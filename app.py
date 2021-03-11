from flask import Flask, render_template
from moist import getWet
app = Flask(__name__)


@app.route('/')
def hello():
    return render_template("index.html")

@app.route('/api')
def world():
    return str(getWet())

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')