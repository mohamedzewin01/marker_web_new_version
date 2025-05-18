
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/search/data/models/request/search_request.dart';
import 'package:fada_alhalij_web/features/search/domain/entities/search_entity.dart';

abstract class SearchUseCaseRepo {
  Future<Result<SearchEntity?>> search(SearchRequest searchRequest);
}