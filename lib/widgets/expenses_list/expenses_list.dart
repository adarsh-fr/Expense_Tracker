import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            background: Container(
              margin:
                  Theme.of(context).cardTheme.margin!.add(const EdgeInsets.all(4)),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 3, 3),
                //shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(
              expenses[index],
            ),
          )),
    );
  }
}
