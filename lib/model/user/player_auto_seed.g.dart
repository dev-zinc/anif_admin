// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_auto_seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerAutoSeed _$PlayerAutoSeedFromJson(Map<String, dynamic> json) =>
    PlayerAutoSeed(
      count: (json['count'] as num).toInt(),
      infinite: json['infinite'] as bool,
      use: json['use'] as bool,
    );

Map<String, dynamic> _$PlayerAutoSeedToJson(PlayerAutoSeed instance) =>
    <String, dynamic>{
      'count': instance.count,
      'infinite': instance.infinite,
      'use': instance.use,
    };
