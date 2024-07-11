// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_prefix.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerPrefix _$PlayerPrefixFromJson(Map<String, dynamic> json) => PlayerPrefix(
      prefixes:
          (json['prefixes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlayerPrefixToJson(PlayerPrefix instance) =>
    <String, dynamic>{
      'prefixes': instance.prefixes,
    };
