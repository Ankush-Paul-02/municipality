import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AllUsersList extends StatefulWidget {
  const AllUsersList({Key? key}) : super(key: key);

  @override
  State<AllUsersList> createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
  final List<Map<String, dynamic>> users = [
    {'name': 'User 1', 'image': 'user1.jpg'},
    {'name': 'User 2', 'image': 'user2.jpg'},
  ];

  Future<void> _showDeleteConfirmationDialog(String userName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Are you sure you want to delete $userName'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showInformationDialog(BuildContext context, String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person, size: 50),
              5.heightBox,
              Text('Name: $username'),
              const Text('Email: email@gmail.com'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'user ${index + 1}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: const Text(
              'Additional Info',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.info, color: Colors.blue),
                  onPressed: () =>
                      _showInformationDialog(context, 'user ${index + 1}'),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () =>
                      _showDeleteConfirmationDialog('user ${index + 1}'),
                ),
              ],
            ),
          );
        },
      ),      
    );
  }
}
