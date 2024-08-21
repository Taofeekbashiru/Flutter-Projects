import 'package:flutter/material.dart';
import 'package:contactlist/contact_detail_screen.dart';
import 'package:contactlist/contact_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Create state here
  String name = "Contacts";
  int index = 0;
  bool value = false;
  List<User> contactList = List.generate(10, (index) {
    return User(
      fullname: usernames[index],
      phoneNumber: '123-456-78${index % 10}', // Example phone number
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 70,
          title: ListTile(
            title: Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            subtitle: Text(
              "total: ${contactList.length}",
            ),
          )),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return ContactTile(
              fullname: contactList[index].fullname,
              phoneNumber: contactList[index].phoneNumber,
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "Create Contact",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactDetailScreen(
                fullname: fullname,
                phoneNumber: phoneNumber,
                initials: getInitials())));
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

class User {
  String fullname;
  String phoneNumber;

  User({
    required this.fullname,
    required this.phoneNumber,
  });
}
