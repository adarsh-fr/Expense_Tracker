import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Color.fromARGB(255, 12, 73, 227),
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(expense.title,style: GoogleFonts.lato(fontWeight: FontWeight.w800, fontSize: 20),),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '\₹${expense.amount.toStringAsFixed(2)}',
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8,),
                      Text(expense.formattedDate, style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 17),)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
