import 'package:livekit_client/livekit_client.dart';
const roomUrl = 'wss://livevideo-8qkjkzuu.livekit.cloud';
const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDUzODkzMzgsImlzcyI6IkFQSVFoRk5oRm54UGF5diIsIm5iZiI6MTcwNTM4ODQzOCwic3ViIjoiaGVsbCIsInZpZGVvIjp7ImNhblB1Ymxpc2giOnRydWUsImNhblB1Ymxpc2hEYXRhIjp0cnVlLCJjYW5TdWJzY3JpYmUiOnRydWUsInJvb20iOiJUaGVPbmUxIiwicm9vbUpvaW4iOnRydWV9fQ.ROGycZRGDz8_GT0RCYGRKZlOHYa5G3LugWWv7aOekkI';

class LiveKitService {
  Room? room;

  Future<void> initializeLiveKit() async {
    try {
      final room = await LiveKitClient.connect(roomUrl, token);
      if (room != null) {
        // Initialize listeners, handle room events, etc.
        print('Connected to room: ${room!.name}');
      } else {
        print('Failed to join the room');
      }
    } catch (error) {
      print('Error connecting to room: $error');
    }
  }
}
