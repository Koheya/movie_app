# 🎬 Movie App – Flutter Clean Architecture

A feature-rich **Movie App** built with **Flutter** following the principles of **Clean Architecture**, ensuring maintainability, scalability, and testability.

## ✨ Features
✅ Browse trending, popular, and top-rated movies  
✅ View detailed movie information (cast, trailer, ratings, etc.)  

## 🏛️ Tech Stack
- **Flutter** (Dart) for UI  
- **Clean Architecture** (Separation of Concerns)  
- **Bloc (flutter_bloc)** for state management  
- **Dio** for API requests  
- **GetIt** for dependency injection  
- **Freezed & JsonSerializable** for data modeling  

## 📡 API
This app fetches movie data from **[TMDb API](https://www.themoviedb.org/)**.  
To use this API, get your free API key from TMDb and add it to the project.

## 🚀 Setup & Installation
### Prerequisites
- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- A valid **TMDb API Key**

### Steps to Run
1. Clone this repo:
   ```sh
   git clone https://github.com/your-username/movie-app-clean-architecture.git
   cd movie-app-clean-architecture
   ```
2. Get dependencies:
   ```sh
   flutter pub get
   ```
3. Add your TMDb API key in `lib/core/constants/api_constants.dart`:
   ```dart
   const String apiKey = "YOUR_TMDB_API_KEY";
   ```
4. Run the app:
   ```sh
   flutter run
   ```  

## 📌 Project Structure
The app follows **Clean Architecture**, dividing the project into layers:
- **Core Layer:** Shared utilities and constants
- **Feature Modules:** Movies and TVs, each containing Data, Domain, and Presentation layers

```
lib/
│── core/                 # Constants, utilities, API configs
│── features/
│   ├── movie/            # Movie-related feature module
│   │   ├── data/         # Data sources, models, repositories
│   │   ├── domain/       # Entities, repositories, use cases
│   │   ├── presentation/ # UI, widgets, Bloc state management
│   ├── tvs/              # TV-related feature module
│   │   ├── data/         # Data sources, models, repositories
│   │   ├── domain/       # Entities, repositories, use cases
│   │   ├── presentation/ # UI, widgets, Bloc state management
│── main.dart             # App entry point
```

## 📌 Contributing
Contributions are welcome! Feel free to fork, submit issues, or open pull requests.

---

🚀 Happy Coding!
