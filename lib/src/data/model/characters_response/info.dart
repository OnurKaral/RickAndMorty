import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  const Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  List<Object?> get props => [count, pages, next, prev];
}
