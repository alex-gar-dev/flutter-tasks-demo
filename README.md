# Tasks demo Flutter

## Overview

This To-Do application is structured into three main sections:

1. **Core**: This section contains all the general functionalities that are shared across the application. This includes handling HTTP requests, managing environment variables, and other utilities essential for the app's operation.

2. **Features**: This section houses all the specific modules of the application. Each module represents a distinct feature of the app, such as task management, user authentication, or notifications.

3. **UX**: This section is dedicated to the system design, which is based on the Atomic Design architecture. It includes all the UI components, design patterns, and layout structures that define the visual and interactive aspects of the application.

## Getting Started

To get started with the development or deployment of this application, please follow the steps below:

### Flutter Version

Ensure that you have Flutter version `3.22.2` installed on your system. This version is required for the app to function correctly.

### Environment Configuration

- Create a `config.json` file in the root directory of your project.
- This file will be used to manage environment variables such as API keys, base URLs, and other configurations.

Example `config.json` structure:

```json
{
  "HOST": "https://api.example.com",
  "TOKEN": "YOUR_API_KEY"
}
```

### Initializing the Application

- Open your terminal and navigate to the root directory of the application.
- Run the following commands to fetch the necessary dependencies and start the application:

  ```bash
  flutter pub get
  flutter run --dart-define-from-file="path_to_config.json"
  ```
- Replace "path_to_config.json" with the actual path to your config.json file.

### Running the App
The above command will compile and run the application using the environment variables defined in the config.json file.
Ensure that your environment variables are correctly configured to avoid any runtime issues.