// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  Map<String, String> get coord => throw _privateConstructorUsedError;
  Map<String, int> get clouds => throw _privateConstructorUsedError;
  Wind? get wind => throw _privateConstructorUsedError;
  List<WeatherDescription>? get weather =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'main')
  Temperature? get mainWeather => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {Map<String, String> coord,
      Map<String, int> clouds,
      Wind? wind,
      List<WeatherDescription>? weather,
      @JsonKey(name: 'main') Temperature? mainWeather,
      String? name});

  $WindCopyWith<$Res>? get wind;
  $TemperatureCopyWith<$Res>? get mainWeather;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coord = null,
    Object? clouds = null,
    Object? wind = freezed,
    Object? weather = freezed,
    Object? mainWeather = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      coord: null == coord
          ? _value.coord
          : coord // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      clouds: null == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescription>?,
      mainWeather: freezed == mainWeather
          ? _value.mainWeather
          : mainWeather // ignore: cast_nullable_to_non_nullable
              as Temperature?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WindCopyWith<$Res>? get wind {
    if (_value.wind == null) {
      return null;
    }

    return $WindCopyWith<$Res>(_value.wind!, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureCopyWith<$Res>? get mainWeather {
    if (_value.mainWeather == null) {
      return null;
    }

    return $TemperatureCopyWith<$Res>(_value.mainWeather!, (value) {
      return _then(_value.copyWith(mainWeather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$_WeatherCopyWith(
          _$_Weather value, $Res Function(_$_Weather) then) =
      __$$_WeatherCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String> coord,
      Map<String, int> clouds,
      Wind? wind,
      List<WeatherDescription>? weather,
      @JsonKey(name: 'main') Temperature? mainWeather,
      String? name});

  @override
  $WindCopyWith<$Res>? get wind;
  @override
  $TemperatureCopyWith<$Res>? get mainWeather;
}

/// @nodoc
class __$$_WeatherCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$_Weather>
    implements _$$_WeatherCopyWith<$Res> {
  __$$_WeatherCopyWithImpl(_$_Weather _value, $Res Function(_$_Weather) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coord = null,
    Object? clouds = null,
    Object? wind = freezed,
    Object? weather = freezed,
    Object? mainWeather = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Weather(
      coord: null == coord
          ? _value._coord
          : coord // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      clouds: null == clouds
          ? _value._clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      weather: freezed == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescription>?,
      mainWeather: freezed == mainWeather
          ? _value.mainWeather
          : mainWeather // ignore: cast_nullable_to_non_nullable
              as Temperature?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather implements _Weather {
  const _$_Weather(
      {final Map<String, String> coord = const {},
      final Map<String, int> clouds = const {},
      this.wind,
      final List<WeatherDescription>? weather,
      @JsonKey(name: 'main') this.mainWeather,
      this.name})
      : _coord = coord,
        _clouds = clouds,
        _weather = weather;

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherFromJson(json);

  final Map<String, String> _coord;
  @override
  @JsonKey()
  Map<String, String> get coord {
    if (_coord is EqualUnmodifiableMapView) return _coord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coord);
  }

  final Map<String, int> _clouds;
  @override
  @JsonKey()
  Map<String, int> get clouds {
    if (_clouds is EqualUnmodifiableMapView) return _clouds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clouds);
  }

  @override
  final Wind? wind;
  final List<WeatherDescription>? _weather;
  @override
  List<WeatherDescription>? get weather {
    final value = _weather;
    if (value == null) return null;
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'main')
  final Temperature? mainWeather;
  @override
  final String? name;

  @override
  String toString() {
    return 'Weather(coord: $coord, clouds: $clouds, wind: $wind, weather: $weather, mainWeather: $mainWeather, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather &&
            const DeepCollectionEquality().equals(other._coord, _coord) &&
            const DeepCollectionEquality().equals(other._clouds, _clouds) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.mainWeather, mainWeather) ||
                other.mainWeather == mainWeather) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_coord),
      const DeepCollectionEquality().hash(_clouds),
      wind,
      const DeepCollectionEquality().hash(_weather),
      mainWeather,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      __$$_WeatherCopyWithImpl<_$_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {final Map<String, String> coord,
      final Map<String, int> clouds,
      final Wind? wind,
      final List<WeatherDescription>? weather,
      @JsonKey(name: 'main') final Temperature? mainWeather,
      final String? name}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  Map<String, String> get coord;
  @override
  Map<String, int> get clouds;
  @override
  Wind? get wind;
  @override
  List<WeatherDescription>? get weather;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'main')
  Temperature? get mainWeather;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
