import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NobetciWidget extends StatefulWidget {
  NobetciWidget({Key key}) : super(key: key);

  @override
  _NobetciWidgetState createState() => _NobetciWidgetState();
}

class _NobetciWidgetState extends State<NobetciWidget> {
  List<AydinKadinDogumRecord> searchResults = [];
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
                          'Nöbetçi',
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
                              child: InkWell(
                                onTap: () async {
                                  setState(() => searchResults = null);
                                  await AydinKadinDogumRecord.search(
                                    term: textController.text,
                                    maxResults: 30,
                                  )
                                      .then((r) => searchResults = r)
                                      .onError((_, __) => searchResults = [])
                                      .whenComplete(() => setState(() {}));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: TextFormField(
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search for friends...',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF82878C),
                                    ),
                                    hintText: 'Find your friend by na',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x004B39EF),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x004B39EF),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF151B1E),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
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
            child: StreamBuilder<AydinKadinDogumRecord>(
              stream: AydinKadinDogumRecord.getDocument(
                  aydinKadinDogumItem.reference),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final listViewAydinKadinDogumRecord = snapshot.data;
                return Builder(
                  builder: (context) {
                    if (searchResults == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final aydinKadinDogum = searchResults?.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: aydinKadinDogum.length,
                      itemBuilder: (context, aydinKadinDogumIndex) {
                        final aydinKadinDogumItem =
                            aydinKadinDogum[aydinKadinDogumIndex];
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
                                                child: CachedNetworkImage(
                                                  imageUrl: aydinKadinDogumItem
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
                                                    aydinKadinDogumItem.isim,
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
                                                        aydinKadinDogumItem
                                                            .brans,
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              FlutterFlowTheme
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
