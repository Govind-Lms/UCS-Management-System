import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucs_mdy/models/attendance.dart';
import 'package:ucs_mdy/widget/customSliverApp.dart';

class RollCallScreen extends StatefulWidget {
  final String year;
  final String section;
  final String csOrctorcst;
  const RollCallScreen(
      {super.key,
      required this.year,
      required this.section,
      required this.csOrctorcst});

  @override
  State<RollCallScreen> createState() => _RollCallScreenState();
}

class _RollCallScreenState extends State<RollCallScreen> {
  late String year = widget.year;
  late String section = widget.section;
  late String csOrctorcst = widget.csOrctorcst;
  late List<Attendance> studentList = [];

  late Timestamp timestamp = Timestamp.now();
  late String timeduration = 'not valid';

  getHour() {
    if (timestamp.toDate().hour >= 9 && timestamp.toDate().hour < 10) {
      // setState(() {
      //   timeduration = '09.10';
      // });
      return timeduration = '09.10';
    } else if (timestamp.toDate().hour >= 10 && timestamp.toDate().hour < 11) {
      // setState(() {
      //   timeduration = '10.11';
      // });
      return timeduration = '10.11';
    } else if (timestamp.toDate().hour >= 11 && timestamp.toDate().hour < 12) {
      // setState(() {
      //   timeduration = '11.12';
      // });
      return timeduration = '11.12';
    } else if (timestamp.toDate().hour >= 13 && timestamp.toDate().hour < 14) {
      // setState(() {
      //   timeduration = '13.14';
      // });
      return timeduration = '13.14';
    } else if (timestamp.toDate().hour >= 14 && timestamp.toDate().hour < 15) {
      // setState(() {
      //   timeduration = '14.15';
      // });
      return timeduration = '14.15';
    } else if (timestamp.toDate().hour >= 15 && timestamp.toDate().hour < 16) {
      // setState(() {
      //   timeduration = '15.16';
      // });
      return timeduration = '15.16';
    } else {
      return timeduration;
    }
  }

  @override
  void initState() {
    super.initState();
    getHour();
    // if (kDebugMode) {
    //   print(timestamp.toDate().hour.toString());
    // }
    fetchUsers().then((value) {
      setState(() {
        studentList = value;
      });
      return studentList = value;
    });
  }

  Future<List<Attendance>> fetchUsers() async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('students')
        .doc(year)
        .collection(csOrctorcst)
        .doc(section)
        .collection('students')
        .get();
    final studentLists = snapshots.docs
        .map(
          (e) => Attendance(
            attendance: e['attendance'],
            image: e['image'],
            mail: e['mail'],
            name: e['name'],
            year: e['year'],
            rollNo: e['rollNo'],
          ),
        )
        .toList();
    return studentLists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          const RollCallAppBar(),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'No',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    'Name',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Present/Absent',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 250,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('students')
                      .doc(year)
                      .collection(csOrctorcst)
                      .doc(section)
                      .collection('students')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 50,
                        child: ListView.builder(
                          itemCount: studentList.length,
                          itemBuilder: (BuildContext context, int index) {
                            FirebaseFirestore.instance
                                .collection('rollcall')
                                .doc(year)
                                .collection(csOrctorcst)
                                .doc(section)
                                .collection(timestamp.toDate().year.toString())
                                .doc(timestamp.toDate().month.toString())
                                .collection(timestamp.toDate().day.toString())
                                .doc(getHour())
                                .collection('students')
                                .doc(studentList[index].rollNo)
                                .set(
                              {
                                'timeduration': timeduration.toString(),
                                'attendance': studentList[index].attendance,
                                'image': studentList[index].image,
                                'mail': studentList[index].mail,
                                'name': studentList[index].name,
                                'year': studentList[index].year,
                                'rollNo': studentList[index].rollNo,
                              },
                            );
                            int i = index + 1;
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              child: CheckboxListTile(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(studentList[index].name),
                                        Text(studentList[index].rollNo),
                                      ],
                                    ),
                                  ],
                                ),
                                value: studentList[index].attendance,
                                onChanged: (value) {
                                  setState(() {
                                    studentList[index].attendance = value!;
                                  });
                                  FirebaseFirestore.instance
                                      .collection('students')
                                      .doc(year)
                                      .collection(csOrctorcst)
                                      .doc(section)
                                      .collection('students')
                                      .doc(snapshot.data!.docs[index].id)
                                      .update(
                                    {
                                      'attendance': value!,
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'No Data',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          CircularProgressIndicator(
                            color: Colors.black,
                          )
                        ],
                      );
                    }
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black),
              child: const Center(
                child: Text(
                  'Export',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
