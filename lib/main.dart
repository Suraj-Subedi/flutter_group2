import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < 100; i++)
                Row(
                  children: [
                    for (int j = 0; j < 5; j++)
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: j % 2 == 0
                                ? i % 2 == 0
                                    ? Colors.green
                                    : Colors.red
                                : i % 2 == 0
                                    ? Colors.red
                                    : Colors.green,
                          ),
                        ),
                      ),
                  ],
                ),

              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     height: 200,
              //     color: Colors.green,
              //   ),
              // ),
              // Expanded(
              //   child: Container(
              //     height: 200,
              //     color: Colors.blue,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
