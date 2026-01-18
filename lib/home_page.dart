import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


// ui related - open new expense box.
void openNewExpenseBox(){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("New expense"),
    ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openNewExpenseBox,
        child: const Icon(Icons.add),
        ),
    );
  }
} 