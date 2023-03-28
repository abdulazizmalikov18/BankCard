part of 'card_bloc.dart';

class CardState extends Equatable {
  final CardDesign statusCard;
  final FormzStatus status;
  final List<BankCardEntity> cardsList;
  const CardState({
    this.statusCard = CardDesign.assets,
    this.cardsList = const [],
    this.status = FormzStatus.pure,
  });

  CardState copyWith({
    FormzStatus? status,
    CardDesign? statusCard,
    List<BankCardEntity>? cardsList,
  }) =>
      CardState(
        statusCard: statusCard ?? this.statusCard,
        cardsList: cardsList ?? this.cardsList,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [status, cardsList, statusCard];
}
