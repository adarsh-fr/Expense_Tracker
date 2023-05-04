import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 99,
      date: DateTime.now(),
      title: 'BreakFast',
      category: Category.food,
    ),
    Expense(
      amount: 99,
      date: DateTime.now(),
      title: 'Lunch',
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              setState(
                () {
                  _registeredExpenses.insert(expenseIndex, expense);
                },
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Please Start living',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 67, 255),
        title: Text(
          'Expense Tracker',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add Expenses',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Text('The Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
