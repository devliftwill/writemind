import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'video_exports_record.g.dart';

abstract class VideoExportsRecord
    implements Built<VideoExportsRecord, VideoExportsRecordBuilder> {
  static Serializer<VideoExportsRecord> get serializer =>
      _$videoExportsRecordSerializer;

  @BuiltValueField(wireName: 'story_ref')
  DocumentReference? get storyRef;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  String? get video;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VideoExportsRecordBuilder builder) => builder
    ..video = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_exports');

  static Stream<VideoExportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VideoExportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VideoExportsRecord._();
  factory VideoExportsRecord(
          [void Function(VideoExportsRecordBuilder) updates]) =
      _$VideoExportsRecord;

  static VideoExportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVideoExportsRecordData({
  DocumentReference? storyRef,
  DocumentReference? userRef,
  String? video,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    VideoExportsRecord.serializer,
    VideoExportsRecord(
      (v) => v
        ..storyRef = storyRef
        ..userRef = userRef
        ..video = video
        ..status = status,
    ),
  );

  return firestoreData;
}
