# inline_video_flutter
It is a flutter project which can be used to change video according to emotions


There are two ways to do the project
- Creat a long video and skip to different time frame or
- Having list of video to switch to differnt wideo (I have used this option to change the video)

The project start with lib/main.dart

- I have Used RxDart and mvvm pattern for development
- In lib it contains
    - components: This has all the widget that required in the project, In component folder it has folder according to screen. The screen folder has bunch of component with a lib
- core: Core contains all the files and folder related to main.dart
    - routes folder contain route of the path
    - theme contains theme
    - app_init.dart contains all the function that should run before app start
- feature: This folder contain screens of app, currently there are only two file splash screen and video screen
    - splash_screen contains code of splash screen
    - video_screen contains code of video
- Services: Services is the file where where all the logic and data manipulation is there
    - bloc contains the logic of app, In block there are three file
        - splash_bloc contains logic of the splash screen, like dely time and navigation
        - system_block contains system configuration of app, methods to disable or enable action bar, hide keyboard
        - video_file_block contains fetching of list for grid, video, play single video etc
- data: I used to mimic the api integration which has list of data that is fetched by repo
- repo: video_file_repo: It is used as a medium to fetch file from the data and send it back to bloc
- main.dart: I keep this file simple by moving all the logic to core
- r.dart: Used for assets managment

