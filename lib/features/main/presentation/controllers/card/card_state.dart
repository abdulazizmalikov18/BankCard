part of 'card_bloc.dart';

class CardState extends Equatable {
  final CardDesign status;
  final List<CardEntity> cards;
  final List<BankCardEntity> cardsList;
  const CardState({
    this.status = CardDesign.assets,
    this.cards = const [],
    this.cardsList = const [],
  });

  CardState copyWith({
    CardDesign? status,
    List<CardEntity>? cards,
    List<BankCardEntity>? cardsList,
  }) =>
      CardState(
        status: status ?? this.status,
        cards: cards ?? this.cards,
        cardsList: cardsList ?? this.cardsList,
      );
  @override
  List<Object?> get props => [status, cards, cardsList];
}
