# Live Video Streaming App 

This Flutter application enables live video streaming using LiveKit and provides functionality to broadcast the live stream to a streaming platform.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.

2. **Setup Flutter Project**: Ensure you have Flutter installed. Run `flutter pub get` to fetch the required dependencies.

3. **LiveKit Configuration**:
    - Replace placeholders in `livekit_service.dart` with your actual LiveKit room URL and token.
    - Ensure proper initialization of LiveKit and camera services in `livekit_service.dart` and `camera_service.dart`.


## Features

- Live video streaming using LiveKit.
- Basic controls for starting, stopping, and pausing the video stream.
- Switching between multiple cameras if available.
- Integration with a streaming platform for broadcasting.

## Usage

1. **Starting Live Video Stream**:
    - Open the application.
    - Grant necessary permissions (camera, microphone).
    - Click the "Play" button to start the live video stream.

2. **Stopping Live Video Stream**:
    - Click the "Stop" button to end the live video stream.

3. **Pausing and Resuming Stream**:
    - Click the "Pause" button to freeze the last frame.
    - Click "Play" again to resume the live stream.

4. **Broadcasting**:
    - Configure broadcasting settings for the desired streaming platform.
    - Use the respective functionality provided by the platform to start and stop broadcasting.

## Contributing

Contributions to improve this application are welcome! Feel free to fork the repository, make changes, and submit a pull request.

