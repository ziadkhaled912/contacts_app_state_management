import 'package:contacts_app_state_management/contact.dart';
import 'package:contacts_app_state_management/contact_addition_sheet.dart';
import 'package:contacts_app_state_management/contact_book.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContactBook _contactBook = ContactBook();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ContactAdditionSheet.open(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: _contactBook,
        builder: (context, contacts, child) {
          return ListView.separated(
            itemCount: contacts.length,
            padding: const EdgeInsets.symmetric(vertical: 24),
            separatorBuilder: (_, index) => const Divider(),
            itemBuilder: (_, index) {
              final contact = contacts[index];
              return Dismissible(
                key: ValueKey(contact.name),
                background: Container(
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete),
                ),
                onDismissed: (_) {
                  _contactBook.remove(contact);
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(contact.name)),
              );
            },
          );
        },
      ),
    );
  }
}
