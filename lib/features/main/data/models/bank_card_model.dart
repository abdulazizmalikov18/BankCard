import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_card_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BankCardModel extends BankCardEntity {
  const BankCardModel({
    super.id,
    super.assets,
    super.cardHolderName,
    super.cardNumber,
    super.expiryDate,
    super.cvvCode,
    super.file,
    super.color,
    super.isImage,
  });

  factory BankCardModel.fromJson(Map<String, dynamic> json) =>
      _$BankCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankCardModelToJson(this);
}
