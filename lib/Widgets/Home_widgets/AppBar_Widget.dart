import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          'STYLEWISE',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
        )
      ],
      backgroundColor: Color(0xff203f81),
      elevation: 0,
    );
  }
}
