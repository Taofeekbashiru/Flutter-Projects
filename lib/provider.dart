import 'package:flutter/material.dart';
import 'package:contactlist/user.dart';

// change notifier class

// change notifier provider

// consumer

class UpdateProvider extends ChangeNotifier {
  // variables e.g isDarkTheme (boolean)
  List<User> contactList = [];

  // function to initially update the list
  void initializeContactList() {
    contactList = List.generate(30, (index) {
      return User(
        fullname: usernames[index],
        phoneNumber: '123-456-78${index % 10}', // Example phone number
      );
    });
    notifyListeners();
  }

  // create contact
  void createNewContact(
      {required String fullName, required String phoneNumber}) {
    // new user variable
    User newUser = User(fullname: fullName, phoneNumber: phoneNumber);

    contactList.add(newUser);

    notifyListeners();
  }
}


// stateful widget and stateless widget
// inheritance