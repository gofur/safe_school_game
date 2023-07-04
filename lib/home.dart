import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late ConnectivityResult _connectionStatus;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _showDialogConnectivity(result);
      });
    });
  }

  Future<void> initConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (!mounted) {
      return;
    }
    setState(() {
      _connectionStatus = connectivityResult;
    });
  }

  void _showDialogConnectivity(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      _dialogConnection(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _dialogConnection(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: const Text('No Internet'),
            content: const Text(
              'Periksa Jaringan Internet anda.',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: SafeArea(
        child: SizedBox(
           height: double.infinity,
          child: ListView(children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 80, bottom: 0.0),
              child: const AspectRatio(
                aspectRatio: 6 / 1,
                child: Image(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: CustomPaint(
                      painter: CurvePainter(),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 120.0),
                      )),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 120),
                      child: AutoSizeText(
                        "Selamat datang di permainan sekolah aman".toUpperCase(),
                        style: const TextStyle(
                            fontFamily: "Veneer",
                            color: Colors.white,
                            fontSize: 38.0,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100.0,
                      height: 4.0,
                      color: const Color(0xFFFAAF40),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: const AutoSizeText(
                        "Selamat Datang! \n\nYuk, jelajahi permainan seru untuk belajar mengenai Kesiapsiagaan Bencana. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Monserrat",
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/games'),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFAAF40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the value as needed
                          ),
                        ),
                        child: const SizedBox(
                          width: 180,
                          child: AutoSizeText(
                            "Pilih Permainan",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ],
            ),
            Container(
              color: const Color(0xFFE51C8B),
              child: const SizedBox(
                width: double.infinity,
              ),
            ),
     
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child:  Center(
                child: AutoSizeText(
                  "© 2023 Yayasan Plan International Indonesia",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "Monserrat",
                      decoration: TextDecoration.none,
                      color: Colors.white),
                ),
              ),
            ),
          
          ]),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFE51C8B);
    // create a path
    Path path = Path();
    path.moveTo(0, size.height * 50 * 50);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 180, size.width, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
