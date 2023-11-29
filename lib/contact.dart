import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String name;
  final String phone;

  const Contact({
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, phone];
}