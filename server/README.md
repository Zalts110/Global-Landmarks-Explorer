
# Famous Sites API

The Famous Sites API is a Flask-based application that allows users to explore, add, and retrieve information about famous sites from around the world. Each site is associated with a country and contains details such as the site name, the year it was built, an image URL, and a description. This API utilizes SQLite as its database to store and manage the site data.

## Features

- Retrieve all famous sites or filter them by country.
- Add new famous sites to the database.
- Get a list of countries that have famous sites listed in the database.

## Installation

To run the Famous Sites API, you will need Python installed on your machine. Follow these steps to set up the environment:

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install the required dependencies by running:

```bash
pip install -r requirements.txt
```

Note: If you encounter any issues with `sqlite3`, please ensure it is correctly installed and configured for your operating system.

## Running the Application

1. Before running the application for the first time, ensure the SQLite database is initialized and populated with initial data. The application's code automatically takes care of creating the database and populating it when run for the first time.
2. To start the application, run the following command in the terminal:

```bash
python app.py
```

3. Once the application is running, navigate to `http://127.0.0.1:8088/apidocs` in your web browser to see the Swagger UI documentation of the API.

## Endpoints

- `GET /<country>`: Fetches all famous sites associated with the specified country.
- `GET /countries`: Returns a list of all countries that have at least one famous site listed in the database.
- `POST /add`: Adds a new famous site to the database. This endpoint requires form data including `country`, `site_name`, `built_in` (optional), `image_url`, and `description`.

## Contributing

Contributions to the Famous Sites API are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License

This project is open-sourced under the [MIT License](LICENSE.md).

---

This README provides a comprehensive guide to help users understand, install, and interact with the Famous Sites API. Adjust the content as necessary to fit the specific configurations or additional features of your application.
