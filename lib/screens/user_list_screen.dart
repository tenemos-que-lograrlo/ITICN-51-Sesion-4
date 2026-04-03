import 'package:flutter/material.dart';
import '../models/user.dart';
import 'user_detail_screen.dart';
import '../services/api_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = ApiService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Contactos")),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar contactos: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay contactos disponibles"));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    leading: Hero(
                      tag: user.avatar,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.email),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailScreen(user: user),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
