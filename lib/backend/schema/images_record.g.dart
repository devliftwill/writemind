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
    value = object.seconds;
    if (value != null) {
      result
        ..add('seconds')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.mask;
    if (value != null) {
      result
        ..add('mask')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isCover;
    if (value != null) {
      result
        ..add('is_cover')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
        case 'seconds':
          result.seconds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'mask':
          result.mask = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'is_cover':
          result.isCover = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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
  final int? seconds;
  @override
  final String? mask;
  @override
  final double? volume;
  @override
  final bool? isCover;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ImagesRecord([void Function(ImagesRecordBuilder)? updates]) =>
      (new ImagesRecordBuilder()..update(updates))._build();

  _$ImagesRecord._(
      {this.imageUrl,
      this.text,
      this.createdDate,
      this.seconds,
      this.mask,
      this.volume,
      this.isCover,
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
        seconds == other.seconds &&
        mask == other.mask &&
        volume == other.volume &&
        isCover == other.isCover &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, imageUrl.hashCode), text.hashCode),
                            createdDate.hashCode),
                        seconds.hashCode),
                    mask.hashCode),
                volume.hashCode),
            isCover.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImagesRecord')
          ..add('imageUrl', imageUrl)
          ..add('text', text)
          ..add('createdDate', createdDate)
          ..add('seconds', seconds)
          ..add('mask', mask)
          ..add('volume', volume)
          ..add('isCover', isCover)
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

  int? _seconds;
  int? get seconds => _$this._seconds;
  set seconds(int? seconds) => _$this._seconds = seconds;

  String? _mask;
  String? get mask => _$this._mask;
  set mask(String? mask) => _$this._mask = mask;

  double? _volume;
  double? get volume => _$this._volume;
  set volume(double? volume) => _$this._volume = volume;

  bool? _isCover;
  bool? get isCover => _$this._isCover;
  set isCover(bool? isCover) => _$this._isCover = isCover;

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
      _seconds = $v.seconds;
      _mask = $v.mask;
      _volume = $v.volume;
      _isCover = $v.isCover;
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
            seconds: seconds,
            mask: mask,
            volume: volume,
            isCover: isCover,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
