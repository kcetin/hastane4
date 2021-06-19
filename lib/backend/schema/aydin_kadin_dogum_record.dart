import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong/latlong.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'aydin_kadin_dogum_record.g.dart';

abstract class AydinKadinDogumRecord
    implements Built<AydinKadinDogumRecord, AydinKadinDogumRecordBuilder> {
  static Serializer<AydinKadinDogumRecord> get serializer =>
      _$aydinKadinDogumRecordSerializer;

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

  static void _initializeBuilder(AydinKadinDogumRecordBuilder builder) =>
      builder
        ..brans = ''
        ..email = ''
        ..id = 0
        ..idariGorev = ''
        ..isim = ''
        ..resimUrl = ''
        ..telefon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AydinKadinDogum');

  static Stream<AydinKadinDogumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static AydinKadinDogumRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AydinKadinDogumRecord(
        (c) => c
          ..brans = snapshot.data['brans']
          ..email = snapshot.data['email']
          ..id = snapshot.data['id']
          ..idariGorev = snapshot.data['idariGorev']
          ..isim = snapshot.data['isim']
          ..resimUrl = snapshot.data['resimUrl']
          ..telefon = snapshot.data['telefon']
          ..reference = AydinKadinDogumRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AydinKadinDogumRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'AydinKadinDogum',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AydinKadinDogumRecord._();
  factory AydinKadinDogumRecord(
          [void Function(AydinKadinDogumRecordBuilder) updates]) =
      _$AydinKadinDogumRecord;

  static AydinKadinDogumRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createAydinKadinDogumRecordData({
  String brans,
  String email,
  int id,
  String idariGorev,
  String isim,
  String resimUrl,
  String telefon,
}) =>
    serializers.toFirestore(
        AydinKadinDogumRecord.serializer,
        AydinKadinDogumRecord((a) => a
          ..brans = brans
          ..email = email
          ..id = id
          ..idariGorev = idariGorev
          ..isim = isim
          ..resimUrl = resimUrl
          ..telefon = telefon));

AydinKadinDogumRecord get dummyAydinKadinDogumRecord {
  final builder = AydinKadinDogumRecordBuilder()
    ..brans = dummyString
    ..email = dummyString
    ..id = dummyInteger
    ..idariGorev = dummyString
    ..isim = dummyString
    ..resimUrl = dummyImagePath
    ..telefon = dummyString;
  return builder.build();
}

List<AydinKadinDogumRecord> createDummyAydinKadinDogumRecord({int count}) =>
    List.generate(count, (_) => dummyAydinKadinDogumRecord);
