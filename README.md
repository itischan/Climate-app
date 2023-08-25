# Climate-app(iOS Application)


Climate App is an iOS application that provides users with current weather information based on their location or a city search. This app is built using Swift and utilizes various iOS frameworks such as UIKit, AVFoundation, and CoreLocation to provide a seamless user experience.

*Features

1.Display Current Weather: The app displays the current weather conditions, including temperature and a corresponding weather icon.
2.Location-based Weather: Users can get weather updates based on their current location using CoreLocation.
3.City Search: Users can search for weather information in different cities around the world.
Error Handling: The app handles errors gracefully and displays appropriate error messages when necessary.

*How to Use

*Location Weather:
1.When you first launch the app, it will request permission to use your location.
2.Grant the location permission, and the app will fetch and display the current weather for your location.
3.Tap the "Location" button to manually update the weather information based on your current location.

*City Search:
1.Enter the name of a city in the search text field.
2.Press the "Search" button or press Return on the keyboard.
3.he app will fetch and display the current weather information for the specified city.
4.If the city name is invalid or the search field is empty, an appropriate error message will be displayed.

*Error Handling:
1.If any errors occur during the location retrieval or weather fetching process, the app will display the error message on the console.
2.Users will be notified about errors related to location permissions or network connectivity.
Code Structure

The app's functionality is divided into different sections:

1.WeatherViewController: The main view controller that manages the UI components and user interactions.
2.WeatherManager: Responsible for fetching weather data from a weather API and handling data parsing.
3.CLLocationManagerDelegate: Handles location-related events and requests weather data based on the user's location.
4.UITextFieldDelegate: Manages text field interactions for city searches.
5.WeatherManagerDelegate: Updates the UI with weather data or displays error messages.

*Dependencies

The app relies on the following frameworks:

1.UIKit: Used for creating the app's user interface.
2.AVFoundation: Used for displaying weather icons.
3.CoreLocation: Used for accessing location services and obtaining the user's coordinates.


*Future Enhancements
1.Add multi-day forecast functionality.
2.Implement unit tests to ensure code reliability.
3.Enhance the UI with animations and additional weather information.
4.Provide user settings to customize temperature units or weather update intervals.
