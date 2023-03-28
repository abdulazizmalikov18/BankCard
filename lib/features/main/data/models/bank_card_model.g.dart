// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankCardModel _$BankCardModelFromJson(Map<String, dynamic> json) =>
    BankCardModel(
      id: json['id'] as int? ?? 0,
      assets: json['assets'] as String? ?? '',
      cardHolderName: json['card_holder_name'] as String? ?? '',
      cardNumber: json['card_number'] as String? ?? '',
      expiryDate: json['expiry_date'] as String? ?? '',
      cvvCode: json['cvv_code'] as String? ?? '',
      file: json['file'] as String?,
      color: json['color'] as int? ?? 0,
      isImage: json['is_image'] as int? ?? 0,
    );

Map<String, dynamic> _$BankCardModelToJson(BankCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_holder_name': instance.cardHolderName,
      'card_number': instance.cardNumber,
      'expiry_date': instance.expiryDate,
      'cvv_code': instance.cvvCode,
      'file': instance.file,
      'assets': instance.assets,
      'color': instance.color,
      'is_image': instance.isImage,
    };
