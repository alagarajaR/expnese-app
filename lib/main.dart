import 'package:expense_app/widgets/new_transcation.dart';
import 'package:expense_app/widgets/transcation_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

// My Home Page
class _MyHomepageState extends State<MyApp> {
  // late String titleInput;
  // late String amountInput;

  final List<Transcation> _userTransaction = [
    Transcation(
        id: 't1', title: 'New Shoes', amount: 99.99, date: DateTime.now()),
    Transcation(
        id: 't2',
        title: 'Weekly Veggies',
        amount: 100.73,
        date: DateTime.now()),
  ];

  void _addTranscation(String title, double txamount) {
    //print(title + " " + txamount.toString());

    final nexTx = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(nexTx);
    });
  }

  void _startAddNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTranscation(_addTranscation);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTranscation(context),
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
            TranscactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTranscation(context),
      ),
    );
  }
}
