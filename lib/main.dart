import 'package:contactlist/provider.dart';
import 'package:contactlist/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:contactlist/screens/contact_detail_screen.dart';
import 'package:provider/provider.dart';

// Assignment:
/// - Build a 'CreateContactScreen' where you are to create a contact by providing the following details
/// a. Name
/// b. Phone Number
/// - Use a TextField and a TextEditingController to handle the user input
/// - Your UI should have a 'Create Contact' button which will be used to create a contact.
/// - When you are done with that, When you click the 'Create Contact' Button. the button should create a new 'User' object (User class is in the User.dart file)
/// with the input provided in the TextFields. and add that user object to the ContactList (Hint; contactList.add(UserObject))

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => UpdateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Screen"),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final String fullname;
  final String phoneNumber;

  const ContactTile({
    super.key,
    required this.fullname,
    required this.phoneNumber,
  });

  String getInitials() {
    String initials = "";
    fullname.split(" ").forEach((name) {
      initials += name[0];
    });

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactDetailScreen(
              fullname: fullname,
              phoneNumber: phoneNumber,
              initials: getInitials(),
            ),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            child: Text(
              getInitials(),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          title: Text(
            fullname,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(phoneNumber),
        ),
      ),
    );
  }
}
