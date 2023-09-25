# weather_app

A Weather forecast app that retrieves weather data from an API and displays it to the user which is made using clean architecture and bloc state management.


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
  
