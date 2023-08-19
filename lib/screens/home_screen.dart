import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sashimi_mvp/screens/signin_screen.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Logout"),
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signOut();
            _logger.d("User Signed Out");
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          } catch (error) {
            _logger.e("Sign out Error: ${error.toString()}");
            // Handle the error here (e.g., show an error message to the user)
          }
        },
      ),
    );
  }
}

