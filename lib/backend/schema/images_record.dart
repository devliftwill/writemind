import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'images_record.g.dart';

abstract class ImagesRecord
    implements Built<ImagesRecord, ImagesRecordBuilder> {
  static Serializer<ImagesRecord> get serializer => _$imagesRecordSerializer;

  @BuiltValueField(wireName: 'image_url')
  String? get imageUrl;

  String? get text;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'start_time')
  double? get startTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ImagesRecordBuilder builder) => builder
    ..imageUrl = ''
    ..text = ''
    ..startTime = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('images')
          : FirebaseFirestore.instance.collectionGroup('images');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('images').doc();

  static Stream<ImagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ImagesRecord._();
  factory ImagesRecord([void Function(ImagesRecordBuilder) updates]) =
      _$ImagesRecord;

  static ImagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createImagesRecordData({
  String? imageUrl,
  String? text,
  DateTime? createdDate,
  double? startTime,
}) {
  final firestoreData = serializers.toFirestore(
    ImagesRecord.serializer,
    ImagesRecord(
      (i) => i
        ..imageUrl = imageUrl
        ..text = text
        ..createdDate = createdDate
        ..startTime = startTime,
    ),
  );

  return firestoreData;
}
