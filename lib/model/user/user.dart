
import 'package:anif_admin/lib/head.dart';
import 'package:anif_admin/model/user/player_auto_seed.dart';
import 'package:anif_admin/model/user/player_fly.dart';
import 'package:anif_admin/model/user/player_prefix.dart';
import 'package:anif_admin/model/user/wallet.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'grade.dart';
import 'job_stat.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String uuid;
  final /*JobStat*/Map<String, dynamic> jobStat;
  final /*Wallet*/Map<String, dynamic> wallet;
  final /*PlayerPrefix*/Map<String, dynamic> playerPrefix;
  final /*PlayerAutoSeed*/Map<String, dynamic> playerAutoSeed;
  final /*PlayerFly*/Map<String, dynamic> playerFly;
  final /*Grade*/Map<String, dynamic> grade;
  final String? islandName;

  @JsonKey(name: 'online')
  final bool isOnline;

  JobStat get jobStatObject => JobStat.fromJson(jobStat);
  Wallet get walletObject => Wallet.fromJson(wallet);
  PlayerPrefix get playerPrefixObject => PlayerPrefix.fromJson(playerPrefix);
  PlayerAutoSeed get playerAutoSeedObject => PlayerAutoSeed.fromJson(playerAutoSeed);
  PlayerFly get playerFlyObject => PlayerFly.fromJson(playerFly);
  Grade get gradeObject => Grade.fromJson(grade);

  User(
    this.name,
    this.isOnline,
    this.islandName,
    this.uuid,
    this.jobStat,
    this.wallet,
    this.playerPrefix,
    this.playerAutoSeed,
    this.playerFly,
    this.grade
  );

  User.clone(User user) : this(
    user.name,
    user.isOnline,
    user.islandName,
    user.uuid,
    user.jobStat,
    user.wallet,
    user.playerPrefix,
    user.playerAutoSeed,
    user.playerFly,
    user.grade
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  Future<Widget> createHeadImage(int size) async => createImage(this, size);

}