import 'package:contactlist/provider.dart';
import 'package:contactlist/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController typeName = TextEditingController();
  final TextEditingController typePhoneNo = TextEditingController();

  bool _obscureText = true;

  void toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  get fullname => typeName.value.text;

  get phoneNumber => typePhoneNo.value.text;

  void createContact() {
    final String name = typeName.text;
    final String contactNo = typePhoneNo.text;

    if (name.isNotEmpty && contactNo.isNotEmpty) {
      final newContact = User(fullname: fullname, phoneNumber: phoneNumber);
      contactList.add(newContact);

      // to clear the text field after creating newContact
      typeName.clear();
      typePhoneNo.clear();
      Provider.of<UpdateProvider>(context, listen: false)
          .joinNewcontact(newContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: Text(
            "Create newcontact",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
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
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: _obscureText,
              controller: typePhoneNo,
              decoration: InputDecoration(
                  labelText: 'Input phone Number',
                  labelStyle: const TextStyle(fontSize: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: toggleVisibility,
                  )),
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
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
