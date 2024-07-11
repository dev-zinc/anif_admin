// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      json['online'] as bool,
      json['islandName'] as String?,
      json['uuid'] as String,
      json['jobStat'] as Map<String, dynamic>,
      json['wallet'] as Map<String, dynamic>,
      json['playerPrefix'] as Map<String, dynamic>,
      json['playerAutoSeed'] as Map<String, dynamic>,
      json['playerFly'] as Map<String, dynamic>,
      json['grade'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'jobStat': instance.jobStat,
      'wallet': instance.wallet,
      'playerPrefix': instance.playerPrefix,
      'playerAutoSeed': instance.playerAutoSeed,
      'playerFly': instance.playerFly,
      'grade': instance.grade,
      'islandName': instance.islandName,
      'online': instance.isOnline,
    };
