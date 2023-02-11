// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
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
    value = object.senderRef;
    if (value != null) {
      result
        ..add('sender_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.convertToAudio;
    if (value != null) {
      result
        ..add('convert_to_audio')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isAi;
    if (value != null) {
      result
        ..add('is_ai')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.generateBackgroundMusic;
    if (value != null) {
      result
        ..add('generate_background_music')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.backgroundMusicPrompt;
    if (value != null) {
      result
        ..add('background_music_prompt')
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'sender_ref':
          result.senderRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'convert_to_audio':
          result.convertToAudio = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_ai':
          result.isAi = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'language_code':
          result.languageCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ssml_gender':
          result.ssmlGender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'generate_background_music':
          result.generateBackgroundMusic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'background_music_prompt':
          result.backgroundMusicPrompt = serializers.deserialize(value,
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final String? text;
  @override
  final DateTime? createdDate;
  @override
  final DocumentReference<Object?>? senderRef;
  @override
  final bool? convertToAudio;
  @override
  final bool? isAi;
  @override
  final String? languageCode;
  @override
  final String? ssmlGender;
  @override
  final bool? generateBackgroundMusic;
  @override
  final String? backgroundMusicPrompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder)? updates]) =>
      (new MessagesRecordBuilder()..update(updates))._build();

  _$MessagesRecord._(
      {this.text,
      this.createdDate,
      this.senderRef,
      this.convertToAudio,
      this.isAi,
      this.languageCode,
      this.ssmlGender,
      this.generateBackgroundMusic,
      this.backgroundMusicPrompt,
      this.ffRef})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        text == other.text &&
        createdDate == other.createdDate &&
        senderRef == other.senderRef &&
        convertToAudio == other.convertToAudio &&
        isAi == other.isAi &&
        languageCode == other.languageCode &&
        ssmlGender == other.ssmlGender &&
        generateBackgroundMusic == other.generateBackgroundMusic &&
        backgroundMusicPrompt == other.backgroundMusicPrompt &&
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
                                    $jc($jc(0, text.hashCode),
                                        createdDate.hashCode),
                                    senderRef.hashCode),
                                convertToAudio.hashCode),
                            isAi.hashCode),
                        languageCode.hashCode),
                    ssmlGender.hashCode),
                generateBackgroundMusic.hashCode),
            backgroundMusicPrompt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessagesRecord')
          ..add('text', text)
          ..add('createdDate', createdDate)
          ..add('senderRef', senderRef)
          ..add('convertToAudio', convertToAudio)
          ..add('isAi', isAi)
          ..add('languageCode', languageCode)
          ..add('ssmlGender', ssmlGender)
          ..add('generateBackgroundMusic', generateBackgroundMusic)
          ..add('backgroundMusicPrompt', backgroundMusicPrompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object?>? _senderRef;
  DocumentReference<Object?>? get senderRef => _$this._senderRef;
  set senderRef(DocumentReference<Object?>? senderRef) =>
      _$this._senderRef = senderRef;

  bool? _convertToAudio;
  bool? get convertToAudio => _$this._convertToAudio;
  set convertToAudio(bool? convertToAudio) =>
      _$this._convertToAudio = convertToAudio;

  bool? _isAi;
  bool? get isAi => _$this._isAi;
  set isAi(bool? isAi) => _$this._isAi = isAi;

  String? _languageCode;
  String? get languageCode => _$this._languageCode;
  set languageCode(String? languageCode) => _$this._languageCode = languageCode;

  String? _ssmlGender;
  String? get ssmlGender => _$this._ssmlGender;
  set ssmlGender(String? ssmlGender) => _$this._ssmlGender = ssmlGender;

  bool? _generateBackgroundMusic;
  bool? get generateBackgroundMusic => _$this._generateBackgroundMusic;
  set generateBackgroundMusic(bool? generateBackgroundMusic) =>
      _$this._generateBackgroundMusic = generateBackgroundMusic;

  String? _backgroundMusicPrompt;
  String? get backgroundMusicPrompt => _$this._backgroundMusicPrompt;
  set backgroundMusicPrompt(String? backgroundMusicPrompt) =>
      _$this._backgroundMusicPrompt = backgroundMusicPrompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _createdDate = $v.createdDate;
      _senderRef = $v.senderRef;
      _convertToAudio = $v.convertToAudio;
      _isAi = $v.isAi;
      _languageCode = $v.languageCode;
      _ssmlGender = $v.ssmlGender;
      _generateBackgroundMusic = $v.generateBackgroundMusic;
      _backgroundMusicPrompt = $v.backgroundMusicPrompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessagesRecord build() => _build();

  _$MessagesRecord _build() {
    final _$result = _$v ??
        new _$MessagesRecord._(
            text: text,
            createdDate: createdDate,
            senderRef: senderRef,
            convertToAudio: convertToAudio,
            isAi: isAi,
            languageCode: languageCode,
            ssmlGender: ssmlGender,
            generateBackgroundMusic: generateBackgroundMusic,
            backgroundMusicPrompt: backgroundMusicPrompt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
