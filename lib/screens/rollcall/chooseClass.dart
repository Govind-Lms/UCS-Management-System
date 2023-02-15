import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ucs_mdy/screens/rollcall/rollcall.dart';

class ChooseClassScreen extends StatefulWidget {
  const ChooseClassScreen({super.key});

  @override
  State<ChooseClassScreen> createState() => _ChooseClassScreenState();
}

class _ChooseClassScreenState extends State<ChooseClassScreen> {
  late String year = 'first';
  late String section = 'A';
  late String csOrctorcst = 'cs';
  late String encryptedCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Choose Class',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('encryptedCodes').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 6.0,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10.0),
                      icon: const Icon(Icons.arrow_drop_down),
                      value: year,
                      items: const [
                        DropdownMenuItem(
                          value: 'first',
                          child: Text('First Year'),
                        ),
                        DropdownMenuItem(
                          value: 'second',
                          child: Text('Second Year'),
                        ),
                        DropdownMenuItem(
                          value: 'third',
                          child: Text('Third Year'),
                        ),
                        DropdownMenuItem(
                          value: 'fourth',
                          child: Text('Fourth Year'),
                        ),
                        DropdownMenuItem(
                          value: 'fitth',
                          child: Text('Fifth Year'),
                        ),
                      ].toList(),
                      onChanged: (value) {
                        setState(() {
                          year = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 6.0,
                            color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10.0),
                      icon: const Icon(Icons.arrow_drop_down),
                      value: section,
                      alignment: Alignment.center,
                      items: const [
                        DropdownMenuItem(
                          value: 'A',
                          child: Text('A'),
                        ),
                        DropdownMenuItem(
                          value: 'B',
                          child: Text('B'),
                        ),
                        DropdownMenuItem(
                          value: 'C',
                          child: Text('C'),
                        ),
                        DropdownMenuItem(
                          value: 'D',
                          child: Text('D'),
                        ),
                        DropdownMenuItem(
                          value: 'E',
                          child: Text('E'),
                        ),
                      ].toList(),
                      onChanged: (value) {
                        setState(() {
                          section = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 6.0,
                            color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10.0),
                      icon: const Icon(Icons.arrow_drop_down),
                      value: csOrctorcst,
                      alignment: Alignment.center,
                      items: const [
                        DropdownMenuItem(
                          value: 'cs',
                          child: Text('CS'),
                        ),
                        DropdownMenuItem(
                          value: 'ct',
                          child: Text('CT'),
                        ),
                        DropdownMenuItem(
                          value: 'cst',
                          child: Text('CST'),
                        ),
                      ].toList(),
                      onChanged: (value) {
                        setState(() {
                          csOrctorcst = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                height: MediaQuery.of(context).size.height / 3,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 30.0),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.black),
                                      child: Center(
                                        child: TextFormField(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          onChanged: (code) {
                                            encryptedCode = code;
                                            setState(() {
                                              encryptedCode = code;
                                            });
                                          },
                                          onSaved: (code) {
                                            encryptedCode = code!;
                                            setState(() {
                                              encryptedCode = code;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Search',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            contentPadding:
                                                EdgeInsets.all(20.0),
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        late String code;
                                        for (var a in snapshot.data!.docs) {
                                          if (kDebugMode) {
                                            print(a.toString());
                                          }
                                          code = a.get('code');
                                          if (encryptedCode == code) {
                                            if (kDebugMode) {
                                              print(encryptedCode);
                                            }
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        RollCallScreen(
                                                            year: year,
                                                            section: section,
                                                            csOrctorcst:
                                                                csOrctorcst)));
                                            setState(() {
                                              encryptedCode = '';
                                            });
                                            // Navigator.of(context).pop(true);
                                          }
                                        }

                                        // Navigator.of(context).pop(true);
                                      },
                                      child: const Text('Clicked'),
                                    ),
                                    const SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Click',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
