import 'package:flutter/material.dart';
import 'package:june_30/cart.dart';
import 'package:june_30/home.dart';
import 'package:june_30/notification.dart';
import 'package:june_30/profile.dart';

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
      home: const LayoutTest(),
      routes: {
        '/notification': (context) => const NotificationPage(),
      },
      // routes: {
      //   '/notification': (context) => const NotificationPage(),
      // }
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

class LayoutTest extends StatefulWidget {
  const LayoutTest({super.key});

  @override
  State<LayoutTest> createState() => _LayoutTestState();
}

class _LayoutTestState extends State<LayoutTest> {
  int currentPage = 0;
  List<Widget> screens = [const HomePage(), const CartPage(), const Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Appbar'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/notification');
                // // Navigator.of(context).push(
                // //   MaterialPageRoute(
                // //     builder: (context) => const NotificationPage(),
                // //   ),
                // // );

                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const NotificationPage()));
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      backgroundColor: Colors.teal,
      body: screens[currentPage],
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Hero(
                tag: 'profile',
                child: CircleAvatar(
                  radius: 80,
                  // backgroundImage: AssetImage('assets/profile.png'),
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                  ),
                ),
              ),
              // Container(
              //   width: 150,
              //   height: 150,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              //     ),
              //     shape: BoxShape.circle,
              //     color: Colors.red,
              //     // borderRadius: BorderRadius.circular(10000),
              //   ),
              // ),
              const Text(
                'App User',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 60,
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                subtitle: const Text("Go to your profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Settings'),
                subtitle: const Text("Go to your profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Logout'),
                subtitle: const Text("Go to your profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              // CustomButton(
              //   title: 'Login',
              //   onPressed: () {},
              // ),
              // CustomButton(
              //   onPressed: () {},
              //   title: 'Register',
              // ),
              // CustomButton(
              //   onPressed: () {},
              //   title: 'Logout',
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              print(value);
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
