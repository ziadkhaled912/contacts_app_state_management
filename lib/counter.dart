import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${CounterProvider.of(context).count}",
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class CounterProvider extends InheritedWidget {
  const CounterProvider({
    super.key,
    required Widget child,
    required this.count,
    required this.addCounter,
  }) : super(child: child);

  final int count;
  final VoidCallback addCounter;

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(result != null, 'No CounterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return old.count != count;
  }
}
