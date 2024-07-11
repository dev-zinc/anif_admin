
import 'package:json_annotation/json_annotation.dart';

part 'job_stat.g.dart';

@JsonSerializable()
class JobStat {
  final Map<String, int> levels;
  final List<String> relicIds;

  JobStat(this.levels, this.relicIds);

  factory JobStat.fromJson(Map<String, dynamic> json) => _$JobStatFromJson(json);
  Map<String, dynamic> toJson() => _$JobStatToJson(this);
}