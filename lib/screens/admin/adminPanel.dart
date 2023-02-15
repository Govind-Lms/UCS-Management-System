import 'package:flutter/material.dart';
import 'package:ucs_mdy/screens/admin/blog_upload.dart';
import 'package:ucs_mdy/screens/admin/rollcall.dart';
import 'package:ucs_mdy/screens/homepage.dart';
import 'package:ucs_mdy/screens/students/student.dart';
import 'package:ucs_mdy/screens/teachers/teachers.dart';
import '../../widget/cslider.dart';
import '../../widget/homecategory.dart';
import '../timetables/chooseClass.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      'UCSMDY',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.logout,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const HomeScreen()));
                      },
                    ),
                  )
                ],
              ),
            ),
            CSlider(),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.blueAccent.shade100,
                    iconData: Icons.person_2,
                    name: 'Students',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const StudentScreen()));
                    },
                  ),
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.purple.shade100,
                    iconData: Icons.person_3,
                    name: 'Teachers',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const TeacherScreen()));
                    },
                  ),
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.yellow.shade100,
                    iconData: Icons.assignment,
                    name: 'Rollcalls',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const AdminChooseClass()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.green.shade100,
                    iconData: Icons.local_activity,
                    name: 'Activity',
                    onTap: () {},
                  ),
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.pink.shade100,
                    iconData: Icons.timelapse,
                    name: 'Timetables',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const TimetableChooseClass()));
                    },
                  ),
                  CategoryWidget(
                    height: 0.0,
                    color: Colors.indigo.shade100,
                    iconData: Icons.article,
                    name: 'Blogs',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const AdminBlogScreen()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
