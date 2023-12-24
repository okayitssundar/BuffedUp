
import 'package:BuffedUp/const/DataTypes/ExpenseCard.dart';
import 'package:BuffedUp/src/widget/memberform.dart';
import 'package:BuffedUp/src/widget/text.dart';
import 'package:flutter/material.dart';

class expensescreen extends StatefulWidget {
  const expensescreen({super.key});

  @override
  State<expensescreen> createState() => _expensescreenState();
}

class _expensescreenState extends State<expensescreen> {
  List<expensesCardType> expenses = [
    expensesCardType(
      count: 2,
      name: 'Item 1',
      price: 20,
      purchasedon: DateTime(2023, 10, 15),
      description: 'Description for Item 1',
      imageurl: 'https://dummyimage.com/100x100/abcdef/000000',
    ),
    expensesCardType(
      count: 1,
      name: 'Item 2',
      price: 15,
      purchasedon: DateTime(2023, 11, 25),
      description: 'Description for Item 2',
      imageurl: 'https://dummyimage.com/100x100/abcdef/000000',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
          Card(),
          expensesCard("title", expenses: expenses)
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class expensesCard extends StatelessWidget {
  String title;
  List<expensesCardType> expenses = [];
  expensesCard(this.title, {required this.expenses, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(title),
            TextButton.icon(
              onPressed: () {},
              label: Text("Add"),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,child: 
          ListView(
            children: expenses
                .map((e) => ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: CircleAvatar(
                        backgroundImage: e.imageurl != null
                            ? NetworkImage(e.imageurl!)
                            : null,
                      ),
                      title: Text(e.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${e.price}x${e.count}'),
                          Text(yearFormat(e.purchasedon)),
                        ],
                      ),
                    ))
                .toList(),
          ),
        // )
      ],
    ));
  }
}
