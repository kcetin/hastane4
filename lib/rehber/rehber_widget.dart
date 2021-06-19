import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../rehber_detail/rehber_detail_widget.dart';
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
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
                border: Border.all(
                  color: Color(0xFFDBE2E7),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 34, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Rehber',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Poppins',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 10,
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
                                        onChanged: (_) => setState(() {}),
                                        controller: textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: textController.text,
                                          labelStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF82878C),
                                          ),
                                          hintText: textController.text,
                                          hintStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF95A1AC),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x004B39EF),
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
                                              color: Color(0x004B39EF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: textController
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () => setState(
                                                    () =>
                                                        textController.clear(),
                                                  ),
                                                  child: Icon(
                                                    Icons.clear,
                                                    size: 22,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF151B1E),
                                        ),
                                        textAlign: TextAlign.start,
                                        validator: (val) {
                                          if (val.isEmpty) {
                                            return 'Field is required';
                                          }
                                          if (val.length < 1) {
                                            return 'Requires at least 1 characters.';
                                          }
                                          return null;
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Icon(
                                Icons.tune_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
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
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAydinKadinDogumRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAydinKadinDogumRecord =
                          listViewAydinKadinDogumRecordList[listViewIndex];
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    border: Border.all(
                                      color: Color(0xFFC8CED5),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 8, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                listViewAydinKadinDogumRecord
                                                    .resimUrl,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
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
                                                  style: FlutterFlowTheme
                                                      .subtitle1
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 4, 4, 0),
                                                    child: Text(
                                                      listViewAydinKadinDogumRecord
                                                          .brans,
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                                reverseDuration:
                                                    Duration(milliseconds: 0),
                                                child: RehberDetailWidget(),
                                              ),
                                            );
                                            await launchURL(
                                                listViewIndex.toString());
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xFF82878C),
                                                size: 24,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
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
