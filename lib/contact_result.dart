import 'package:contacts_app_state_management/contact.dart';
import 'package:equatable/equatable.dart';

class ContactResult extends Equatable {
  final List<Contact> contacts;
  final int count;

  const ContactResult({
    this.contacts = const [],
    this.count = 0,
  });

  @override
  List<Object?> get props => [contacts, count];

  ContactResult copyWith({
    List<Contact>? contacts,
    int? count,
  }) {
    return ContactResult(
      contacts: contacts ?? this.contacts,
      count: count ?? this.count,
    );
  }
}