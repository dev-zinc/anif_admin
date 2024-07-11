// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobStat _$JobStatFromJson(Map<String, dynamic> json) => JobStat(
      Map<String, int>.from(json['levels'] as Map),
      (json['relicIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$JobStatToJson(JobStat instance) => <String, dynamic>{
      'levels': instance.levels,
      'relicIds': instance.relicIds,
    };
