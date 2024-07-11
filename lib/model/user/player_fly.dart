
import 'package:json_annotation/json_annotation.dart';

part 'player_fly.g.dart';

@JsonSerializable()
class PlayerFly {
  final int remainSeconds;
  final bool infinite;

  PlayerFly({required this.remainSeconds, required this.infinite});

  factory PlayerFly.fromJson(Map<String, dynamic> json) => _$PlayerFlyFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerFlyToJson(this);
}