import 'package:contactlist/main.dart';
import 'package:contactlist/provider.dart';
import 'package:contactlist/screens/create_new_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Create state here
  String name = "Contacts";
  int index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UpdateProvider>(context, listen: false)
          .initializeContactList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProvider>(
      builder: (BuildContext context, UpdateProvider provider, Widget? child) =>
          Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 70,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
                child: const Text("About Me"))
          ],
          title: ListTile(
            title: Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            subtitle: Text(
              "total: ${provider.contactList.length}",
            ),
          ),
        ),
        body: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            return ContactTile(
              fullname: provider.contactList[index].fullname,
              phoneNumber: provider.contactList[index].phoneNumber,
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(),
              ),
            );
          },
          label: Text(
            "Create Contact",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
