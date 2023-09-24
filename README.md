# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Description
- weather forecast app that retrieves weather data from an API and displays it to the 
user
- Using the OpenWeatherMap API (https://openweathermap.org/) to fetch weather data.
- Use Clean architecture
- Cubit State Management:
  - Implement a Cubit to manage the app's state.
  - Create separate states for loading, success, and error scenarios.
  - Handle API request loading state, update the UI accordingly.
  - Notify the UI of successful API responses and update the displayed weather             information. -
  - Handle error scenarios, display appropriate error messages to the user.
-  Error Handling and Connectivity using Dartz package (Either<L,R>)
-  Dependency Injection using GetIt package
- Implement the following features:
    - Fetch current weather conditions (temperature, humidity, wind speed, etc.) as well     as a 5-day forecast.
    - Allow the user to search to specific city
    - Splash Screen which has animations to enhance the user experience.
  
- Implement proper loading indicators or skeleton screens to indicate the loading
  state while fetching or updating data
  
- Use proper form validation to ensure valid data entry when creating or updating a
  user.
  
- Use appropriate UI components and layouts to create an intuitive and user-friendly
  interface
  
