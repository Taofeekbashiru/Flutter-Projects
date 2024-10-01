import 'package:contactlist/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contactlist/create_new_contact.dart';
import 'package:contactlist/contact_detail_screen.dart';
import 'package:contactlist/user.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
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

  @override
  void initState() {
    super.initState();
    Provider.of<UpdateProvider>(context, listen: false).updateContactList();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UpdateProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 70,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
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
          )),
      body: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            return ContactTile(
              fullname: provider.contactList[index].fullname,
              phoneNumber: provider.contactList[index].phoneNumber,
            );
          }),
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
