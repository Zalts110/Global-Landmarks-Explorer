# Global Landmarks Explorer

## Screenshots

<div>
  <img src="https://github.com/BenMishael/Global-Landmarks-Explorer/blob/main/screenshots/Screenshot%20from%202024-03-10%2019-09-01.png" alt="Screenshot 1" title="Screenshot 1" height="300"width="200"/>
  <img src="https://github.com/BenMishael/Global-Landmarks-Explorer/blob/main/screenshots/Screenshot%20from%202024-03-10%2019-09-11.png" alt="Screenshot 2" title="Screenshot 2" height="300"width="200"/>
  <img src="https://github.com/BenMishael/Global-Landmarks-Explorer/blob/main/screenshots/Screenshot%20from%202024-03-10%2019-09-20.png" alt="Screenshot 3" title="Screenshot 3" height="300"width="200"/>
  <img src="https://github.com/BenMishael/Global-Landmarks-Explorer/blob/main/screenshots/Screenshot%20from%202024-03-10%2019-09-48.png" alt="Screenshot 4" title="Screenshot 4" height="300"width="200"/>
</div>

## Introduction
Global Landmarks Explorer is an integrated project aimed at providing users with an immersive experience in exploring the world's most iconic landmarks. This project encompasses a Python-powered API, a Flutter-based mobile application, and a reusable API library, all designed to work seamlessly to offer detailed information, images, and user interactions for landmarks around the globe.

## Project Components

### 1. Python API
The backbone of Global Landmarks Explorer, providing comprehensive data about landmarks, including history, cultural significance, visiting information, and images.

### 2. Flutter App
A cross-platform mobile application that delivers a user-friendly interface for exploring landmarks, planning visits, and sharing experiences with a community of travelers.

### 3. API Library
A reusable library designed to facilitate easy access to the Global Landmarks API, enabling developers to integrate landmark data into their own applications or services.

## Getting Started

### Prerequisites
- Git
- Python 3.x
- Flutter (latest version)
- An IDE or editor of your choice (e.g., VSCode, Android Studio)

### Installation & Setup

#### Python API
```bash
# Clone the repository
git clone https://github.com/BenMishael/Global-Landmarks-Explorer.git

# Navigate to the API directory
cd Global-Landmarks-Explorer/server

# Install dependencies
pip install -r requirements.txt

# Start the API server
python app.py
```

#### Flutter App
```bash
# Ensure you've installed Flutter and set up your environment
flutter doctor

# Navigate to the app directory
cd Global-Landmarks-Explorer/client

# Get Flutter dependencies
flutter pub get

# Run the app (Ensure an emulator or device is connected)
flutter run
```

#### API Library
Please refer to the specific README within the `api_library` directory for instructions on integrating the library into your own projects.

## Usage

- **Python API:** Accessible at `http://localhost:8088`, you can make GET requests to endpoints documented in the API's README.
- **Flutter App:** Once the app is running on your device or emulator, you can start exploring landmarks by searching, browsing categories, or selecting from a map view.
- **API Library:** Use this library in your projects to query the Global Landmarks API with ease, fetching data for display or analysis.

## Contributing
We welcome contributions to the Global Landmarks Explorer project. Whether you're looking to add new features, improve the UI, or expand the database of landmarks, your input is valuable. Please see our CONTRIBUTING.md file for more details on how to get involved.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Contact
- **Project Lead:** Ben Mishael, Yuval Zaltsman
- **Email:** [ben.mishael@gmail.com](mailto:ben.mishael@gmail.com)
- **GitHub:** [https://github.com/BenMishael/Global-Landmarks-Explorer](https://github.com/BenMishael/Global-Landmarks-Explorer)

Thank you for your interest in Global Landmarks Explorer. We hope this project inspires you to explore and appreciate the rich cultural heritage our world has to offer!
```
