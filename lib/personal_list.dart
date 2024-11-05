import 'package:flutter/cupertino.dart';
import 'package:october15gico_363/personal_datastruct.dart';
import 'package:october15gico_363/personal_item.dart';



class PersonalList extends StatelessWidget {
  const PersonalList({super.key, required this.personallist});

  final List<PersonalDataStruct> personallist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personallist.length,
      itemBuilder: (ctx,index) => PersonalItem(personallist[index]),
    );
  }
}
