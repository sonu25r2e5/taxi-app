import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math';
import 'chatgpt/chat_gpt_boatbox.dart';
import 'climate Changes/climate_changes.dart';

class HomePage extends StatefulWidget {
  static const String idScreen = "HomeScreen";
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textmovable = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future<bool?> checkAppInstalled() async {
    await LaunchApp.isAppInstalled(
        androidPackageName: 'com.DefaultCompany.ARClimateChange');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: Container(
          color: Colors.white,
          width: 365.0,
          child: Drawer(
            child: ListView(
              children: [
                SizedBox(
                  height: 165.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.white30,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tom3.svg',
                            height: 100.0,
                            width: 65.0,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Profile name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik Bubbles",
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                'Visit us any time baby',
                                style: TextStyle(fontSize: 9),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const ListTile(
                  leading: Icon(Icons.history),
                  title: Text(
                    "History",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Visit Profile",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            // Hamburger button for drawer
            Positioned(
              top: 0.1,
              // height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/Dallle.jpg'),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 45.0,
              right: 22.0,
              child: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          spreadRadius: 0.6,
                          offset: Offset(0.7, 0.7),
                        )
                      ]),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 120.0,
              right: 22.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const ClimateChange();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          spreadRadius: 0.6,
                          offset: Offset(0.7, 0.7),
                        )
                      ]),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.info),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 45.0,
            //   left: 22.0,
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(22.0),
            //         boxShadow: const [
            //           BoxShadow(
            //             color: Colors.black,
            //             blurRadius: 6.0,
            //             spreadRadius: 0.6,
            //             offset: Offset(0.7, 0.7),
            //           )
            //         ]),
            //     child: CircleAvatar(
            //       backgroundColor: Colors.white,
            //       child: SvgPicture.asset(
            //         'assets/images/tom3.svg',
            //         height: 100.0,
            //         width: 65.0,
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              top: 50.0,
              left: 20.0,
              child: GestureDetector(
                onTap: null,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          spreadRadius: 0.6,
                          offset: Offset(0.7, 0.7),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(30),
                          ),
                          color: Color.fromARGB(255, 68, 211, 255),
                        ),
                        child: const IconButton(
                          icon: Text(
                            'en',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: null,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(1),
                        child: const IconButton(
                          icon: Text('np'),
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 33, 212, 243)
                        .withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 12.0,
                        spreadRadius: 0.6,
                        offset: Offset(0.9, 0.9),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6.0,
                      ),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),

                      // change text to nepali
                      const SizedBox(
                        height: 20,
                      ),
                      // const Text(
                      //   "Search For your plant, Medicine, Fertilizer ",
                      //   style: TextStyle(
                      //     fontSize: 20.0,
                      //     fontFamily: 'Rubik Bubbles',
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.black54,
                          //     blurRadius: 3.0,
                          //     spreadRadius: 0.4,
                          //     offset: Offset(0.5, 0.5),
                          //   ),
                          // ],
                        ),
                        child: TextField(
                          onSubmitted: (value) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const ChatScreen();
                            }));
                          },
                          controller: _textmovable,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(25.0),
                              //     borderSide:
                              //         const BorderSide(color: Colors.blueGrey)),
                              hintText: 'Search....'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await LaunchApp.openApp(
              androidPackageName: 'com.DefaultCompany.ARClimateChange',
              openStore: false,
            );
          },
          child: const Icon(Icons.camera),
        ),
        floatingActionButtonLocation:
            FixedCenterDockedFabLocation(context: context),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin:
              5, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.chat_bubble,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ChatScreen();
                  }));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.transcribe_sharp,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.print,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

class FixedCenterDockedFabLocation extends FloatingActionButtonLocation {
  const FixedCenterDockedFabLocation({
    this.context,
  });
  final context;

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;
    double bottomDistance = MediaQuery.of(context).viewInsets.bottom;

    double fabY = contentBottom + bottomDistance - fabHeight / 2.0;

    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0) {
      fabY = min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    }
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0) {
      fabY = min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);
    }

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return min(maxFabY, fabY);
  }

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }
}
