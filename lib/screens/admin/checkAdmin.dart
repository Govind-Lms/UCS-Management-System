import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ucs_mdy/models/admin/admin_model.dart';
import 'package:ucs_mdy/screens/admin/adminPanel.dart';

class CheckAdmin extends StatefulWidget {
  const CheckAdmin({super.key});

  @override
  State<CheckAdmin> createState() => _CheckAdminState();
}

class _CheckAdminState extends State<CheckAdmin> {
  late List<Admin> admins = [];
  late String inputCode;

  Future<List<Admin>> fetchAdins() async {
    QuerySnapshot snapshots =
        await FirebaseFirestore.instance.collection('admins').get();
    final adminLists =
        snapshots.docs.map((e) => Admin(e['id'], e['name'])).toList();

    return admins = adminLists;
  }

  @override
  void initState() {
    super.initState();
    fetchAdins().then((value) {
      setState(() {
        admins = value;
      });
      admins = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 200,
              height: 70.0,
              color: Colors.black,
              child: Center(
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardAppearance: Brightness.light,
                  keyboardType: TextInputType.text,
                  onChanged: (name) => inputCode = name,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(20.0),
                    isCollapsed: true,
                    border: InputBorder.none,
                  ),
                  onSaved: (name) => inputCode = name!,
                  // onChanged: ((String name) {
                  //   inputName = name;
                  // }),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                final a = admins.map((e) => e.id);
                for (String user in a) {
                  if (inputCode == user) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const AdminPanelScreen()));
                    // context.pushReplacement('/home');
                  }

                  // var snackBar = const SnackBar(
                  //     content: Text('Your Email has not Register'));
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                width: 70.0,
                height: 70.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 6.0,
                      color: Colors.black12,
                    )
                  ],
                ),
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
