// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileX {
  FileXType? get fileXType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, FileXType? fileXType) netWork,
    required TResult Function(File file, FileXType? fileXType) file,
    required TResult Function(String path, FileXType? fileXType) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, FileXType? fileXType)? netWork,
    TResult? Function(File file, FileXType? fileXType)? file,
    TResult? Function(String path, FileXType? fileXType)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, FileXType? fileXType)? netWork,
    TResult Function(File file, FileXType? fileXType)? file,
    TResult Function(String path, FileXType? fileXType)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFileX value) netWork,
    required TResult Function(LocalFileFileX value) file,
    required TResult Function(LocalPathFileX value) path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetWorkFileX value)? netWork,
    TResult? Function(LocalFileFileX value)? file,
    TResult? Function(LocalPathFileX value)? path,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFileX value)? netWork,
    TResult Function(LocalFileFileX value)? file,
    TResult Function(LocalPathFileX value)? path,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileXCopyWith<FileX> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileXCopyWith<$Res> {
  factory $FileXCopyWith(FileX value, $Res Function(FileX) then) =
      _$FileXCopyWithImpl<$Res, FileX>;
  @useResult
  $Res call({FileXType? fileXType});
}

/// @nodoc
class _$FileXCopyWithImpl<$Res, $Val extends FileX>
    implements $FileXCopyWith<$Res> {
  _$FileXCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileXType = freezed,
  }) {
    return _then(_value.copyWith(
      fileXType: freezed == fileXType
          ? _value.fileXType
          : fileXType // ignore: cast_nullable_to_non_nullable
              as FileXType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetWorkFileXCopyWith<$Res> implements $FileXCopyWith<$Res> {
  factory _$$NetWorkFileXCopyWith(
          _$NetWorkFileX value, $Res Function(_$NetWorkFileX) then) =
      __$$NetWorkFileXCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, FileXType? fileXType});
}

/// @nodoc
class __$$NetWorkFileXCopyWithImpl<$Res>
    extends _$FileXCopyWithImpl<$Res, _$NetWorkFileX>
    implements _$$NetWorkFileXCopyWith<$Res> {
  __$$NetWorkFileXCopyWithImpl(
      _$NetWorkFileX _value, $Res Function(_$NetWorkFileX) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileXType = freezed,
  }) {
    return _then(_$NetWorkFileX(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileXType: freezed == fileXType
          ? _value.fileXType
          : fileXType // ignore: cast_nullable_to_non_nullable
              as FileXType?,
    ));
  }
}

/// @nodoc

class _$NetWorkFileX extends NetWorkFileX {
  _$NetWorkFileX({required this.url, this.fileXType}) : super._();

  @override
  final String url;
  @override
  final FileXType? fileXType;

  @override
  String toString() {
    return 'FileX.netWork(url: $url, fileXType: $fileXType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetWorkFileX &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileXType, fileXType) ||
                other.fileXType == fileXType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, fileXType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetWorkFileXCopyWith<_$NetWorkFileX> get copyWith =>
      __$$NetWorkFileXCopyWithImpl<_$NetWorkFileX>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, FileXType? fileXType) netWork,
    required TResult Function(File file, FileXType? fileXType) file,
    required TResult Function(String path, FileXType? fileXType) path,
  }) {
    return netWork(url, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, FileXType? fileXType)? netWork,
    TResult? Function(File file, FileXType? fileXType)? file,
    TResult? Function(String path, FileXType? fileXType)? path,
  }) {
    return netWork?.call(url, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, FileXType? fileXType)? netWork,
    TResult Function(File file, FileXType? fileXType)? file,
    TResult Function(String path, FileXType? fileXType)? path,
    required TResult orElse(),
  }) {
    if (netWork != null) {
      return netWork(url, fileXType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFileX value) netWork,
    required TResult Function(LocalFileFileX value) file,
    required TResult Function(LocalPathFileX value) path,
  }) {
    return netWork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetWorkFileX value)? netWork,
    TResult? Function(LocalFileFileX value)? file,
    TResult? Function(LocalPathFileX value)? path,
  }) {
    return netWork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFileX value)? netWork,
    TResult Function(LocalFileFileX value)? file,
    TResult Function(LocalPathFileX value)? path,
    required TResult orElse(),
  }) {
    if (netWork != null) {
      return netWork(this);
    }
    return orElse();
  }
}

abstract class NetWorkFileX extends FileX {
  factory NetWorkFileX(
      {required final String url, final FileXType? fileXType}) = _$NetWorkFileX;
  NetWorkFileX._() : super._();

  String get url;
  @override
  FileXType? get fileXType;
  @override
  @JsonKey(ignore: true)
  _$$NetWorkFileXCopyWith<_$NetWorkFileX> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalFileFileXCopyWith<$Res> implements $FileXCopyWith<$Res> {
  factory _$$LocalFileFileXCopyWith(
          _$LocalFileFileX value, $Res Function(_$LocalFileFileX) then) =
      __$$LocalFileFileXCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file, FileXType? fileXType});
}

/// @nodoc
class __$$LocalFileFileXCopyWithImpl<$Res>
    extends _$FileXCopyWithImpl<$Res, _$LocalFileFileX>
    implements _$$LocalFileFileXCopyWith<$Res> {
  __$$LocalFileFileXCopyWithImpl(
      _$LocalFileFileX _value, $Res Function(_$LocalFileFileX) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? fileXType = freezed,
  }) {
    return _then(_$LocalFileFileX(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      fileXType: freezed == fileXType
          ? _value.fileXType
          : fileXType // ignore: cast_nullable_to_non_nullable
              as FileXType?,
    ));
  }
}

