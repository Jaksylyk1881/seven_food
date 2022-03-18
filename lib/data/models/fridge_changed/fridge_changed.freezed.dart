// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fridge_changed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FridgeChanged _$FridgeChangedFromJson(Map<String, dynamic> json) {
  return _FridgeChanged.fromJson(json);
}

/// @nodoc
class _$FridgeChangedTearOff {
  const _$FridgeChangedTearOff();

  _FridgeChanged call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      List<FridgeProduct>? products}) {
    return _FridgeChanged(
      totalAmount: totalAmount,
      usedBonus: usedBonus,
      products: products,
    );
  }

  FridgeChanged fromJson(Map<String, Object?> json) {
    return FridgeChanged.fromJson(json);
  }
}

/// @nodoc
const $FridgeChanged = _$FridgeChangedTearOff();

/// @nodoc
mixin _$FridgeChanged {
  @JsonKey(name: "total_amount")
  String? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "used_bonus")
  String? get usedBonus => throw _privateConstructorUsedError;
  List<FridgeProduct>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeChangedCopyWith<FridgeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeChangedCopyWith<$Res> {
  factory $FridgeChangedCopyWith(
          FridgeChanged value, $Res Function(FridgeChanged) then) =
      _$FridgeChangedCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      List<FridgeProduct>? products});
}

/// @nodoc
class _$FridgeChangedCopyWithImpl<$Res>
    implements $FridgeChangedCopyWith<$Res> {
  _$FridgeChangedCopyWithImpl(this._value, this._then);

  final FridgeChanged _value;
  // ignore: unused_field
  final $Res Function(FridgeChanged) _then;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? usedBonus = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: usedBonus == freezed
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<FridgeProduct>?,
    ));
  }
}

/// @nodoc
abstract class _$FridgeChangedCopyWith<$Res>
    implements $FridgeChangedCopyWith<$Res> {
  factory _$FridgeChangedCopyWith(
          _FridgeChanged value, $Res Function(_FridgeChanged) then) =
      __$FridgeChangedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      List<FridgeProduct>? products});
}

/// @nodoc
class __$FridgeChangedCopyWithImpl<$Res>
    extends _$FridgeChangedCopyWithImpl<$Res>
    implements _$FridgeChangedCopyWith<$Res> {
  __$FridgeChangedCopyWithImpl(
      _FridgeChanged _value, $Res Function(_FridgeChanged) _then)
      : super(_value, (v) => _then(v as _FridgeChanged));

  @override
  _FridgeChanged get _value => super._value as _FridgeChanged;

  @override
  $Res call({
    Object? totalAmount = freezed,
    Object? usedBonus = freezed,
    Object? products = freezed,
  }) {
    return _then(_FridgeChanged(
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      usedBonus: usedBonus == freezed
          ? _value.usedBonus
          : usedBonus // ignore: cast_nullable_to_non_nullable
              as String?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<FridgeProduct>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FridgeChanged implements _FridgeChanged {
  _$_FridgeChanged(
      {@JsonKey(name: "total_amount") this.totalAmount,
      @JsonKey(name: "used_bonus") this.usedBonus,
      this.products});

  factory _$_FridgeChanged.fromJson(Map<String, dynamic> json) =>
      _$$_FridgeChangedFromJson(json);

  @override
  @JsonKey(name: "total_amount")
  final String? totalAmount;
  @override
  @JsonKey(name: "used_bonus")
  final String? usedBonus;
  @override
  final List<FridgeProduct>? products;

  @override
  String toString() {
    return 'FridgeChanged(totalAmount: $totalAmount, usedBonus: $usedBonus, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FridgeChanged &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality().equals(other.usedBonus, usedBonus) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(usedBonus),
      const DeepCollectionEquality().hash(products));

  @JsonKey(ignore: true)
  @override
  _$FridgeChangedCopyWith<_FridgeChanged> get copyWith =>
      __$FridgeChangedCopyWithImpl<_FridgeChanged>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FridgeChangedToJson(this);
  }
}

abstract class _FridgeChanged implements FridgeChanged {
  factory _FridgeChanged(
      {@JsonKey(name: "total_amount") String? totalAmount,
      @JsonKey(name: "used_bonus") String? usedBonus,
      List<FridgeProduct>? products}) = _$_FridgeChanged;

  factory _FridgeChanged.fromJson(Map<String, dynamic> json) =
      _$_FridgeChanged.fromJson;

  @override
  @JsonKey(name: "total_amount")
  String? get totalAmount;
  @override
  @JsonKey(name: "used_bonus")
  String? get usedBonus;
  @override
  List<FridgeProduct>? get products;
  @override
  @JsonKey(ignore: true)
  _$FridgeChangedCopyWith<_FridgeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

FridgeProduct _$FridgeProductFromJson(Map<String, dynamic> json) {
  return _FridgeProduct.fromJson(json);
}

/// @nodoc
class _$FridgeProductTearOff {
  const _$FridgeProductTearOff();

  _FridgeProduct call(
      {String? name, String? image, String? price, int? quantity}) {
    return _FridgeProduct(
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    );
  }

  FridgeProduct fromJson(Map<String, Object?> json) {
    return FridgeProduct.fromJson(json);
  }
}

/// @nodoc
const $FridgeProduct = _$FridgeProductTearOff();

/// @nodoc
mixin _$FridgeProduct {
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeProductCopyWith<FridgeProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeProductCopyWith<$Res> {
  factory $FridgeProductCopyWith(
          FridgeProduct value, $Res Function(FridgeProduct) then) =
      _$FridgeProductCopyWithImpl<$Res>;
  $Res call({String? name, String? image, String? price, int? quantity});
}

/// @nodoc
class _$FridgeProductCopyWithImpl<$Res>
    implements $FridgeProductCopyWith<$Res> {
  _$FridgeProductCopyWithImpl(this._value, this._then);

  final FridgeProduct _value;
  // ignore: unused_field
  final $Res Function(FridgeProduct) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$FridgeProductCopyWith<$Res>
    implements $FridgeProductCopyWith<$Res> {
  factory _$FridgeProductCopyWith(
          _FridgeProduct value, $Res Function(_FridgeProduct) then) =
      __$FridgeProductCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? image, String? price, int? quantity});
}

/// @nodoc
class __$FridgeProductCopyWithImpl<$Res>
    extends _$FridgeProductCopyWithImpl<$Res>
    implements _$FridgeProductCopyWith<$Res> {
  __$FridgeProductCopyWithImpl(
      _FridgeProduct _value, $Res Function(_FridgeProduct) _then)
      : super(_value, (v) => _then(v as _FridgeProduct));

  @override
  _FridgeProduct get _value => super._value as _FridgeProduct;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_FridgeProduct(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FridgeProduct implements _FridgeProduct {
  _$_FridgeProduct({this.name, this.image, this.price, this.quantity});

  factory _$_FridgeProduct.fromJson(Map<String, dynamic> json) =>
      _$$_FridgeProductFromJson(json);

  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? price;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'FridgeProduct(name: $name, image: $image, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FridgeProduct &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$FridgeProductCopyWith<_FridgeProduct> get copyWith =>
      __$FridgeProductCopyWithImpl<_FridgeProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FridgeProductToJson(this);
  }
}

abstract class _FridgeProduct implements FridgeProduct {
  factory _FridgeProduct(
      {String? name,
      String? image,
      String? price,
      int? quantity}) = _$_FridgeProduct;

  factory _FridgeProduct.fromJson(Map<String, dynamic> json) =
      _$_FridgeProduct.fromJson;

  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get price;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$FridgeProductCopyWith<_FridgeProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
