part of 'card_bloc.dart';

class CardState extends Equatable {
  final CardDesign status;
  final CardEntity cardEntity;
  final List<CardEntity> cards;
  const CardState({
    this.status = CardDesign.assets,
    this.cardEntity = const CardEntity(),
    this.cards = const [
      CardEntity(
        cardCvv: '001',
        cardDate: '01/26',
        cardName: 'Card Name',
        cardNumber: '9860 3501 0133 3322',
        cardType: 'humo',
        assets: AppImages.image6,
        cardPrice: '888 000.00',
      )
    ],
  });

  CardState copyWith({
    CardDesign? status,
    CardEntity? cardEntity,
    List<CardEntity>? cards,
  }) =>
      CardState(
        status: status ?? this.status,
        cardEntity: cardEntity ?? this.cardEntity,
        cards: cards ?? this.cards,
      );
  @override
  List<Object?> get props => [status, cardEntity, cards];
}
