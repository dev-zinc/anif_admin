// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade(
      tier: $enumDecode(_$TierEnumMap, json['tier']),
      level: (json['level'] as num).toInt(),
      isVisible: json['visible'] as bool,
    );

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'tier': _$TierEnumMap[instance.tier]!,
      'level': instance.level,
      'visible': instance.isVisible,
    };

const _$TierEnumMap = {
  Tier.bronze: 'BRONZE',
  Tier.silver: 'SILVER',
  Tier.gold: 'GOLD',
  Tier.purple: 'PURPLE',
  Tier.ruby: 'RUBY',
  Tier.diamond: 'DIAMOND',
};
