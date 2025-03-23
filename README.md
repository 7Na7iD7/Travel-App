# Travel App ✈️

A beautifully designed Flutter application for exploring travel destinations with smooth animations, expandable descriptions, and a user-friendly interface. This app allows users to browse through various travel locations, view details like distance, temperature, and ratings, and proceed with their journey plans.

## 📸 Screenshots

| Intro Screen | Main Page |
|--------------|-----------|
| ![Intro Screen](screenshots/Screenshot%201.png) | ![Main Page](screenshots/Screenshot%202.png) |

## ✨ Features

- **Intro/Splash Screen**: A visually appealing intro screen with a background image, animated "Go" button, and a smooth transition to the main page.
- **Dynamic Destination List**: Browse through a list of travel destinations with thumbnail images and animated transitions.
- **Detailed Information**: View detailed information about each destination, including:
  - Name and location
  - Distance, temperature, and rating stats
  - Expandable description using the `expandable_text` package
  - Total price with a proceed button
- **Smooth Animations**:
  - Fade and slide transitions for the intro screen and destination details.
  - Scale animation for thumbnail selection.
- **Responsive Design**: Optimized for different screen sizes with a clean and modern UI.

## 🛠️ Getting Started

Follow these steps to set up and run the project locally.

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart**: Comes with Flutter.
- **IDE**: Use an IDE like VS Code or Android Studio with Flutter plugins installed.
- **Git**: To clone the repository.

## 📦 Dependencies
The project uses the following packages:

flutter: Core Flutter framework.
cupertino_icons: ^1.0.2: For Cupertino-style icons.
expandable_text: ^2.3.0: For collapsible description text.

## 🚀 Usage
1: Launch the app to see the intro screen with a "Go" button.
2: Tap the "Go" button to navigate to the main page.
3:Browse through the list of destinations on the right side (thumbnails).
4: Tap on a thumbnail to view detailed information about the destination.
5: Expand the description to read more about the location.
6: Check the total price and tap the arrow button to proceed (currently shows a snackbar).

## 🖼️ Assets
images are placed in the assets/images/ directory:

natuer.jpg (for the intro screen)
Guangzhou.jpg
newyork.jpg
Shanghai.jpg
southkorea.jpg
Tokyo.jpg

## 📝 Notes
The app currently uses static data defined in TravelModel.dart. You can extend it by integrating an API for dynamic data.
The "Proceed" button (arrow) currently displays a snackbar. You can implement actual booking functionality as needed.
Ensure the images are correctly placed in the assets/images/ directory and declared in pubspec.yaml.
