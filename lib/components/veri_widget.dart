import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeriWidget extends StatefulWidget {
  VeriWidget({Key key}) : super(key: key);

  @override
  _VeriWidgetState createState() => _VeriWidgetState();
}

class _VeriWidgetState extends State<VeriWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://picsum.photos/seed/481/600',
              width: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
