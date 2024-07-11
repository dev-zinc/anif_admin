
import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
class Grade {
  final Tier tier;
  final int level;
  @JsonKey(name: 'visible')
  final bool isVisible;

  Grade({required this.tier, required this.level, required this.isVisible});

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
  Map<String, dynamic> toJson() => _$GradeToJson(this);

  String get displayName => '${tier.name} $level';
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Tier {
  bronze,
  silver,
  gold,
  purple,
  ruby,
  diamond,
}