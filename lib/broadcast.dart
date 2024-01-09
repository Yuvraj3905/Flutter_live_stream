// import 'package:googleapis/youtube/v3.dart'
//     show LiveBroadcast, LiveBroadcastStatus, LiveBroadcastSnippet, YouTubeApi;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:flutter/material.dart';

// Future<void> createLiveBroadcast() async {
//   // Set up authentication
//   const apiKey = 'AIzaSyAGjmTgKM69DH3NWfQe38AD7A2DYZ-o5kM';
//   final client = await clientViaApiKey(apiKey);

//   final youtube = YouTubeApi(client);

//   // Create live broadcast snippet
//   final broadcastSnippet = LiveBroadcastSnippet()
//     ..title = 'My Broadcast' 
//     ..description =
//         'Description of the broadcast'; 

//   final broadcastStatus = LiveBroadcastStatus()
//   ..privacyStatus = 'public';

//   final liveBroadcast = LiveBroadcast();
//   liveBroadcast.snippet =broadcastSnippet; // Use the 'snippet' property to set the broadcast snippet
//   liveBroadcast.status = broadcastStatus;
//   liveBroadcast.kind = 'youtube#liveBroadcast';

//   try {
//     final liveBroadcastResponse = await youtube.liveBroadcasts.insert(
//       liveBroadcast,
//       'snippet,status',
//     );

//     print('Broadcast created: ${liveBroadcastResponse.id}');
//   } catch (e) {
//     print('Error creating broadcast: $e');
//   }

//   client.close();
// }
// // Call the function to create a broadcast
// // createLiveBroadcast();
