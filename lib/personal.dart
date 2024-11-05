import 'package:flutter/material.dart';
import 'package:october15gico_363/personal_datastruct.dart';
import 'package:october15gico_363/personal_list.dart';
import 'new_item.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {

  //Dummy data
  final List<PersonalDataStruct> _registerData =[

    PersonalDataStruct(
        name: 'Sharon Reyes',
        phonenum: 0926123456,
        pic: "Pic1",
        date: DateTime.now(),
        category: Category.beginner),
    PersonalDataStruct(
        name: 'Aisel d`Programmer',
        phonenum: 033300064,
        pic: "Pic2",
        date: DateTime.now(),
        category: Category.advanced),
    PersonalDataStruct(
        name: 'Dyolz Korbi',
        phonenum: 0978653421,
        pic: "Pic3",
        date: DateTime.now(),
        category: Category.intermediate),
    PersonalDataStruct(
        name: 'Pete Marwin Tristeza',
        phonenum: 0909874112,
        pic: "Pic4",
        date: DateTime.now(),
        category: Category.advanced),
  ];

  void _openAddItem() {
    showModalBottomSheet(
      context: context,
      builder: (ctxvar) => NewItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Personal Portfolio"),
          //Add a button to the AppBar
          actions: [
            IconButton(
              onPressed: _openAddItem,
              icon:
              Icon(Icons.add_box_rounded), //you may change your Add button format
            ),
          ],
        ),
      body: Column(
        children: [
          const Text('Personal Portfolio'),
          Expanded(
              child:
              PersonalList(
                  personallist: _registerData),
          )
        ],
      )
    );
  }
}
