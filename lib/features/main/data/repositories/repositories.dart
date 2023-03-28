import 'package:bankcard/core/exceptions/exceptions.dart';
import 'package:bankcard/core/exceptions/failures.dart';
import 'package:bankcard/core/utils/either.dart';
import 'package:bankcard/features/main/data/datasources/dio/dio_datasource.dart';
import 'package:bankcard/features/main/data/models/generic_pagination.dart';
import 'package:bankcard/features/main/domain/entities/bank_card_entity.dart';
import 'package:bankcard/features/main/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';

class MyCardsRepositoryImpl extends MyCardsRepo {
  final MyCardsDataSourcheImpl dataSource;

  MyCardsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<BankCardEntity>>>
      cardList() async {
    try {
      final result = await dataSource.ordersList();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioError {
      return Left(DioFailure());
    }
  }
}
