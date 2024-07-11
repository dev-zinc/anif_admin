
import 'package:json_annotation/json_annotation.dart';

part 'player_auto_seed.g.dart';

@JsonSerializable()
class PlayerAutoSeed {
  final int count;
  final bool infinite;
  final bool use;

  PlayerAutoSeed({required this.count, required this.infinite, required this.use});

  factory PlayerAutoSeed.fromJson(Map<String, dynamic> json) => _$PlayerAutoSeedFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerAutoSeedToJson(this);
}