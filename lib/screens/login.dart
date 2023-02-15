import 'package:flutter/material.dart';
import 'package:ucs_mdy/responsive.dart';
import 'package:ucs_mdy/screens/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> userLists = [
    'kanmyinttun@cumandalay.edu.mm',
    'kan@cumandlay.edu.mm',
    'kan@edu.mm',
    'kan.edu.mm',
    'kan'
  ];
  late String inputName;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktopScreen: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500.0,
                height: 70.0,
                color: Colors.black,
                child: Center(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.text,
                    onChanged: (name) => inputName = name,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(20.0),
                      isCollapsed: true,
                      border: InputBorder.none,
                    ),
                    onSaved: (name) => inputName = name!,
                    // onChanged: ((String name) {
                    //   inputName = name;
                    // }),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  final a = userLists.map((users) => users);
                  for (String user in a) {
                    if (inputName == user) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                      // context.pushReplacement('/home');
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('Your Email has not Register'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 6.0,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ),
      mobileScreen: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 200,
                height: 70.0,
                color: Colors.black,
                child: Center(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.text,
                    onChanged: (name) => inputName = name,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(20.0),
                      isCollapsed: true,
                      border: InputBorder.none,
                    ),
                    onSaved: (name) => inputName = name!,
                    // onChanged: ((String name) {
                    //   inputName = name;
                    // }),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  final a = userLists.map((users) => users);
                  for (String user in a) {
                    if (inputName == user) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                      // context.pushReplacement('/home');
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('Your Email has not Register'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 6.0,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
