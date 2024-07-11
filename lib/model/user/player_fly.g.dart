// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_fly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerFly _$PlayerFlyFromJson(Map<String, dynamic> json) => PlayerFly(
      remainSeconds: (json['remainSeconds'] as num).toInt(),
      infinite: json['infinite'] as bool,
    );

Map<String, dynamic> _$PlayerFlyToJson(PlayerFly instance) => <String, dynamic>{
      'remainSeconds': instance.remainSeconds,
      'infinite': instance.infinite,
    };
