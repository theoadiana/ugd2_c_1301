import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const amountOfList = 10;

  List<bool> expandedList = List.generate(amountOfList, (index) => false);

  Widget gridHomePage(double width, int index) {
    bool isExpanded = expandedList[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          expandedList[index] = !isExpanded;
        });
      },
      child: AnimatedContainer(
        width: isExpanded ? width * 0.9 : width * 0.45,
        height: isExpanded ? width * 0.9 : width * 0.45,
        margin: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            color: Colors.blue,
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Wrap(
            children: List.generate(
              amountOfList,
              (index) => gridHomePage(width, index),
            ),
          ),
        ),
      ),
    );
  }
}
