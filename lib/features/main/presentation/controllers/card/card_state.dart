part of 'card_bloc.dart';

class CardState extends Equatable {
  final CardDesign status;
  final List<CardEntity> cards;
  const CardState({
    this.status = CardDesign.assets,
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
    List<CardEntity>? cards,
  }) =>
      CardState(
        status: status ?? this.status,
        cards: cards ?? this.cards,
      );
  @override
  List<Object?> get props => [status, cards];
}
