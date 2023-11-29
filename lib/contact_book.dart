import 'package:contacts_app_state_management/contact.dart';
import 'package:flutter/cupertino.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);

  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  // final List<Contact> _contacts = [];

  int get length => value.length;

  void add(Contact contact) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove(Contact contact) {
    final contacts = value;
    contacts.remove(contact);
    notifyListeners();
  }

  Contact? contact(int index) {
    return value.length > index ? value[index] : null;
  }
}
