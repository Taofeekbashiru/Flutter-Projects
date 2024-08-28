import 'package:contactlist/user.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController typeName = TextEditingController();
  final TextEditingController typePhoneNo = TextEditingController();

  get fullname => null;

  get phoneNumber => null;

  void createContact() {
    final String name = typeName.text;
    final String contactNo = typePhoneNo.text;

    if (name.isNotEmpty && contactNo.isNotEmpty) {
      final newContact = User(fullname: fullname, phoneNumber: phoneNumber);
      contactList.add(newContact);

      // to clear the text field after creating newContact
      typeName.clear();
      typePhoneNo.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text("Create newcontact"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: typeName,
              decoration: const InputDecoration(
                labelText: 'Input Name',
                labelStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: typePhoneNo,
              decoration:
                  const InputDecoration(labelText: 'Input phone Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: createContact,
                child: const Text(
                  'Add new contact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// class Contact {
//   String fullname;
//   String phoneNumber;

//   Contact({required this.fullname, required this.phoneNumber});
// }

// List<Contact> newContact = [];
