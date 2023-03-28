import 'package:bankcard/core/exceptions/failures.dart';
import 'package:bankcard/core/utils/either.dart';
import 'package:bankcard/features/main/data/models/generic_pagination.dart';
import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';

abstract class MyCardsRepo {
  Future<Either<Failure, GenericPagination<BankCardEntity>>> cardList();
}
