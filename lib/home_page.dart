import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//text controllers

TextEditingController nameController = TextEditingController();
TextEditingController amountController = TextEditingController();

// ui related - open new expense box.
void openNewExpenseBox(){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("New expense"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //expense name
          TextField(
            controller: nameController,
          ),

          //exp amnt
          TextField(
            controller: amountController,
          ),
        ],
      ),
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