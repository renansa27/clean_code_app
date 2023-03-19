// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements StructuredSerializer<AuthState> {
  @override
  final Iterable<Type> types = const [AuthState, _$AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hasSentMagicLink',
      serializers.serialize(object.hasSentMagicLink,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.isLoading;
    if (value != null) {
      result
        ..add('isLoading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.successfullyReset;
    if (value != null) {
      result
        ..add('successfullyReset')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'successfullyReset':
          result.successfullyReset = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hasSentMagicLink':
          result.hasSentMagicLink = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthState extends AuthState {
  @override
  final bool? isLoading;
  @override
  final bool? successfullyReset;
  @override
  final User? user;
  @override
  final String? email;
  @override
  final String? error;
  @override
  final bool hasSentMagicLink;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {this.isLoading,
      this.successfullyReset,
      this.user,
      this.email,
      this.error,
      required this.hasSentMagicLink})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        hasSentMagicLink, r'AuthState', 'hasSentMagicLink');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        isLoading == other.isLoading &&
        successfullyReset == other.successfullyReset &&
        user == other.user &&
        email == other.email &&
        error == other.error &&
        hasSentMagicLink == other.hasSentMagicLink;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, successfullyReset.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, hasSentMagicLink.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthState')
          ..add('isLoading', isLoading)
          ..add('successfullyReset', successfullyReset)
          ..add('user', user)
          ..add('email', email)
          ..add('error', error)
          ..add('hasSentMagicLink', hasSentMagicLink))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _successfullyReset;
  bool? get successfullyReset => _$this._successfullyReset;
  set successfullyReset(bool? successfullyReset) =>
      _$this._successfullyReset = successfullyReset;

  User? _user;
  User? get user => _$this._user;
  set user(User? user) => _$this._user = user;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _hasSentMagicLink;
  bool? get hasSentMagicLink => _$this._hasSentMagicLink;
  set hasSentMagicLink(bool? hasSentMagicLink) =>
      _$this._hasSentMagicLink = hasSentMagicLink;

  AuthStateBuilder() {
    AuthState._initializeBuilder(this);
  }

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _successfullyReset = $v.successfullyReset;
      _user = $v.user;
      _email = $v.email;
      _error = $v.error;
      _hasSentMagicLink = $v.hasSentMagicLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    final _$result = _$v ??
        new _$AuthState._(
            isLoading: isLoading,
            successfullyReset: successfullyReset,
            user: user,
            email: email,
            error: error,
            hasSentMagicLink: BuiltValueNullFieldError.checkNotNull(
                hasSentMagicLink, r'AuthState', 'hasSentMagicLink'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
