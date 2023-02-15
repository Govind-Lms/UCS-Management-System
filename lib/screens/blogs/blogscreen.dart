import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/admin/blog_model.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BlogScreen> {
  late String title;
  late String desc;
  late String year = 'first';
  late List<Blog> blogLists = [];
  final bool load = false;

  @override
  void initState() {
    super.initState();
    fetchBlogs().then((value) {
      setState(() {
        blogLists = value;
      });
      return blogLists = value;
    });
  }

  Future<List<Blog>> fetchBlogs() async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('blogs')
        .doc(year)
        .collection('blogs')
        .get();
    final list = snapshots.docs
        .map((e) => Blog(
            blogId: e['blogId'],
            title: e['title'],
            desc: e['desc'],
            subject: e['subject'],
            timestamp: e['timestamp']))
        .toList();
    setState(() {
      blogLists = list;
    });
    return blogLists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
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
                  color: Colors.black12,
                )
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
              // isDense: true,
              isExpanded: true,
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('blogs')
                      .doc(year)
                      .collection('blogs')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.cyanAccent,
                        ),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No Data'),
                      );
                    } else {
                      const CircularProgressIndicator();
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 6.0,
                                    color: Colors.black12)
                              ],
                            ),
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot.data!.docs[index].get('subject'),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${snapshot.data!.docs[index].get('timestamp').toDate().day}/${snapshot.data!.docs[index].get('timestamp').toDate().month}/${snapshot.data!.docs[index].get('timestamp').toDate().year} -- ${snapshot.data!.docs[index].get('timestamp').toDate().hour}:${snapshot.data!.docs[index].get('timestamp').toDate().minute}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  snapshot.data!.docs[index].get('title'),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  snapshot.data!.docs[index].get('desc'),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
