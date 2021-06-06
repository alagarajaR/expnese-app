import 'package:expense_app/widgets/new_transcation.dart';
import 'package:expense_app/widgets/transcation_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// My Home Page
class MyHomePage extends StatefulWidget {
  // late String titleInput;
  // late String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTranscation = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Week Veggies', amount: 150.75, date: DateTime.now()),
  ];

  void _addNewTranscation(String txTitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      _userTranscation.add(newTx);
    });
  }

  void _startNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTranscation(_addNewTranscation),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startNewTranscation(context),
              icon: Icon(
                Icons.add_box,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart!!'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            TranscactionList(_userTranscation)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTranscation(context),
      ),
    );
  }
}
