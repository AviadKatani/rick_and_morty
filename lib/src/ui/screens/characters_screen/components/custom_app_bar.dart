import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  CustomAppBar() : preferredSize = Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      centerTitle: true,
      title: Text(
        'Rick and Morty',
        style: kAppBarTextStyle,
      ),
    );
  }
}
