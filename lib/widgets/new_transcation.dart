import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTranscation extends StatelessWidget {
  final titleController = TextEditingController();
  final amountContoller = TextEditingController();
  final Function addTx;

  NewTranscation(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountContoller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0.0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountContoller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              child: Text("Add Transcation"),
              onPressed: submitData,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
