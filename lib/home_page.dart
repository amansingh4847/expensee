import 'package:expensee/database/expense_database.dart';
import 'package:expensee/helper/helper_functions.dart';
import 'package:expensee/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//text controllers

TextEditingController nameController = TextEditingController();
TextEditingController amountController = TextEditingController();


@override
void initSate() {
  super.initState();
}
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
            decoration:const InputDecoration(hintText: "Name"),
          ),

          //exp amnt
          TextField(
            controller: amountController,
            decoration:const InputDecoration(hintText: "Amount"),
          ),
        ],
      ),

      actions: [
        //cancel button
        _cancelButton(),

        //save button
        _createNewExpenseButton(),

      ],

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

  //cancel button
  Widget _cancelButton(){
    return MaterialButton(onPressed: (){ 
      Navigator.pop(context);

      nameController.clear();
      amountController.clear();
    },
    child: const Text('Cancel'), );
  }

  Widget _createNewExpenseButton(){
    return MaterialButton(onPressed: () async{
      if(
        nameController.text.isNotEmpty &&
        amountController.text.isNotEmpty
      ){
        Navigator.pop(context);

        Expense newExpense = Expense(name: nameController.text,
        amount: convertStringTodouble(amountController.text),
        date: DateTime.now()
        );

        await context.read<ExpenseDatabase>().createNewExpense(newExpense);

        nameController.clear();
        amountController.clear();
        
      }
    },
    child: const Text("Add"),
    );
  }
  
} 