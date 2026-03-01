import 'package:flutter/material.dart';

class CounterNotifyer extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}

CounterNotifyer theCounterNotifyer = CounterNotifyer();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: CountApp()),
    ),
  );
}

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  void onPlus() {
    theCounterNotifyer.incrementCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onPlus,
        child: Text("+"),
      ),
      body: Center(
        child: Text("hello ${theCounterNotifyer.count.toString()} "),
      ),
    );
  }
}
