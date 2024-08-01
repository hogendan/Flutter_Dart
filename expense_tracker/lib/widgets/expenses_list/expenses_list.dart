import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chart(expenses: expenses),
        Expanded(
          child: ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              onDismissed: (direction) => onRemoveExpense(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.delete),
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Theme.of(context).colorScheme.error,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete),
                  ),
                ),
              ),
              child: ExpenseItem(
                expenses[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
