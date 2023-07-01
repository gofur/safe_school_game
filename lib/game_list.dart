import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:safe_school_game/utils/custom_appbar.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: SafeArea(
            child: Scaffold(
      appBar: const CustomAppBar(
        preferredHeight: 100,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color(0xFFE51C8B),
                  ),
                  child: AutoSizeText(
                    "Permainan Pilihan".toUpperCase(),
                    style: const TextStyle(
                        fontFamily: "Monserrat",
                        color: Colors.white,
                        fontSize: 24.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: AutoSizeText(
                  "Belajar Mengenali Bencana",
                  style: TextStyle(
                      fontFamily: "Monserrat",
                      color: Color(0xFF2D74B6),
                      fontSize: 24.0,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: AutoSizeText(
                  "Pelajari bencana melalui peta-peta yang menarik",
                  style: TextStyle(
                      fontFamily: "Monserrat",
                      color: Colors.black,
                      fontSize: 16.0,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
              const Horizontal(),
            ],
          ),
          Positioned(
              bottom: 0.0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      "© 2023 Yayasan Plan International Indonesia",
                      style: TextStyle(
                          fontFamily: "Monserrat",
                          color: Colors.black,
                          fontSize: 16.0,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  )))
        ]),
      ),
    )));
  }
}


List<String> kDemoImages = [
  'https://i.pinimg.com/originals/7f/91/a1/7f91a18bcfbc35570c82063da8575be8.jpg',
  'https://www.absolutearts.com/portfolio3/a/afifaridasiddique/Still_Life-1545967888l.jpg',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/53415/72138/1597120261997_IMG_20200811_095922__49127.1597493165.jpg?c=2',
  'https://i.pinimg.com/originals/47/7e/15/477e155db1f8f981c4abb6b2f0092836.jpg',
  'https://images.saatchiart.com/saatchi/770124/art/3760260/2830144-QFPTZRUH-7.jpg',
  'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c3RpbGwlMjBsaWZlfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/40895/55777/1526876829723_P211_24X36__2018_Stilllife_15000_20090__91926.1563511650.jpg?c=2',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIUsxpakPiqVF4W_rOlq6eoLYboOFoxw45qw&usqp=CAU',
  'https://images.mojarto.com/photos/267893/large/DA-SL-01.jpg?1560834975',
];


class Horizontal extends StatefulWidget {
  const Horizontal({Key? key}) : super(key: key);

  @override
  State<Horizontal> createState() => _HorizontalState();
}

class _HorizontalState extends State<Horizontal> {
  // Wheater to loop through elements
  bool _loop = true;

  // Scroll controller for carousel
  late InfiniteScrollController _controller;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  // Width of each item
  double? _itemExtent;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemExtent = screenWidth - 100;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: InfiniteCarousel.builder(
              itemCount: kDemoImages.length,
              itemExtent: _itemExtent ?? 40,
              scrollBehavior: kIsWeb
                  ? ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        // Allows to swipe in web browsers
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse
                      },
                    )
                  : null,
              loop: _loop,
              controller: _controller,
              onIndexChanged: (index) {
                if (_selectedIndex != index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              },
              itemBuilder: (context, itemIndex, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateToItem(realIndex);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: kElevationToShadow[2],
                        image: DecorationImage(
                          image: NetworkImage(kDemoImages[itemIndex]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Text('Current Index: $_selectedIndex'),
          // SwitchListTile(
          //   title: const Text('Loop'),
          //   value: _loop,
          //   onChanged: (newValue) {
          //     setState(() {
          //       _loop = newValue;
          //     });
          //   },
          // ),
          // const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     ElevatedButton.icon(
          //       label: const Text('Left'),
          //       icon: const Icon(Icons.arrow_left),
          //       onPressed: () {
          //         _controller.previousItem();
          //       },
          //     ),
          //     ElevatedButton.icon(
          //       label: const Text('Right'),
          //       icon: const Icon(Icons.arrow_right),
          //       onPressed: () {
          //         _controller.nextItem();
          //       },
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 30.0),
          // const Text('Adjustable Item Extent'),
          // Slider(
          //   min: 100.0,
          //   max: screenWidth - 100.0,
          //   value: _itemExtent ?? 40,
          //   onChanged: (newValue) {
          //     setState(() {
          //       _itemExtent = newValue;
          //     });
          //   },
          // ),
        ],
      );
  }
}