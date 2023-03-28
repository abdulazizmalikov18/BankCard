import 'package:bankcard/core/exceptions/failures.dart';
import 'package:bankcard/core/singletons/service_locator.dart';
import 'package:bankcard/core/usecases/usecase.dart';
import 'package:bankcard/core/utils/either.dart';
import 'package:bankcard/features/main/data/models/generic_pagination.dart';
import 'package:bankcard/features/main/data/repositories/repositories.dart';
import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:bankcard/features/main/domain/repositories/repositories.dart';

class CardsUseUseCase
    extends UseCase<GenericPagination<BankCardEntity>, NoParams> {
  final MyCardsRepo repository = serviceLocator<MyCardsRepositoryImpl>();

  CardsUseUseCase();

  @override
  Future<Either<Failure, GenericPagination<BankCardEntity>>> call(
          NoParams params) async =>
      await repository.cardList();
}