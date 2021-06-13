import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SonucWidget extends StatefulWidget {
  SonucWidget({Key key}) : super(key: key);

  @override
  _SonucWidgetState createState() => _SonucWidgetState();
}

class _SonucWidgetState extends State<SonucWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: InkWell(
        onTap: () async {
          await launchURL('\$.id');
        },
        child: Icon(
          Icons.search_rounded,
          color: Color(0xFF95A1AC),
          size: 24,
        ),
      ),
    );
  }
}