/// @nodoc

class _$LocalFileFileX extends LocalFileFileX {
  _$LocalFileFileX({required this.file, this.fileXType}) : super._();

  @override
  final File file;
  @override
  final FileXType? fileXType;

  @override
  String toString() {
    return 'FileX.file(file: $file, fileXType: $fileXType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalFileFileX &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileXType, fileXType) ||
                other.fileXType == fileXType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, fileXType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalFileFileXCopyWith<_$LocalFileFileX> get copyWith =>
      __$$LocalFileFileXCopyWithImpl<_$LocalFileFileX>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, FileXType? fileXType) netWork,
    required TResult Function(File file, FileXType? fileXType) file,
    required TResult Function(String path, FileXType? fileXType) path,
  }) {
    return file(this.file, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, FileXType? fileXType)? netWork,
    TResult? Function(File file, FileXType? fileXType)? file,
    TResult? Function(String path, FileXType? fileXType)? path,
  }) {
    return file?.call(this.file, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, FileXType? fileXType)? netWork,
    TResult Function(File file, FileXType? fileXType)? file,
    TResult Function(String path, FileXType? fileXType)? path,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this.file, fileXType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFileX value) netWork,
    required TResult Function(LocalFileFileX value) file,
    required TResult Function(LocalPathFileX value) path,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetWorkFileX value)? netWork,
    TResult? Function(LocalFileFileX value)? file,
    TResult? Function(LocalPathFileX value)? path,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFileX value)? netWork,
    TResult Function(LocalFileFileX value)? file,
    TResult Function(LocalPathFileX value)? path,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class LocalFileFileX extends FileX {
  factory LocalFileFileX(
      {required final File file,
      final FileXType? fileXType}) = _$LocalFileFileX;
  LocalFileFileX._() : super._();

  File get file;
  @override
  FileXType? get fileXType;
  @override
  @JsonKey(ignore: true)
  _$$LocalFileFileXCopyWith<_$LocalFileFileX> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalPathFileXCopyWith<$Res> implements $FileXCopyWith<$Res> {
  factory _$$LocalPathFileXCopyWith(
          _$LocalPathFileX value, $Res Function(_$LocalPathFileX) then) =
      __$$LocalPathFileXCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, FileXType? fileXType});
}

/// @nodoc
class __$$LocalPathFileXCopyWithImpl<$Res>
    extends _$FileXCopyWithImpl<$Res, _$LocalPathFileX>
    implements _$$LocalPathFileXCopyWith<$Res> {
  __$$LocalPathFileXCopyWithImpl(
      _$LocalPathFileX _value, $Res Function(_$LocalPathFileX) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? fileXType = freezed,
  }) {
    return _then(_$LocalPathFileX(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      fileXType: freezed == fileXType
          ? _value.fileXType
          : fileXType // ignore: cast_nullable_to_non_nullable
              as FileXType?,
    ));
  }
}

/// @nodoc

class _$LocalPathFileX extends LocalPathFileX {
  _$LocalPathFileX({required this.path, this.fileXType}) : super._();

  @override
  final String path;
  @override
  final FileXType? fileXType;

  @override
  String toString() {
    return 'FileX.path(path: $path, fileXType: $fileXType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalPathFileX &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.fileXType, fileXType) ||
                other.fileXType == fileXType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, fileXType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalPathFileXCopyWith<_$LocalPathFileX> get copyWith =>
      __$$LocalPathFileXCopyWithImpl<_$LocalPathFileX>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, FileXType? fileXType) netWork,
    required TResult Function(File file, FileXType? fileXType) file,
    required TResult Function(String path, FileXType? fileXType) path,
  }) {
    return path(this.path, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, FileXType? fileXType)? netWork,
    TResult? Function(File file, FileXType? fileXType)? file,
    TResult? Function(String path, FileXType? fileXType)? path,
  }) {
    return path?.call(this.path, fileXType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, FileXType? fileXType)? netWork,
    TResult Function(File file, FileXType? fileXType)? file,
    TResult Function(String path, FileXType? fileXType)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(this.path, fileXType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFileX value) netWork,
    required TResult Function(LocalFileFileX value) file,
    required TResult Function(LocalPathFileX value) path,
  }) {
    return path(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetWorkFileX value)? netWork,
    TResult? Function(LocalFileFileX value)? file,
    TResult? Function(LocalPathFileX value)? path,
  }) {
    return path?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFileX value)? netWork,
    TResult Function(LocalFileFileX value)? file,
    TResult Function(LocalPathFileX value)? path,
    required TResult orElse(),
  }) {
    if (path != null) {
      return path(this);
    }
    return orElse();
  }
}

abstract class LocalPathFileX extends FileX {
  factory LocalPathFileX(
      {required final String path,
      final FileXType? fileXType}) = _$LocalPathFileX;
  LocalPathFileX._() : super._();

  String get path;
  @override
  FileXType? get fileXType;
  @override
  @JsonKey(ignore: true)
  _$$LocalPathFileXCopyWith<_$LocalPathFileX> get copyWith =>
      throw _privateConstructorUsedError;
}
