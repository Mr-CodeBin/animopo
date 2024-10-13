# Webtoon Explorer App

The app's release mode apk is available here: 
#### [apk link here...](lib\apk\app-release.apk)
## Overview
Welcome to the **Webtoon Explorer App**! This Flutter web app lets users explore popular webtoons and provides features such as viewing webtoon categories, detailed information about a selected webtoon, adding webtoons to favorites, and rating them. The app is built to offer an intuitive, enjoyable experience for webtoon lovers.

### Features:
1. **Home Screen**:
   - **Description**: The home screen showcases a list of webtoon categories inspired by the website AnimeMangaToon. Each category is displayed with a title and a thumbnail image, giving users a visual overview of the categories they can explore.
   - **Implementation**: This screen is designed to be responsive and visually appealing, leveraging Flutter widgets like `ListView` and `Image.network()` for smooth navigation.
    - **Favorites Button**: The "Add to Favorites" button allows users to save their favorite webtoons. This feature is handled by local storage (using either `Hive`).

2. **Detail Screen**:
   - **Description**: Once a category is clicked, the app navigates to the detail screen. This screen presents detailed information about a selected webtoon. As an example, I’ve used the “Lore Olympus Webtoon: Jaw Dropping Seen on Media,” which includes an image, a description, and a Icon button to “Add to Favorites.”
   - **UI Elements**: The detail screen is designed with a focus on delivering a rich experience. The use of `Column` widgets, combined with `Image` and `Text` widgets, ensures that the webtoon's content is displayed clearly. 
  

3. **Favorites Screen**:
   - **Description**: The Favorites Screen allows users to view all the webtoons they've marked as favorites. The data is stored persistently using Flutter’s `Hive` package, meaning users can access their favorites even after closing the app.
   - **Persistent Storage**: I've chosen to implement persistent storage with `Hive` to ensure the favorites are saved locally. This ensures that user data is kept across app restarts.

4. **Rating Feature**:
   - **Description**: Users can rate their favorite webtoons on a scale of 1.0 to 5.0 stars. This rating system updates dynamically, and the average rating is displayed on the web view screen.
   - **Implementation**: For the rating feature, I’ve used a rating widget that allows users to provide feedback on their favorite webtoons. The average rating is calculated and updated in real time on the detail screen. This enhances user interaction and allows for dynamic updates on the webtoon's popularity.

## Getting Started

### Prerequisites:
To run the Webtoon Explorer App, ensure that you have the following set up:
- Flutter SDK installed.
- An IDE (such as Visual Studio Code or Android Studio).
- Android/iOS emulator or a physical device.

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/animopo.git
    cd animopo
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the app:
    ```sh
    flutter run
    ```

### Project Structure

- `lib/`
  - `main.dart`
  - `screens/`
    - `home_page.dart`: Home screen of the application.
    - `favorite_page.dart`: Screen displaying favorite articles.
    - `detail_page.dart`: Screen displaying article details.
  - `models/`
    - `article.dart`: Model for articles.
  - `services/`
    - `storage_service.dart`: Service for handling storage operations.
  - `widgets/`
    - `card_widget.dart`: Widget for displaying articles in a card format.
- `assets/`

## Packages Used

This project uses the following packages:


- `webview_flutter`: For displaying web content.
- `http`: For making HTTP requests.
- `hive`: Lightweight and fast key-value database.

## Fonts Used

The project uses the following fonts, which are included in the assets:

- **Roboto**:
  - `Roboto-Regular.ttf`
  - `Roboto-Bold.ttf` (weight: 700)

- **Ubuntu**:
  - `Ubuntu-Regular.ttf`
  - `Ubuntu-Bold.ttf` (weight: 700)

These fonts are added to the project and can be used throughout the app.


### Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)

- [WebView in Flutter](https://codelabs.developers.google.com/codelabs/flutter-webview#0)
