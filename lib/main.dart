import 'package:expense_tracker_app_flutter/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: Expense(),
    debugShowCheckedModeBanner: false,
  ));
}
