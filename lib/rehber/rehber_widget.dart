import '../backend/backend.dart';
import '../components/sonuc_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../rehber_detail/rehber_detail_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class RehberWidget extends StatefulWidget {
  RehberWidget({Key key}) : super(key: key);

  @override
  _RehberWidgetState createState() => _RehberWidgetState();
}

class _RehberWidgetState extends State<RehberWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 108,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFEEEEEE),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<AydinKadinDogumRecord>>(
                                stream: queryAydinKadinDogumRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  List<AydinKadinDogumRecord>
                                      sonucAydinKadinDogumRecordList =
                                      snapshot.data;
                                  // Customize what your widget looks like with no query results.
                                  if (snapshot.data.isEmpty) {
                                    // return Container();
                                    // For now, we'll just include some dummy data.
                                    sonucAydinKadinDogumRecordList =
                                        createDummyAydinKadinDogumRecord(
                                            count: 1);
                                  }
                                  final sonucAydinKadinDogumRecord =
                                      sonucAydinKadinDogumRecordList.first;
                                  return InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          sonucAydinKadinDogumRecord.isim);
                                    },
                                    child: SonucWidget(),
                                  );
                                },
                              ),
                              Expanded(
                                child:
                                    StreamBuilder<List<AydinKadinDogumRecord>>(
                                  stream: queryAydinKadinDogumRecord(
                                    queryBuilder: (aydinKadinDogumRecord) =>
                                        aydinKadinDogumRecord.where('isim',
                                            isEqualTo: textController.text),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<AydinKadinDogumRecord>
                                        textFieldAydinKadinDogumRecordList =
                                        snapshot.data;
                                    // Customize what your widget looks like with no query results.
                                    if (snapshot.data.isEmpty) {
                                      // return Container();
                                      // For now, we'll just include some dummy data.
                                      textFieldAydinKadinDogumRecordList =
                                          createDummyAydinKadinDogumRecord(
                                              count: 1);
                                    }
                                    final textFieldAydinKadinDogumRecord =
                                        textFieldAydinKadinDogumRecordList
                                            .first;
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText:
                                              textFieldAydinKadinDogumRecord
                                                  .isim,
                                          labelStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF95A1AC),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF95A1AC),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment(0.95, 0),
                                  child: Icon(
                                    Icons.tune_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 24,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<AydinKadinDogumRecord>>(
                stream: queryAydinKadinDogumRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<AydinKadinDogumRecord>
                      listViewAydinKadinDogumRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    listViewAydinKadinDogumRecordList =
                        createDummyAydinKadinDogumRecord(count: 4);
                  }
                  return InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: RehberDetailWidget(),
                        ),
                      );
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAydinKadinDogumRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAydinKadinDogumRecord =
                            listViewAydinKadinDogumRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              listViewAydinKadinDogumRecord
                                                  .resimUrl,
                                          width: 74,
                                          height: 74,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 1, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listViewAydinKadinDogumRecord
                                                  .isim,
                                              style: FlutterFlowTheme.subtitle1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF15212B),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listViewAydinKadinDogumRecord
                                                  .brans,
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Poppins',
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listViewAydinKadinDogumRecord
                                                  .telefon,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Icon(
                                          Icons.chevron_right_outlined,
                                          color: Color(0xFF95A1AC),
                                          size: 24,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
