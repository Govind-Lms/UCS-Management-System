import 'package:flutter/material.dart';
import 'package:ucs_mdy/screens/admin/adminPanel.dart';
import 'package:ucs_mdy/screens/admin/checkAdmin.dart';
import 'package:ucs_mdy/screens/blogs/blogscreen.dart';
import 'package:ucs_mdy/screens/rollcall/chooseClass.dart';
import 'package:ucs_mdy/screens/students/student.dart';
import 'package:ucs_mdy/screens/teachers/teachers.dart';
import 'package:ucs_mdy/screens/timetables/chooseClass.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/cslider.dart';
import '../widget/homecategory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Uri _url = Uri.parse(
      'https://medium.com/@govinddev010/blog-app-flutter-with-firebase-auth-75b7efd72a6c');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: ListView(
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
                        Icons.admin_panel_settings,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CheckAdmin()));
                      },
                    ),
                  )
                ],
              ),
            ),
            CSlider(),
            const SizedBox(height: 10.0),
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
                          builder: (context) => const StudentScreen()));
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
                          builder: (_) => const ChooseClassScreen()));
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
                          builder: (_) => const BlogScreen()));
                    },
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: const Divider(color: Colors.black, height: 1.0)),
            Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  "Articles",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                )),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _launchUrl();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.cyan,
                            image: const DecorationImage(
                                image: AssetImage('hello.png'),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0.0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Get Into\nLearning'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
