
import 'package:json_annotation/json_annotation.dart';

part 'player_prefix.g.dart';

@JsonSerializable()
class PlayerPrefix {
  final List<String> prefixes;

  PlayerPrefix({required this.prefixes});

  factory PlayerPrefix.fromJson(Map<String, dynamic> json) => _$PlayerPrefixFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerPrefixToJson(this);
}