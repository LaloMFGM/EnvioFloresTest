
import 'package:flutter/material.dart';

class UsersView extends StatelessWidget{
  static const name = 'users_view';

  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users View'),
      ),
      body: const Center(
        child: Text('This is the Users View'),
      ),
    );
  }
}