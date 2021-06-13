import '../backend/backend.dart';
import '../components/branss_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class IsimWidget extends StatefulWidget {
  IsimWidget({Key key}) : super(key: key);

  @override
  _IsimWidgetState createState() => _IsimWidgetState();
}

class _IsimWidgetState extends State<IsimWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AydinKadinDogumRecord>>(
      stream: queryAydinKadinDogumRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<AydinKadinDogumRecord> stackAydinKadinDogumRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          stackAydinKadinDogumRecordList =
              createDummyAydinKadinDogumRecord(count: 4);
        }
        return Stack(
          children: List.generate(stackAydinKadinDogumRecordList.length,
              (stackIndex) {
            final stackAydinKadinDogumRecord =
                stackAydinKadinDogumRecordList[stackIndex];
            return BranssWidget();
          }),
        );
      },
    );
  }
}
