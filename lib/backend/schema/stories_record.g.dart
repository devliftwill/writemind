// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoriesRecord> _$storiesRecordSerializer =
    new _$StoriesRecordSerializer();

class _$StoriesRecordSerializer implements StructuredSerializer<StoriesRecord> {
  @override
  final Iterable<Type> types = const [StoriesRecord, _$StoriesRecord];
  @override
  final String wireName = 'StoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cover;
    if (value != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audio;
    if (value != null) {
      result
        ..add('audio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isAiLoading;
    if (value != null) {
      result
        ..add('is_ai_loading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.backgroundAudioUrl;
    if (value != null) {
      result
        ..add('background_audio_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.languageCode;
    if (value != null) {
      result
        ..add('language_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ssmlGender;
    if (value != null) {
      result
        ..add('ssml_gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.progress;
    if (value != null) {
      result
        ..add('progress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  StoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'audio':
          result.audio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_ai_loading':
          result.isAiLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'background_audio_url':
          result.backgroundAudioUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language_code':
          result.languageCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ssml_gender':
          result.ssmlGender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'progress':
          result.progress = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$StoriesRecord extends StoriesRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? title;
  @override
  final DateTime? createdDate;
  @override
  final String? cover;
  @override
  final String? audio;
  @override
  final bool? isAiLoading;
  @override
  final String? backgroundAudioUrl;
  @override
  final String? status;
  @override
  final String? languageCode;
  @override
  final String? ssmlGender;
  @override
  final double? progress;
  @override
  final String? text;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StoriesRecord([void Function(StoriesRecordBuilder)? updates]) =>
      (new StoriesRecordBuilder()..update(updates))._build();

  _$StoriesRecord._(
      {this.userRef,
      this.title,
      this.createdDate,
      this.cover,
      this.audio,
      this.isAiLoading,
      this.backgroundAudioUrl,
      this.status,
      this.languageCode,
      this.ssmlGender,
      this.progress,
      this.text,
      this.ffRef})
      : super._();

  @override
  StoriesRecord rebuild(void Function(StoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoriesRecordBuilder toBuilder() => new StoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoriesRecord &&
        userRef == other.userRef &&
        title == other.title &&
        createdDate == other.createdDate &&
        cover == other.cover &&
        audio == other.audio &&
        isAiLoading == other.isAiLoading &&
        backgroundAudioUrl == other.backgroundAudioUrl &&
        status == other.status &&
        languageCode == other.languageCode &&
        ssmlGender == other.ssmlGender &&
        progress == other.progress &&
        text == other.text &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, userRef.hashCode),
                                                    title.hashCode),
                                                createdDate.hashCode),
                                            cover.hashCode),
                                        audio.hashCode),
                                    isAiLoading.hashCode),
                                backgroundAudioUrl.hashCode),
                            status.hashCode),
                        languageCode.hashCode),
                    ssmlGender.hashCode),
                progress.hashCode),
            text.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoriesRecord')
          ..add('userRef', userRef)
          ..add('title', title)
          ..add('createdDate', createdDate)
          ..add('cover', cover)
          ..add('audio', audio)
          ..add('isAiLoading', isAiLoading)
          ..add('backgroundAudioUrl', backgroundAudioUrl)
          ..add('status', status)
          ..add('languageCode', languageCode)
          ..add('ssmlGender', ssmlGender)
          ..add('progress', progress)
          ..add('text', text)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StoriesRecordBuilder
    implements Builder<StoriesRecord, StoriesRecordBuilder> {
  _$StoriesRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  String? _cover;
  String? get cover => _$this._cover;
  set cover(String? cover) => _$this._cover = cover;

  String? _audio;
  String? get audio => _$this._audio;
  set audio(String? audio) => _$this._audio = audio;

  bool? _isAiLoading;
  bool? get isAiLoading => _$this._isAiLoading;
  set isAiLoading(bool? isAiLoading) => _$this._isAiLoading = isAiLoading;

  String? _backgroundAudioUrl;
  String? get backgroundAudioUrl => _$this._backgroundAudioUrl;
  set backgroundAudioUrl(String? backgroundAudioUrl) =>
      _$this._backgroundAudioUrl = backgroundAudioUrl;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _languageCode;
  String? get languageCode => _$this._languageCode;
  set languageCode(String? languageCode) => _$this._languageCode = languageCode;

  String? _ssmlGender;
  String? get ssmlGender => _$this._ssmlGender;
  set ssmlGender(String? ssmlGender) => _$this._ssmlGender = ssmlGender;

  double? _progress;
  double? get progress => _$this._progress;
  set progress(double? progress) => _$this._progress = progress;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StoriesRecordBuilder() {
    StoriesRecord._initializeBuilder(this);
  }

  StoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _title = $v.title;
      _createdDate = $v.createdDate;
      _cover = $v.cover;
      _audio = $v.audio;
      _isAiLoading = $v.isAiLoading;
      _backgroundAudioUrl = $v.backgroundAudioUrl;
      _status = $v.status;
      _languageCode = $v.languageCode;
      _ssmlGender = $v.ssmlGender;
      _progress = $v.progress;
      _text = $v.text;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoriesRecord;
  }

  @override
  void update(void Function(StoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoriesRecord build() => _build();

  _$StoriesRecord _build() {
    final _$result = _$v ??
        new _$StoriesRecord._(
            userRef: userRef,
            title: title,
            createdDate: createdDate,
            cover: cover,
            audio: audio,
            isAiLoading: isAiLoading,
            backgroundAudioUrl: backgroundAudioUrl,
            status: status,
            languageCode: languageCode,
            ssmlGender: ssmlGender,
            progress: progress,
            text: text,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
