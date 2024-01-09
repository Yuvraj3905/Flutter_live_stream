import 'package:livekit_client/livekit_client.dart';

const roomUrl =
    'wss://livevideo-8qkjkzuu.livekit.cloud'; // Replace with your room URL
const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDQ3OTQzMzksImlzcyI6IkFQSVFoRk5oRm54UGF5diIsIm5iZiI6MTcwNDc4NTMzOSwic3ViIjoiaGVsbCIsInZpZGVvIjp7ImNhblB1Ymxpc2giOnRydWUsImNhblB1Ymxpc2hEYXRhIjp0cnVlLCJjYW5TdWJzY3JpYmUiOnRydWUsInJvb20iOiJUaGVPbmUxIiwicm9vbUpvaW4iOnRydWV9fQ.i3JVhCTWYi7glFF3aQrtmK9M-82QLx4_uuBcekQeDxs';

class LiveKitService {
  // LiveKitClient? client;
  Room? room;

  Future<void> initializeLiveKit() async {
    // _client = LiveKitClient();
    try {
      // final roomUrl = 'wss://livevideo-8qkjkzuu.livekit.cloud'; // Replace with your room URL
      // final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDQ2MTMzMzYsImlzcyI6IkFQSVFoRk5oRm54UGF5diIsIm5iZiI6MTcwNDYxMjQzNiwic3ViIjoieXV2cmFqc2siLCJ2aWRlbyI6eyJjYW5QdWJsaXNoIjp0cnVlLCJjYW5QdWJsaXNoRGF0YSI6dHJ1ZSwiY2FuU3Vic2NyaWJlIjp0cnVlLCJyb29tIjoiVGhlT25lIiwicm9vbUpvaW4iOnRydWV9fQ.3i_xyKWM4AUeqBkBxXi6wxPnNzbT02Yhwz8R6wFAZ4c'; // Replace with your token

      // final options = ConnectOptions(
      //   token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDQ2MTMzMzYsImlzcyI6IkFQSVFoRk5oRm54UGF5diIsIm5iZiI6MTcwNDYxMjQzNiwic3ViIjoieXV2cmFqc2siLCJ2aWRlbyI6eyJjYW5QdWJsaXNoIjp0cnVlLCJjYW5QdWJsaXNoRGF0YSI6dHJ1ZSwiY2FuU3Vic2NyaWJlIjp0cnVlLCJyb29tIjoiVGhlT25lIiwicm9vbUpvaW4iOnRydWV9fQ.3i_xyKWM4AUeqBkBxXi6wxPnNzbT02Yhwz8R6wFAZ4c',
      //   url: 'wss://livevideo-8qkjkzuu.livekit.cloud',
      // );

      final room = await LiveKitClient.connect(roomUrl, token);
      if (room != null) {
        // Initialize listeners, handle room events, etc.
        print('Connected to room: ${room!.name}');
      } else {
        print('Failed to join the room');
      }
    } catch (error) {
      print('Error connecting to room: $error');
      // Handle connection errors
    }
  }
 

 
}
