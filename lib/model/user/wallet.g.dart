// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      values: (json['values'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$WalletTypeEnumMap, k), (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'values':
          instance.values.map((k, e) => MapEntry(_$WalletTypeEnumMap[k]!, e)),
    };

const _$WalletTypeEnumMap = {
  WalletType.money: 'money',
  WalletType.cash: 'cash',
};
