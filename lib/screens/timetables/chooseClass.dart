import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:ucs_mdy/screens/timetables/timetable.dart';

class TimetableChooseClass extends StatefulWidget {
  const TimetableChooseClass({super.key});

  @override
  State<TimetableChooseClass> createState() => TimetableChooseClassState();
}

class TimetableChooseClassState extends State<TimetableChooseClass> {
  late String year = 'first';
  late String section = 'A';
  late String csOrctorcst = 'cs';
  late String encryptedCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Choose Class'),
      ),
      body: Column(
        children: [
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
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => TimetableScreen(
                        year: year,
                        section: section,
                        csOrCtorCst: csOrctorcst)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 6.0,
                      color: Colors.black12)
                ],
              ),
              child: const CircleAvatar(
                radius: 30.0,
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
