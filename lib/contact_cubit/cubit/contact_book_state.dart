import 'package:contacts_app_state_management/contact.dart';

class ContactBookState {
  final List<Contact> contacts;

  const ContactBookState({
    this.contacts = const [],
  });
}