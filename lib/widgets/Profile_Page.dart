import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "Adnan Said"; // Replace with actual user data
  final String userEmail = "adnan.so@gmail.com";
  final String profileImageUrl = "assets/general/OIP.jpg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture and name
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profileImageUrl),
              backgroundColor: Colors.grey[200],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Text(
              userEmail,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(height: 40),
          // Edit Profile button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle profile edit functionality
              },
              child: Text("Edit Profile"),
            ),
          ),
          SizedBox(height: 20),
          // Log Out button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle log out functionality
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }
}
