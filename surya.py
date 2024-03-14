from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/validate', methods=['POST'])
def validate():
    name = request.form['name']
    email = request.form['email']
    age = request.form['age']
    dob = request.form['dob']

    # Validate email format
    if '@' not in email or '.' not in email:
        return jsonify({'error': 'Invalid email format'})

    # Validate age
    try:
        age = int(age)
        if age <= 0:
            raise ValueError
    except ValueError:
        return jsonify({'error': 'Age must be a positive integer'})

    return jsonify({'success': 'Form submitted successfully'})

if __name__ == '__main__':
    app.run(debug=True)

