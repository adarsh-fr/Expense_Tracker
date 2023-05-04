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
      
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(  
                    '\₹${expense.amount.toStringAsFixed(2)}',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const Spacer(),
                  Text(
                    expense.title,
                    //style: Theme.of(context).textTheme.titleLarge,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      //const SizedBox(width: 8,),
                      Text(
                        expense.formattedDate,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
