import 'package:contacts_app_state_management/contact.dart';
import 'package:contacts_app_state_management/contact_addition_sheet.dart';
import 'package:contacts_app_state_management/contact_cubit/contact_cubit_sheet.dart';
import 'package:contacts_app_state_management/contact_cubit/cubit/contact_book_cubit.dart';
import 'package:contacts_app_state_management/contact_cubit/cubit/contact_book_state.dart';
import 'package:contacts_app_state_management/contact_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubitPage extends StatelessWidget {
  const ContactCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ContactCubitSheet.open(context, BlocProvider.of<ContactBookCubit>(context)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),

      ),
      body: BlocBuilder<ContactBookCubit, ContactBookState>(
        builder: (context, state) => ListView.separated(
          itemCount: state.contacts.length,
          padding: const EdgeInsets.symmetric(vertical: 24),
          separatorBuilder: (_, index) => const Divider(),
          itemBuilder: (_, index) {
            final contact = state.contacts[index];
            return Dismissible(
              key: ValueKey(contact.name),
              background: Container(
                color: Colors.redAccent,
                child: const Icon(Icons.delete),
              ),
              onDismissed: (_) {
                BlocProvider.of<ContactBookCubit>(context).remove(contact);
              },
              child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(contact.name)),
            );
          },
        ),
      ),
    );
  }
}
