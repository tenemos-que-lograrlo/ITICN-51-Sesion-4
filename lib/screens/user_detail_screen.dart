import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle del Contacto")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: user.avatar,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("Género: ${user.gender}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cake),
                    title: Text("Edad: ${user.age}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(user.email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(user.phone),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text("Dirección: ${user.street}, ${user.city}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.flag),
                    title: Text("País: ${user.country}"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Text("Usuario: ${user.username}"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
