import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucs_mdy/models/admin/student_data_model.dart';

class AdminChooseClass extends StatefulWidget {
  const AdminChooseClass({super.key});

  @override
  State<AdminChooseClass> createState() => _AdminChooseClassState();
}

class _AdminChooseClassState extends State<AdminChooseClass> {
  late String year = 'first';
  late String csOrctorcst = 'cs';
  late String section = 'A';
  late String attendanceYear = '2023';
  late String attendanceMonth = '1';
  late String day = '1';
  late String timeDuration = '9.1';
  late List<StudentDataModel> studentLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Choose Class'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 3 + 50,
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
                            value: 'fifth',
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: 60.0,
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: 80,
                      height: 60.0,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.0),
                        icon: const Icon(Icons.arrow_drop_down),
                        value: csOrctorcst,
                        elevation: 10,
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 60.0,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.0),
                        icon: const Icon(Icons.arrow_drop_down),
                        value: attendanceYear,
                        items: const [
                          DropdownMenuItem(
                            value: '2023',
                            child: Text('2023'),
                          ),
                          DropdownMenuItem(
                            value: '2024',
                            child: Text('2024'),
                          ),
                        ].toList(),
                        onChanged: (value) {
                          setState(() {
                            attendanceYear = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: 140.0,
                      height: 60.0,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.0),
                        icon: const Icon(Icons.arrow_drop_down),
                        value: attendanceMonth,
                        alignment: Alignment.center,
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('January'),
                          ),
                          DropdownMenuItem(
                            value: '2',
                            child: Text('Febuary'),
                          ),
                          DropdownMenuItem(
                            value: '3',
                            child: Text('March'),
                          ),
                          DropdownMenuItem(
                            value: '4',
                            child: Text('April'),
                          ),
                          DropdownMenuItem(
                            value: '5',
                            child: Text('May'),
                          ),
                          DropdownMenuItem(
                            value: '6',
                            child: Text('June'),
                          ),
                          DropdownMenuItem(
                            value: '7',
                            child: Text('July'),
                          ),
                          DropdownMenuItem(
                            value: '8',
                            child: Text('August'),
                          ),
                          DropdownMenuItem(
                            value: '9',
                            child: Text('September'),
                          ),
                          DropdownMenuItem(
                            value: '10',
                            child: Text('October'),
                          ),
                          DropdownMenuItem(
                            value: '11',
                            child: Text('November'),
                          ),
                          DropdownMenuItem(
                            value: '12',
                            child: Text('December'),
                          ),
                        ].toList(),
                        onChanged: (value) {
                          setState(() {
                            attendanceMonth = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      width: 70.0,
                      height: 60.0,
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.0),
                        icon: const Icon(Icons.arrow_drop_down),
                        value: day,
                        elevation: 10,
                        alignment: Alignment.center,
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('1'),
                          ),
                          DropdownMenuItem(
                            value: '2',
                            child: Text('2'),
                          ),
                          DropdownMenuItem(
                            value: '3',
                            child: Text('3'),
                          ),
                          DropdownMenuItem(
                            value: '4',
                            child: Text('4'),
                          ),
                          DropdownMenuItem(
                            value: '5',
                            child: Text('5'),
                          ),
                          DropdownMenuItem(
                            value: '6',
                            child: Text('6'),
                          ),
                          DropdownMenuItem(
                            value: '7',
                            child: Text('7'),
                          ),
                          DropdownMenuItem(
                            value: '8',
                            child: Text('8'),
                          ),
                          DropdownMenuItem(
                            value: '9',
                            child: Text('9'),
                          ),
                          DropdownMenuItem(
                            value: '10',
                            child: Text('10'),
                          ),
                          DropdownMenuItem(
                            value: '11',
                            child: Text('11'),
                          ),
                          DropdownMenuItem(
                            value: '12',
                            child: Text('12'),
                          ),
                          DropdownMenuItem(
                            value: '13',
                            child: Text('13'),
                          ),
                          DropdownMenuItem(
                            value: '14',
                            child: Text('14'),
                          ),
                          DropdownMenuItem(
                            value: '15',
                            child: Text('15'),
                          ),
                          DropdownMenuItem(
                            value: '16',
                            child: Text('16'),
                          ),
                          DropdownMenuItem(
                            value: '17',
                            child: Text('17'),
                          ),
                          DropdownMenuItem(
                            value: '18',
                            child: Text('18'),
                          ),
                          DropdownMenuItem(
                            value: '19',
                            child: Text('19'),
                          ),
                          DropdownMenuItem(
                            value: '20',
                            child: Text('20'),
                          ),
                          DropdownMenuItem(
                            value: '21',
                            child: Text('21'),
                          ),
                          DropdownMenuItem(
                            value: '22',
                            child: Text('22'),
                          ),
                          DropdownMenuItem(
                            value: '23',
                            child: Text('23'),
                          ),
                          DropdownMenuItem(
                            value: '24',
                            child: Text('24'),
                          ),
                          DropdownMenuItem(
                            value: '25',
                            child: Text('25'),
                          ),
                          DropdownMenuItem(
                            value: '26',
                            child: Text('26'),
                          ),
                          DropdownMenuItem(
                            value: '27',
                            child: Text('27'),
                          ),
                          DropdownMenuItem(
                            value: '28',
                            child: Text('28'),
                          ),
                          DropdownMenuItem(
                            value: '29',
                            child: Text('29'),
                          ),
                          DropdownMenuItem(
                            value: '30',
                            child: Text('30'),
                          ),
                          DropdownMenuItem(
                            value: '31',
                            child: Text('31'),
                          ),
                        ].toList(),
                        onChanged: (value) {
                          setState(() {
                            day = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(10.0),
                  icon: const Icon(Icons.arrow_drop_down),
                  value: timeDuration,
                  items: const [
                    DropdownMenuItem(
                      value: '9.1',
                      child: Text('09.10'),
                    ),
                    DropdownMenuItem(
                      value: '10.11',
                      child: Text('10.11'),
                    ),
                    DropdownMenuItem(
                      value: '11.12',
                      child: Text('11.12'),
                    ),
                    DropdownMenuItem(
                      value: '13.14',
                      child: Text('13.14'),
                    ),
                    DropdownMenuItem(
                      value: '14.15',
                      child: Text('14.15'),
                    ),
                    DropdownMenuItem(
                      value: '15.16',
                      child: Text('15.16'),
                    ),
                    DropdownMenuItem(
                      value: 'not valid',
                      child: Text('Not Valid'),
                    ),
                  ].toList(),
                  onChanged: (value) {
                    setState(() {
                      timeDuration = value!;
                    });
                  },
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AdminRollCallScreen(
                        attendanceDay: day,
                        attendanceMonth: attendanceMonth,
                        attendanceYear: attendanceYear,
                        timeduration: timeDuration,
                        csOrctorcst: csOrctorcst,
                        section: section,
                        year: year,
                      ),
                    ),
                  );
                },
                child: const Center(
                  child: Text('Check Data'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AdminRollCallScreen extends StatefulWidget {
  final String attendanceYear;
  final String attendanceMonth;
  final String attendanceDay;
  final String year;
  final String section;
  final String csOrctorcst;
  final String timeduration;
  const AdminRollCallScreen(
      {super.key,
      required this.attendanceYear,
      required this.attendanceMonth,
      required this.attendanceDay,
      required this.year,
      required this.section,
      required this.csOrctorcst,
      required this.timeduration});

  @override
  State<AdminRollCallScreen> createState() => _AdminRollCallScreenState();
}

class _AdminRollCallScreenState extends State<AdminRollCallScreen> {
  late List<StudentDataModel> studentList = [];
  @override
  void initState() {
    super.initState();
    fetchStudentsData().then((value) {
      setState(() {
        studentList = value;
      });
      return studentList = value;
    });
  }

  Future<List<StudentDataModel>> fetchStudentsData() async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('rollcall')
        .doc(widget.year)
        .collection(widget.csOrctorcst)
        .doc(widget.section)
        .collection(widget.attendanceYear)
        .doc(widget.attendanceMonth)
        .collection(widget.attendanceDay)
        .doc(widget.timeduration)
        .collection('students')
        .get();
    final studentLists = snapshots.docs
        .map(
          (e) => StudentDataModel(
            timeduration: e['timeduration'],
            attendance: e['attendance'],
            name: e['name'],
            rollNo: e['rollNo'],
            mail: e['mail'],
            image: e['image'],
            year: e['year'],
          ),
        )
        .toList();
    return studentLists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll Calls'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rollcall')
            .doc(widget.year)
            .collection(widget.csOrctorcst)
            .doc(widget.section)
            .collection(widget.attendanceYear)
            .doc(widget.attendanceMonth)
            .collection(widget.attendanceDay)
            .doc(widget.timeduration)
            .collection('students')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(studentList[index].name),
                            Text(studentList[index].rollNo),
                          ],
                        ),
                      ],
                    ),
                    value: studentList[index].attendance,
                    onChanged: (value) {
                      // setState(() {
                      //   studentList[index].attendance = value!;
                      // });
                      // FirebaseFirestore.instance
                      //     .collection('students')
                      //     .doc(year)
                      //     .collection(csOrctorcst)
                      //     .doc(section)
                      //     .collection('students')
                      //     .doc(snapshot.data!.docs[index].id)
                      //     .update(
                      //   {
                      //     'attendance': value!,
                      //   },
                      // );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
