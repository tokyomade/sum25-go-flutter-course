import 'package:flutter/material.dart';
import 'package:lab02_chat/user_service.dart';

// UserProfile displays and updates user info
class UserProfile extends StatefulWidget {
  final UserService
      userService; // Accepts a user service for fetching user info
  const UserProfile({Key? key, required this.userService}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, String>? _username;
  bool _isLoading = true;
  String? _error;


  @override
  void initState() {
    super.initState();
    widget.userService.fetchUser().then((data) {
      setState(() {
        _username = data;
        _isLoading = false;
      });
    }).catchError((err) {
      setState(() {
        _error = 'error: $err';
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Build user profile UI with loading, error, and user info
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: _isLoading
        ? const CircularProgressIndicator()
        : _error != null
            ? Text(_error!, style: const TextStyle(color: Colors.red))
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Name: ${_username?['name'] ?? ''}'),
                  Text('Email: ${_username?['email'] ?? ''}'),
                ],
              ),
      ),
    );
  }
}
