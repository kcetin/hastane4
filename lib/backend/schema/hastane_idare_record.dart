import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'hastane_idare_record.g.dart';

abstract class HastaneIdareRecord
    implements Built<HastaneIdareRecord, HastaneIdareRecordBuilder> {
  static Serializer<HastaneIdareRecord> get serializer =>
      _$hastaneIdareRecordSerializer;

  @nullable
  String get brans;

  @nullable
  String get email;

  @nullable
  int get id;

  @nullable
  String get idariGorev;

  @nullable
  String get isim;

  @nullable
  String get resimUrl;

  @nullable
  String get telefon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HastaneIdareRecordBuilder builder) => builder
    ..brans = ''
    ..email = ''
    ..id = 0
    ..idariGorev = ''
    ..isim = ''
    ..resimUrl = ''
    ..telefon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HastaneIdare');

  static Stream<HastaneIdareRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HastaneIdareRecord._();
  factory HastaneIdareRecord(
          [void Function(HastaneIdareRecordBuilder) updates]) =
      _$HastaneIdareRecord;
}

Map<String, dynamic> createHastaneIdareRecordData({
  String brans,
  String email,
  int id,
  String idariGorev,
  String isim,
  String resimUrl,
  String telefon,
}) =>
    serializers.toFirestore(
        HastaneIdareRecord.serializer,
        HastaneIdareRecord((h) => h
          ..brans = brans
          ..email = email
          ..id = id
          ..idariGorev = idariGorev
          ..isim = isim
          ..resimUrl = resimUrl
          ..telefon = telefon));

HastaneIdareRecord get dummyHastaneIdareRecord {
  final builder = HastaneIdareRecordBuilder()
    ..brans = dummyString
    ..email = dummyString
    ..id = dummyInteger
    ..idariGorev = dummyString
    ..isim = dummyString
    ..resimUrl = dummyImagePath
    ..telefon = dummyString;
  return builder.build();
}

List<HastaneIdareRecord> createDummyHastaneIdareRecord({int count}) =>
    List.generate(count, (_) => dummyHastaneIdareRecord);
