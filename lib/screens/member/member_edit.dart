import 'package:flutter/material.dart';
import 'package:iith_app/screens/member/member_add.dart';

class MemberEditScreen extends StatefulWidget {
  @override
  _MemberEditScreenState createState() => _MemberEditScreenState();
}

class _MemberEditScreenState extends State<MemberEditScreen> {
  List<Map<String, String>> members = [
    {'name': 'John Doe', 'email': 'john.doe@example.com'},
    {'name': 'Jane Smith', 'email': 'jane.smith@example.com'},
    {'name': 'Michael Brown', 'email': 'michael.brown@example.com'},
    {'name': 'Emily Davis', 'email': 'emily.davis@example.com'},
    {'name': 'David Wilson', 'email': 'david.wilson@example.com'},
    {'name': 'Sophia Miller', 'email': 'sophia.miller@example.com'},
    {'name': 'Daniel Anderson', 'email': 'daniel.anderson@example.com'},
    {'name': 'Olivia Lee', 'email': 'olivia.lee@example.com'},
    {'name': 'James Martin', 'email': 'james.martin@example.com'},
    {'name': 'Emma Thompson', 'email': 'emma.thompson@example.com'},
  ];
  

  void _addMember(Map<String, String> newMember) {
    setState(() {
      members.add(newMember);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Members'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(members[index]['name']!),
                    subtitle: Text(members[index]['email']!),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditOptions(context, index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final newMember = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMemberScreen(),
                  ),
                );

                if (newMember != null) {
                  _addMember(newMember);
                }
              },
              child: Text('Add Member'),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Member'),
                onTap: () {
                  // Edit functionality can be added here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Remove Member'),
                onTap: () {
                  setState(() {
                    members.removeAt(index);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MemberEditScreen(),
    ),
  );
}