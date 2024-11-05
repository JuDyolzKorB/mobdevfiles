import 'package:flutter/material.dart';
import 'package:october15gico_363/personal_datastruct.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItem();
  }
}

class _NewItem extends State<NewItem> {
  var _enteredName = '';

  final _nameController = TextEditingController();
  final _phonenumController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _nameController.dispose();
    _phonenumController.dispose();
    super.dispose();
  }

  void _saveNameInput(String inputValue) {
    _enteredName = inputValue;
  }

  void _displayDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _nameController,
            decoration: InputDecoration(
              label: Text('Name'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _phonenumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: 'PN - ',
                    label: Text('Phone Number'),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    Text(_selectedDate == null
                      ? "Choose the Date"
                      : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _displayDatePicker,
                      icon: Icon(Icons.calendar_month)
                    )
                ],
              )
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase())))
                      .toList(),
                    onChanged: (value) {
                    print(value);
                  }),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CANCEL'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_nameController.text);
                  print(_phonenumController.text);
                },
                child: Text("SAVE Entry"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
