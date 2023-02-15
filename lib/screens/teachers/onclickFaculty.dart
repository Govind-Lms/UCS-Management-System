import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucs_mdy/screens/teachers/onclickTeacher.dart';

class OnClickFaculty extends StatefulWidget {
  final String faculty;
  const OnClickFaculty({super.key, required this.faculty});

  @override
  State<OnClickFaculty> createState() => _OnClickFacultyState();
}

class _OnClickFacultyState extends State<OnClickFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.faculty.toUpperCase()),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('faculty')
            .doc(widget.faculty)
            .collection('teachers')
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
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => OnClickTeacher(
                              name: snapshot.data!.docs[index].get('name'),
                              image: snapshot.data!.docs[index].get('image'),
                              faculty:
                                  snapshot.data!.docs[index].get('faculty'),
                              id: snapshot.data!.docs[index].get('id'),
                            )));
                  },
                  child: Container(
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
                              Text(
                                snapshot.data!.docs[index].get('name'),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index].get('id'),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index].get('faculty'),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          const SizedBox(width: 20.0)
                        ],
                      ),
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
