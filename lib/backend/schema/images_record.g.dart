// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImagesRecord> _$imagesRecordSerializer =
    new _$ImagesRecordSerializer();

class _$ImagesRecordSerializer implements StructuredSerializer<ImagesRecord> {
  @override
  final Iterable<Type> types = const [ImagesRecord, _$ImagesRecord];
  @override
  final String wireName = 'ImagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.startTime;
    if (value != null) {
      result
        ..add('start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.seconds;
    if (value != null) {
      result
        ..add('seconds')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ImagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'seconds':
          result.seconds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ImagesRecord extends ImagesRecord {
  @override
  final String? imageUrl;
  @override
  final String? text;
  @override
  final DateTime? createdDate;
  @override
  final double? startTime;
  @override
  final int? seconds;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ImagesRecord([void Function(ImagesRecordBuilder)? updates]) =>
      (new ImagesRecordBuilder()..update(updates))._build();

  _$ImagesRecord._(
      {this.imageUrl,
      this.text,
      this.createdDate,
      this.startTime,
      this.seconds,
      this.ffRef})
      : super._();

  @override
  ImagesRecord rebuild(void Function(ImagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImagesRecordBuilder toBuilder() => new ImagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImagesRecord &&
        imageUrl == other.imageUrl &&
        text == other.text &&
        createdDate == other.createdDate &&
        startTime == other.startTime &&
        seconds == other.seconds &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, imageUrl.hashCode), text.hashCode),
                    createdDate.hashCode),
                startTime.hashCode),
            seconds.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImagesRecord')
          ..add('imageUrl', imageUrl)
          ..add('text', text)
          ..add('createdDate', createdDate)
          ..add('startTime', startTime)
          ..add('seconds', seconds)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ImagesRecordBuilder
    implements Builder<ImagesRecord, ImagesRecordBuilder> {
  _$ImagesRecord? _$v;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  double? _startTime;
  double? get startTime => _$this._startTime;
  set startTime(double? startTime) => _$this._startTime = startTime;

  int? _seconds;
  int? get seconds => _$this._seconds;
  set seconds(int? seconds) => _$this._seconds = seconds;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ImagesRecordBuilder() {
    ImagesRecord._initializeBuilder(this);
  }

  ImagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _text = $v.text;
      _createdDate = $v.createdDate;
      _startTime = $v.startTime;
      _seconds = $v.seconds;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImagesRecord;
  }

  @override
  void update(void Function(ImagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImagesRecord build() => _build();

  _$ImagesRecord _build() {
    final _$result = _$v ??
        new _$ImagesRecord._(
            imageUrl: imageUrl,
            text: text,
            createdDate: createdDate,
            startTime: startTime,
            seconds: seconds,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
