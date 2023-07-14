import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safe_school_game/models/game.dart';
import 'package:safe_school_game/utils/custom_appbar.dart';
import 'package:safe_school_game/utils/footer.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInWebViewOrVC(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
  )) {
    throw Exception('Could not launch $url');
  }
}

class GameDetail extends StatefulWidget {
  final Game game;
  const GameDetail({Key? key, required this.game}) : super(key: key);

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

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
                  child: Stack(children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(14)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        widget.game.icon,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.game.title,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Monserrat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        widget.game.author,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Monserrat",
                                            fontSize: 16.0),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Uri url = Uri.parse(widget.game.url);
                                            _launchInWebViewOrVC(url);

                                          },
                                          child: Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Color(0xFFE51C8B),
                                            ),
                                            child: const AutoSizeText(
                                              "Main",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Monserrat",
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 16.0, right: 16.0),
                            child: Container(
                              color: Colors.grey,
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: widget.game.images.length,
                              pageSnapping: true,
                              itemBuilder: (context, index) {
                                return ItemImages(
                                    image: widget.game.images[index].images);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Text(
                              widget.game.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Monserrat",
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 16.0, left: 16.0, right: 16.0),
                            child: Container(
                              color: Colors.grey,
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tingkat Kesulitan",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Monserrat",
                                      fontSize: 14.0),
                                ),
                                RatingBarIndicator(
                                    rating: widget.game.difficult,
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               const Text(
                                  "Muatan Edukasi",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Monserrat",
                                      fontSize: 14.0),
                                ),
                                RatingBarIndicator(
                                    rating: widget.game.educationContent,
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        )),
                              ],
                            ),
                          ),  
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    const Footer()
                  ]),
                ))));
  }
}

class ItemImages extends StatelessWidget {
  final String image;
  const ItemImages({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
