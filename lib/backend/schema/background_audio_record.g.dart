// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_audio_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BackgroundAudioRecord> _$backgroundAudioRecordSerializer =
    new _$BackgroundAudioRecordSerializer();

class _$BackgroundAudioRecordSerializer
    implements StructuredSerializer<BackgroundAudioRecord> {
  @override
  final Iterable<Type> types = const [
    BackgroundAudioRecord,
    _$BackgroundAudioRecord
  ];
  @override
  final String wireName = 'BackgroundAudioRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BackgroundAudioRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  BackgroundAudioRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BackgroundAudioRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$BackgroundAudioRecord extends BackgroundAudioRecord {
  @override
  final String? name;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BackgroundAudioRecord(
          [void Function(BackgroundAudioRecordBuilder)? updates]) =>
      (new BackgroundAudioRecordBuilder()..update(updates))._build();

  _$BackgroundAudioRecord._({this.name, this.url, this.ffRef}) : super._();

  @override
  BackgroundAudioRecord rebuild(
          void Function(BackgroundAudioRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BackgroundAudioRecordBuilder toBuilder() =>
      new BackgroundAudioRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BackgroundAudioRecord &&
        name == other.name &&
        url == other.url &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), url.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BackgroundAudioRecord')
          ..add('name', name)
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BackgroundAudioRecordBuilder
    implements Builder<BackgroundAudioRecord, BackgroundAudioRecordBuilder> {
  _$BackgroundAudioRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BackgroundAudioRecordBuilder() {
    BackgroundAudioRecord._initializeBuilder(this);
  }

  BackgroundAudioRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BackgroundAudioRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BackgroundAudioRecord;
  }

  @override
  void update(void Function(BackgroundAudioRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BackgroundAudioRecord build() => _build();

  _$BackgroundAudioRecord _build() {
    final _$result = _$v ??
        new _$BackgroundAudioRecord._(name: name, url: url, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
