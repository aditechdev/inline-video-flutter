# inline_video_flutter

**inline_video_flutter** is a Flutter project that allows you to change videos based on different emotions. It provides two approaches for video switching: using a long video and skipping to different time frames, or having a list of videos to switch between (the latter approach is used in this project).

## Project Structure

The project structure is organized as follows:

- **lib/main.dart**: The entry point of the application.
- **lib/components**: Contains all the widgets required for the project. The components are organized into folders based on the screens they belong to.
- **lib/core**: Contains core files and folders related to the main.dart file.
  - **lib/core/routes**: Contains the route configuration for different paths in the app.
  - **lib/core/theme**: Contains the theme configuration for the app.
  - **lib/core/app_init.dart**: Contains functions that need to be executed before the app starts.
- **lib/features**: Contains the screens of the app. Currently, it includes two files:
  - **lib/features/splash_screen.dart**: Contains the code for the splash screen, including delay time and navigation logic.
  - **lib/features/video_screen.dart**: Contains the code for the video screen.
- **lib/services**: Contains the services and business logic of the app.
  - **lib/services/bloc**: Contains the logic for different aspects of the app.
    - **lib/services/bloc/splash_bloc.dart**: Handles the logic for the splash screen, including delay time and navigation.
    - **lib/services/bloc/system_bloc.dart**: Manages system-level configurations, such as enabling or disabling the action bar and hiding the keyboard.
    - **lib/services/bloc/video_file_bloc.dart**: Fetches the list of files for the grid, plays single videos, and manages video-related logic.
- **lib/data**: Contains mock API integration, providing a list of data that is fetched by the repository.
- **lib/repo**: Contains the repository that acts as a medium for fetching files from the data and providing them to the bloc.
- **lib/r.dart**: Used for asset management.

## Getting Started

To get started with the **inline_video_flutter** project, follow these steps:

1. Clone the repository.
2. Open the project in your preferred Flutter development environment.
3. Run the application on your desired device or emulator.

## Dependencies

The project utilizes the following dependencies:

- **RxDart**: Provides reactive programming support for handling streams of data.
- **mvvm**: Implements the MVVM (Model-View-ViewModel) pattern for structured app development.

## Usage

The **inline_video_flutter** project allows you to create a video-based app where videos can be switched based on different emotions. It provides a responsive and user-friendly interface for seamless video playback and navigation.

Feel free to explore the code and customize it to fit your specific requirements. Happy coding!

Note: This readme file provides an overview of the project structure and its components. For detailed implementation details, please refer to the actual code files in the project.

##Media

<img src="https://github.com/aditechdev/inline-video-flutter/raw/main/assets/gif/app_record.gif" width="200">
