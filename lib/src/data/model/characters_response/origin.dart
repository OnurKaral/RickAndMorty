import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'origin.g.dart';

@JsonSerializable()
class Origin extends Equatable {
  final String? name;
  final String? url;

  const Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return _$OriginFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OriginToJson(this);

  @override
  List<Object?> get props => [name, url];
}
