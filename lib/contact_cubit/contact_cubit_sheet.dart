import 'package:contacts_app_state_management/contact.dart';
import 'package:contacts_app_state_management/contact_cubit/cubit/contact_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubitSheet extends StatefulWidget {
  const ContactCubitSheet({super.key, required this.cubit});

  final ContactBookCubit cubit;

  @override
  State<ContactCubitSheet> createState() => _ContactCubitSheetState();

  static void open(BuildContext context, ContactBookCubit cubit) => showModalBottomSheet(
      context: context, isScrollControlled: true, builder: (context) => ContactCubitSheet(cubit: cubit));
}

class _ContactCubitSheetState extends State<ContactCubitSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0).copyWith(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Contact",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Your Contact Name",
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This Field is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Your Contact Phone",
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      final contact = Contact(name: _nameController.text, phone: _phoneController.text);
                      widget.cubit.add(contact);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
