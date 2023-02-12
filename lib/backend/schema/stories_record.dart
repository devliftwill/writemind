import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stories_record.g.dart';

abstract class StoriesRecord
    implements Built<StoriesRecord, StoriesRecordBuilder> {
  static Serializer<StoriesRecord> get serializer => _$storiesRecordSerializer;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  String? get title;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  String? get cover;

  String? get audio;

  @BuiltValueField(wireName: 'is_ai_loading')
  bool? get isAiLoading;

  @BuiltValueField(wireName: 'background_audio_url')
  String? get backgroundAudioUrl;

  String? get status;

  @BuiltValueField(wireName: 'language_code')
  String? get languageCode;

  @BuiltValueField(wireName: 'ssml_gender')
  String? get ssmlGender;

  double? get progress;

  String? get text;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StoriesRecordBuilder builder) => builder
    ..title = ''
    ..cover = ''
    ..audio = ''
    ..isAiLoading = false
    ..backgroundAudioUrl = ''
    ..status = ''
    ..languageCode = ''
    ..ssmlGender = ''
    ..progress = 0.0
    ..text = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StoriesRecord._();
  factory StoriesRecord([void Function(StoriesRecordBuilder) updates]) =
      _$StoriesRecord;

  static StoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStoriesRecordData({
  DocumentReference? userRef,
  String? title,
  DateTime? createdDate,
  String? cover,
  String? audio,
  bool? isAiLoading,
  String? backgroundAudioUrl,
  String? status,
  String? languageCode,
  String? ssmlGender,
  double? progress,
  String? text,
}) {
  final firestoreData = serializers.toFirestore(
    StoriesRecord.serializer,
    StoriesRecord(
      (s) => s
        ..userRef = userRef
        ..title = title
        ..createdDate = createdDate
        ..cover = cover
        ..audio = audio
        ..isAiLoading = isAiLoading
        ..backgroundAudioUrl = backgroundAudioUrl
        ..status = status
        ..languageCode = languageCode
        ..ssmlGender = ssmlGender
        ..progress = progress
        ..text = text,
    ),
  );

  return firestoreData;
}
