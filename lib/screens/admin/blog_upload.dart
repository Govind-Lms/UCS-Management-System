import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucs_mdy/models/admin/blog_model.dart';

class AdminBlogScreen extends StatefulWidget {
  const AdminBlogScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminBlogScreen> {
  late String title;
  late String desc;
  late String subject;
  late String year = 'first';
  late int blogId = Random().nextInt(1000000) + 9999999;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'Brief Data',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? "Enter Blog Title" : null,
                            decoration: const InputDecoration(
                              hintText: "Blog Title",
                              prefixIcon: Icon(
                                Icons.title,
                                size: 25.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? "Enter Blog Subject" : null,
                            decoration: const InputDecoration(
                              hintText: "Subject",
                              prefixIcon: Icon(
                                Icons.title,
                                size: 25.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (val) {
                              subject = val;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (val) =>
                                val!.isEmpty ? "Enter Blog Description" : null,
                            decoration: const InputDecoration(
                              hintText: "Blog Description",
                              prefixIcon: Icon(
                                Icons.description,
                                size: 25.0,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (val) {
                              desc = val;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (title.isNotEmpty) {
                                FirebaseFirestore.instance
                                    .collection('blogs')
                                    .doc(year)
                                    .collection('blogs')
                                    .doc(blogId.toString())
                                    .set({
                                  'title': title,
                                  'subject': subject,
                                  'timestamp': Timestamp.now(),
                                  'blogId': blogId.toString(),
                                  'desc': desc,
                                });
                                setState(() {
                                  blogId = Random().nextInt(1000000) + 9999999;
                                  title = '';
                                  desc = '';
                                  subject = '';
                                });
                              }
                              Navigator.of(context).pop(true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Text(
                                "Add Blogs",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
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
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height - 200,
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
                    } else if (snapshot.data!.docs.length == 0) {
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

class BlogTile extends StatelessWidget {
  final String title;
  final String desc;
  final String subject;
  final Timestamp timestamp;

  const BlogTile(
      {super.key,
      required this.title,
      required this.desc,
      required this.subject,
      required this.timestamp});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(3, 3), blurRadius: 6.0, color: Colors.black12)
          ]),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            subject,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
          Text(
            '${timestamp.toDate().day}/${timestamp.toDate().month}/${timestamp.toDate().year} -- ${timestamp.toDate().hour}:${timestamp.toDate().minute}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          Text(
            desc,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
