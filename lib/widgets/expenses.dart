import 'package:expense_tracker_app_flutter/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker_app_flutter/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class Expense extends StatefulWidget {
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _registerExpense = [
    Expenses(
        title: "flutter course",
        amount: 500,
        date: DateTime.now(),
        category: Category.work),
    Expenses(
        title: "cinema",
        amount: 700,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpense(){
    showModalBottomSheet(context: context, builder: (ctx)=>NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: (){
            _openAddExpense();
            //todo
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text("the chart.."),
          Expanded(child: ExpenseList(expenses: _registerExpense))
        ],
      ),
    );
  }
}
