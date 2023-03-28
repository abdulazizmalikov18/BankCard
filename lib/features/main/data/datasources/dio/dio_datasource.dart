import 'package:bankcard/core/exceptions/exceptions.dart';
import 'package:bankcard/core/singletons/dio_settings.dart';
import 'package:bankcard/core/singletons/service_locator.dart';
import 'package:bankcard/features/main/data/models/bank_card_model.dart';
import 'package:bankcard/features/main/data/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class MyCardsDataSourche {
  Future<GenericPagination<BankCardModel>> ordersList();
}

class MyCardsDataSourcheImpl extends MyCardsDataSourche {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<GenericPagination<BankCardModel>> ordersList() async {
    try {
      final response = await dio.get('cards');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => BankCardModel.fromJson(p0 as Map<String, dynamic>));
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
