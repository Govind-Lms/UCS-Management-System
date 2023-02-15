import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData iconData;
  final VoidCallback onTap;
  final double height;
  final Color color;

  const CategoryWidget(
      {super.key,
      required this.name,
      required this.iconData,
      required this.onTap,
      required this.height,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        // height: MediaQuery.of(context).size.width / 4,
        height: height == 0 ? MediaQuery.of(context).size.width / 4 : height,
        decoration: BoxDecoration(
            // border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(3, 3),
                blurRadius: 6.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Icon(
              iconData,
              color: Colors.black,
              size: 30.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
