import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherRow extends StatelessWidget {
  final String header;
  final String key1;
  final String key2;
  final String value1;
  final String value2;

  final TextStyle keyValueStyle = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  WeatherRow({this.header, this.key1, this.key2, this.value1, this.value2});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Text(
          header,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(key1 + ": " + value1, style: keyValueStyle),
            SizedBox(
              width: 50,
            ),
            Text('|', style: keyValueStyle),
            SizedBox(
              width: 50,
            ),
            Text(
              key2 + ": " + value2,
              style: keyValueStyle,
            ),
          ],
        ),
      ],
    );
  }
}
