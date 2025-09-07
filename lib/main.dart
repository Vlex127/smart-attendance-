
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

// Import the onboarding screen (ensure this file exists in your project)
import 'onboarding_screen.dart';
// Placeholder for signup and login screens
import 'signup_screen.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Appwrite
  Client client = Client()
      .setEndpoint('https://nyc.cloud.appwrite.io/v1') // Replace with your Appwrite endpoint (e.g., 'https://cloud.appwrite.io/v1')
      .setProject('68bd539b00040e889c77') // Replace with your Appwrite project ID
      .setSelfSigned(status: true); // Remove in production if using a valid SSL certificate

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final Client client;

  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/signup': (context) => SignupScreen(client: client),
        '/login': (context) => LoginScreen(client: client),
      },
    );
  }
}
