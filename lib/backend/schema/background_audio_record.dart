import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'background_audio_record.g.dart';

abstract class BackgroundAudioRecord
    implements Built<BackgroundAudioRecord, BackgroundAudioRecordBuilder> {
  static Serializer<BackgroundAudioRecord> get serializer =>
      _$backgroundAudioRecordSerializer;

  String? get name;

  String? get url;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BackgroundAudioRecordBuilder builder) =>
      builder
        ..name = ''
        ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('background_audio');

  static Stream<BackgroundAudioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BackgroundAudioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BackgroundAudioRecord._();
  factory BackgroundAudioRecord(
          [void Function(BackgroundAudioRecordBuilder) updates]) =
      _$BackgroundAudioRecord;

  static BackgroundAudioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBackgroundAudioRecordData({
  String? name,
  String? url,
}) {
  final firestoreData = serializers.toFirestore(
    BackgroundAudioRecord.serializer,
    BackgroundAudioRecord(
      (b) => b
        ..name = name
        ..url = url,
    ),
  );

  return firestoreData;
}
