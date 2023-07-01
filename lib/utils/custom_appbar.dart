import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight;

  const CustomAppBar({Key? key, this.preferredHeight = kToolbarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(preferredHeight),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color:  Color(0xFFE51C8B),), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor:
            Colors.white, // Replace with your desired background color
        centerTitle: true,
        elevation: 1.0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: const AspectRatio(
              aspectRatio: 8 / 1,
              child: Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                alignment: Alignment.bottomRight,
                width: 10,
                height: 10,
              ),
            ),
            ),),
      ),
    );
    ;
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
