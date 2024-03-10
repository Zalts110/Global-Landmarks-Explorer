from flask import Flask, jsonify, request
from flasgger import Swagger
from famous_sites_data import famous_sites
import sqlite3

app = Flask(__name__)
swagger = Swagger(app)

def add_famous_site(country, site_name, built_in, image_url, description):
    connection = get_db_connection()
    connection.execute('INSERT INTO famous_sites (country, site_name, built_in, image_url, description) VALUES (?, ?, ?, ?, ?)',
                       (country, site_name, built_in, image_url, description))
    connection.commit()
    connection.close()

def get_famous_sites_by_country(country):
    connection = get_db_connection()
    sites = connection.execute('SELECT * FROM famous_sites WHERE country = ?', (country,)).fetchall()
    connection.close()
    return sites

def get_db_connection():
    connection = sqlite3.connect('famous_sites.db')
    connection.row_factory = sqlite3.Row
    return connection

def insert_famous_sites_data():
    for country, sites in famous_sites.items():
        for site_name, details in sites.items():
            add_famous_site(country, site_name, details["built_in"], details["image_url"], details["description"])

def get_all_famous_sites():
    connection = get_db_connection()
    sites = connection.execute('SELECT * FROM famous_sites').fetchall()
    connection.close()
    return sites
  
def get_all_countries():
  connection = get_db_connection()
  # Select DISTINCT countries from the table to avoid duplicate entries
  countries = connection.execute('SELECT DISTINCT country FROM famous_sites').fetchall()
  connection.close()
  # Extract the country names from the query result
  country_list = [country['country'] for country in countries]
  return country_list


def create_table():
    connection = get_db_connection()
    connection.execute('''CREATE TABLE IF NOT EXISTS famous_sites(
                       country TEXT NOT NULL,
                       site_name TEXT NOT NULL,
                       built_in TEXT,
                       image_url TEXT NOT NULL,
                       description TEXT NOT NULL)''')
    connection.commit()
    connection.close()

@app.route('/<country>', methods=["GET"])
def get_sites(country):
    print(f"Fetching sites for country: {country}")
    sites = get_famous_sites_by_country(country)
    sites_json = [dict(site) for site in sites]  # Convert Row objects to dictionaries
    print(f"Found sites: {sites_json}")
    return jsonify(sites_json)

@app.route('/countries', methods=["GET"])
def countries():
    try:
        all_countries = get_all_countries()
        return jsonify(all_countries)
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/add', methods=["POST"])
def add_site_to_db():
    """
    Endpoint to add a famous site to the database.
    ---
    parameters:
      - name: country
        in: formData
        type: string
        required: true
        description: The name of the country.
      - name: site_name
        in: formData
        type: string
        required: true
        description: The name of the famous site.
      - name: built_in
        in: formData
        type: string
        description: The year the site was built.
      - name: image_url
        in: formData
        type: string
        required: true
        description: The URL of the site's image.
      - name: description
        in: formData
        type: string
        required: true
        description: The description of the famous site.
    responses:
      200:
        description: Famous site added successfully.
    """
    country = request.form['country']
    site_name = request.form['site_name']
    built_in = request.form['built_in']
    image_url = request.form['image_url']
    description = request.form['description']
    add_famous_site(country, site_name, built_in, image_url, description)
    return "Famous site added successfully."

if __name__ == '__main__':
    create_table()
    if not get_all_famous_sites():
        insert_famous_sites_data()
    app.run(debug= True,host='127.0.0.1', port= 8088)
