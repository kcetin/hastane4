import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnasayfaDetailWidget extends StatefulWidget {
  AnasayfaDetailWidget({Key key}) : super(key: key);

  @override
  _AnasayfaDetailWidgetState createState() => _AnasayfaDetailWidgetState();
}

class _AnasayfaDetailWidgetState extends State<AnasayfaDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Text(
          'anasayfa ayrıntı',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
