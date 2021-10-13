import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/models/location.dart';
import 'package:rick_and_morty/src/ui/theme.dart';

class LocationWidget extends StatelessWidget {
  final Location? location;
  final bool isOrigin;

  const LocationWidget(this.location, {this.isOrigin = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    isOrigin ? 'ORIGIN' : 'LOCATION',
                    style: kDetailedName.copyWith(fontSize: 28),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Container(
                      width: 90,
                      child: Divider(
                          height: 15, color: Colors.white, thickness: 4)),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                'Name: ${location?.name == '' ? 'Unknown' : location?.name}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: kSmallDetailed,
                softWrap: true,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                'Dimension: ${location?.dimension == '' ? 'Unknown' : location?.dimension}',
                style: kSmallDetailed,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                'Type: ${location?.type == '' ? 'Unknown' : location?.type}',
                style: kSmallDetailed,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
