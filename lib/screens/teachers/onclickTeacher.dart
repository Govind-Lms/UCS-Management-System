import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnClickTeacher extends StatefulWidget {
  final String name;
  final String image;
  final String faculty;
  final String id;
  const OnClickTeacher({
    super.key,
    required this.name,
    required this.image,
    required this.faculty,
    required this.id,
  });

  @override
  State<OnClickTeacher> createState() => _OnClickTeacherState();
}

class _OnClickTeacherState extends State<OnClickTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Student Info'),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
              child: const Placeholder(),
              // child: Image(image: AssetImage('me.png')),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Name:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Id:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Faculty:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.id,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.faculty,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('faculty')
                    .doc(widget.faculty)
                    .collection('teachers')
                    .doc(widget.id)
                    .collection('TeachingYear')
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data!.docs.length == 0) {
                    return const Center(child: Text('No Data'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  color: Colors.black12,
                                  blurRadius: 6.0,
                                )
                              ]),
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Year:',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Subject:',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Time Duration:',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${snapshot.data!.docs[index].get('year')} year (${snapshot.data!.docs[index].get('section')})(${snapshot.data!.docs[index].get('csorctorcst')})'
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    snapshot.data!.docs[index].get('subject'),
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    '${snapshot.data!.docs[index].get('timeduration')} (${snapshot.data!.docs[index].get('day')})',
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
