// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_exports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoExportsRecord> _$videoExportsRecordSerializer =
    new _$VideoExportsRecordSerializer();

class _$VideoExportsRecordSerializer
    implements StructuredSerializer<VideoExportsRecord> {
  @override
  final Iterable<Type> types = const [VideoExportsRecord, _$VideoExportsRecord];
  @override
  final String wireName = 'VideoExportsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VideoExportsRecord object,
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
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
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
  VideoExportsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoExportsRecordBuilder();

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
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$VideoExportsRecord extends VideoExportsRecord {
  @override
  final DocumentReference<Object?>? storyRef;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? video;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VideoExportsRecord(
          [void Function(VideoExportsRecordBuilder)? updates]) =>
      (new VideoExportsRecordBuilder()..update(updates))._build();

  _$VideoExportsRecord._(
      {this.storyRef, this.userRef, this.video, this.status, this.ffRef})
      : super._();

  @override
  VideoExportsRecord rebuild(
          void Function(VideoExportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoExportsRecordBuilder toBuilder() =>
      new VideoExportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoExportsRecord &&
        storyRef == other.storyRef &&
        userRef == other.userRef &&
        video == other.video &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, storyRef.hashCode), userRef.hashCode),
                video.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoExportsRecord')
          ..add('storyRef', storyRef)
          ..add('userRef', userRef)
          ..add('video', video)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VideoExportsRecordBuilder
    implements Builder<VideoExportsRecord, VideoExportsRecordBuilder> {
  _$VideoExportsRecord? _$v;

  DocumentReference<Object?>? _storyRef;
  DocumentReference<Object?>? get storyRef => _$this._storyRef;
  set storyRef(DocumentReference<Object?>? storyRef) =>
      _$this._storyRef = storyRef;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VideoExportsRecordBuilder() {
    VideoExportsRecord._initializeBuilder(this);
  }

  VideoExportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _storyRef = $v.storyRef;
      _userRef = $v.userRef;
      _video = $v.video;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoExportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VideoExportsRecord;
  }

  @override
  void update(void Function(VideoExportsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoExportsRecord build() => _build();

  _$VideoExportsRecord _build() {
    final _$result = _$v ??
        new _$VideoExportsRecord._(
            storyRef: storyRef,
            userRef: userRef,
            video: video,
            status: status,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
