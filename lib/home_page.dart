import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
               ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Your logged out'),backgroundColor: Colors.green,),
        );
              Navigator.pushReplacementNamed(context, '/');
           
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${user?.email ?? 'Guest'}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            const Text("You are now logged in!"),
          ],
        ),
      ),
    );
  }
}