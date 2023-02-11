import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'audio_queue_record.g.dart';

abstract class AudioQueueRecord
    implements Built<AudioQueueRecord, AudioQueueRecordBuilder> {
  static Serializer<AudioQueueRecord> get serializer =>
      _$audioQueueRecordSerializer;

  @BuiltValueField(wireName: 'story_ref')
  DocumentReference? get storyRef;

  String? get url;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AudioQueueRecordBuilder builder) =>
      builder..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audio_queue');

  static Stream<AudioQueueRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AudioQueueRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AudioQueueRecord._();
  factory AudioQueueRecord([void Function(AudioQueueRecordBuilder) updates]) =
      _$AudioQueueRecord;

  static AudioQueueRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAudioQueueRecordData({
  DocumentReference? storyRef,
  String? url,
}) {
  final firestoreData = serializers.toFirestore(
    AudioQueueRecord.serializer,
    AudioQueueRecord(
      (a) => a
        ..storyRef = storyRef
        ..url = url,
    ),
  );

  return firestoreData;
}
