import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

class DetailedStatusWidget extends StatelessWidget {
  final String status;

  const DetailedStatusWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FilterChip(
          onSelected: (a) {},
          label: Row(
            children: <Widget>[
              status == "Alive" ? kAliveAvatar : kDeadAvatar,
              SizedBox(width: 6),
              Text(
                status,
                style: kStatusTextStyle.copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
