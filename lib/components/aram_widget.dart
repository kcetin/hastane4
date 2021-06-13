import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class AramWidget extends StatefulWidget {
  AramWidget({
    Key key,
    this.ara,
  }) : super(key: key);

  final DocumentReference ara;

  @override
  _AramWidgetState createState() => _AramWidgetState();
}

class _AramWidgetState extends State<AramWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Icon(
        Icons.search_rounded,
        color: Color(0xFF95A1AC),
        size: 24,
      ),
    );
  }
}
