from flask import Flask
import time

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello World from Sneha"  

@app.route('/compute')
def compute():
    start = time.time()
    result = fibonacci(10000)
    end = time.time()
    return f"Fibonacci(10000) computed. Time taken: {end - start:.2f} seconds."

def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
