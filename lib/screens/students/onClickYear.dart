import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucs_mdy/screens/students/onClickStudent.dart';

class OnClickYear extends StatefulWidget {
  final String year;
  final String csOrcsorcst;
  final String section;
  const OnClickYear(
      {super.key,
      required this.year,
      required this.csOrcsorcst,
      required this.section});

  @override
  State<OnClickYear> createState() => _OnClickYearState();
}

class _OnClickYearState extends State<OnClickYear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.year.toUpperCase()),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('students')
            .doc(widget.year)
            .collection(widget.csOrcsorcst)
            .doc(widget.section)
            .collection('students')
            .snapshots(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.length == 0) {
            return const Center(
              child: Text('No Data'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                int i = index + 1;
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 6.0,
                          color: Colors.black12,
                        )
                      ]),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => OnClickStudent(
                                name: snapshot.data!.docs[index].get('name'),
                                image: snapshot.data!.docs[index].get('image'),
                                year: snapshot.data!.docs[index].get('year'),
                                rollNo:
                                    snapshot.data!.docs[index].get('rollNo'),
                                mail: snapshot.data!.docs[index].get('mail'),
                              )));
                    },
                    title: Row(
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.black,
                          child: Center(child: Text(i.toString())),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data!.docs[index].get('name'),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data!.docs[index].get('rollNo'),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              snapshot.data!.docs[index]
                                          .get('mail')
                                          .toString() ==
                                      ''
                                  ? 'null'
                                  : snapshot.data!.docs[index].get('mail'),
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const SizedBox(width: 20.0)
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
