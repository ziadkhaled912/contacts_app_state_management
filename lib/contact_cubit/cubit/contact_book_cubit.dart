import 'package:contacts_app_state_management/contact.dart';
import 'package:contacts_app_state_management/contact_cubit/cubit/contact_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBookCubit extends Cubit<ContactBookState> {
  ContactBookCubit() : super(const ContactBookState());

  void add(Contact contact) {
    final contacts = [...state.contacts, contact];
    emit(ContactBookState(contacts: contacts));
  }

  void remove(Contact contact) {
    final List<Contact> contacts = [];
    contacts.addAll(state.contacts);
    contacts.remove(contact);
    emit(ContactBookState(contacts: contacts));
  }


}
