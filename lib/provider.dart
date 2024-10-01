import 'package:flutter/material.dart';
import 'package:contactlist/user.dart';

class UpdateProvider extends ChangeNotifier {
  List<User> contactList = [];

  void updateContactList() {
    contactList.addAll(contactList);
  }

  void joinNewcontact(User newContact) {
    contactList.add(newContact);
    notifyListeners();
  }
}
