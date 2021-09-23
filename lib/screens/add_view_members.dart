import 'package:flutter/material.dart';

class AddViewMembers extends StatefulWidget {
  const AddViewMembers({Key? key}) : super(key: key);

  @override
  _AddViewMembersState createState() => _AddViewMembersState();
}

class _AddViewMembersState extends State<AddViewMembers> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
          title: const Center(child: Text("Add/View Members")),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                )),
          ]),
    );
  }
}
