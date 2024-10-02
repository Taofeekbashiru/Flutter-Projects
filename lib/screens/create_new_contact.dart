import 'package:contactlist/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ListTile(
          title: Text(
            "Create New Contact",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
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
            // button
            ElevatedButton(
              onPressed: () {
                Provider.of<UpdateProvider>(context, listen: false)
                    .createNewContact(
                        fullName: typeName.text, phoneNumber: typePhoneNo.text);
                Navigator.pop(context);
              },
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
