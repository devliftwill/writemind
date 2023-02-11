// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_queue_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AudioQueueRecord> _$audioQueueRecordSerializer =
    new _$AudioQueueRecordSerializer();

class _$AudioQueueRecordSerializer
    implements StructuredSerializer<AudioQueueRecord> {
  @override
  final Iterable<Type> types = const [AudioQueueRecord, _$AudioQueueRecord];
  @override
  final String wireName = 'AudioQueueRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AudioQueueRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.storyRef;
    if (value != null) {
      result
        ..add('story_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
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
  AudioQueueRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AudioQueueRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'story_ref':
          result.storyRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
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

class _$AudioQueueRecord extends AudioQueueRecord {
  @override
  final DocumentReference<Object?>? storyRef;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AudioQueueRecord(
          [void Function(AudioQueueRecordBuilder)? updates]) =>
      (new AudioQueueRecordBuilder()..update(updates))._build();

  _$AudioQueueRecord._({this.storyRef, this.url, this.ffRef}) : super._();

  @override
  AudioQueueRecord rebuild(void Function(AudioQueueRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AudioQueueRecordBuilder toBuilder() =>
      new AudioQueueRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AudioQueueRecord &&
        storyRef == other.storyRef &&
        url == other.url &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, storyRef.hashCode), url.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AudioQueueRecord')
          ..add('storyRef', storyRef)
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AudioQueueRecordBuilder
    implements Builder<AudioQueueRecord, AudioQueueRecordBuilder> {
  _$AudioQueueRecord? _$v;

  DocumentReference<Object?>? _storyRef;
  DocumentReference<Object?>? get storyRef => _$this._storyRef;
  set storyRef(DocumentReference<Object?>? storyRef) =>
      _$this._storyRef = storyRef;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AudioQueueRecordBuilder() {
    AudioQueueRecord._initializeBuilder(this);
  }

  AudioQueueRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _storyRef = $v.storyRef;
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AudioQueueRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AudioQueueRecord;
  }

  @override
  void update(void Function(AudioQueueRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AudioQueueRecord build() => _build();

  _$AudioQueueRecord _build() {
    final _$result = _$v ??
        new _$AudioQueueRecord._(storyRef: storyRef, url: url, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
