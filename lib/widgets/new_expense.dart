import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          amount: enteredAmount,
          date: _selectedDate!,
          title: _titleController.text,
          category: _selectedCategory),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            //maxLength: 50,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  //maxLength: 10,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'(\d+)'),
                    ),
                  ],
                  decoration: InputDecoration(
                    prefixText: '₹',
                    label: Text(
                      'Amount',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:  BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       Expanded(
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //             enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(20),
              //               borderSide: const BorderSide(
              //                 width: 1,
              //                 color: Color.fromARGB(90, 64, 67, 255),
              //               ),
              //             ),
              //           ),
              //           readOnly: true,
              //           controller: TextEditingController(
              //             text: _selectedDate == null
              //                 ? 'No Date Selected'
              //                 : formatter.format(_selectedDate!),
              //           ),
              //           style: GoogleFonts.lato(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18,
              //             color: const Color.fromARGB(255, 64, 67, 255),
              //           ),
              //         ),
              //       ),
              //       IconButton(
              //         alignment: Alignment.topRight,
              //         onPressed: () {
              //           _presentDatePicker();
              //         },
              //         icon: const Icon(Icons.calendar_today_outlined),
              //       ),
              //     ],
              //   ),
              // ),
              // Spacer(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            'Date',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:  BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                          text: _selectedDate == null
                              ? ''
                              : formatter.format(_selectedDate!),
                        ),
                        // style: GoogleFonts.lato(
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 18,
                        //   color: const Color.fromARGB(255, 64, 67, 255),
                        // ),
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      alignment: Alignment.topRight,
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ],

                  // children: [
                  //   // Text(
                  //   //   _selectedDate == null
                  //   //       ? 'No Date Selected'
                  //   //       : formatter.format(_selectedDate!),
                  //   // ),
                  //   // IconButton(
                  //   //   onPressed: () {
                  //   //     _presentDatePicker();
                  //   //   },
                  //   //   icon: const Icon(Icons.calendar_today_outlined),
                  //   // ),
                  // ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      style: BorderStyle.solid,
                      width: 1,
                    )),
                child: DropdownButton(
                  dropdownColor: Theme.of(context).cardTheme.color,
                  alignment: AlignmentDirectional.center,
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              //fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(19, 64, 67, 255),
                  ),
                ),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData();
                },
                style: const ButtonStyle(
                    // backgroundColor: MaterialStatePropertyAll(
                    //     Color.fromARGB(255, 64, 67, 255)),
                    ),
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
