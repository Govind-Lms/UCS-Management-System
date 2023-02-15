import 'package:flutter/material.dart';
import 'package:ucs_mdy/screens/rollcall/chooseClass.dart';

class CustomSliverApp extends StatelessWidget {
  const CustomSliverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      title: const Text('UCS-MDY'),
      actions: [
        MaterialButton(
          elevation: 1.0,
          minWidth: 150.0,
          onPressed: () {},
          highlightColor: Colors.white60,
          child: Text(
            'Library'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          elevation: 1.0,
          minWidth: 150.0,
          onPressed: () {},
          highlightColor: Colors.white60,
          child: Text(
            'Teachers'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          minWidth: 150.0,
          elevation: 1.0,
          onPressed: () {},
          highlightColor: Colors.white60,
          child: Text(
            'Students'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          minWidth: 150.0,
          elevation: 1.0,
          onPressed: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => TimetableScreen()));
          },
          highlightColor: Colors.white60,
          child: Text(
            'Time Table'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          minWidth: 150.0,
          elevation: 1.0,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ChooseClassScreen()));
          },
          highlightColor: Colors.white60,
          child: Text(
            'Roll Call'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          elevation: 1.0,
          minWidth: 150.0,
          onPressed: () {
            // context.go('/login');
          },
          color: Colors.green,
          highlightColor: Colors.white60,
          child: Text(
            'ADMIN'.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class RollCallAppBar extends StatelessWidget {
  const RollCallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      // backgroundColor: Colors.black,
      title: Text('RollCall'),
      centerTitle: false,
      floating: true,
      pinned: true,
    );
  }
}
