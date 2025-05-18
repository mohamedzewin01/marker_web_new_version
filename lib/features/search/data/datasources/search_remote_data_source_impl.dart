


import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/search/data/datasources/search_remote_data_source.dart';
import 'package:fada_alhalij_web/features/search/data/models/request/search_request.dart';
import 'package:fada_alhalij_web/features/search/domain/entities/search_entity.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: SearchDataSource)
class SearchDataSourceImpl implements SearchDataSource {
  final ApiService _apiService;

  SearchDataSourceImpl(this._apiService);

  @override
  Future<Result<SearchEntity?>> search(SearchRequest searchRequest) {
    return executeApi(() async {
      final response = await _apiService.search(searchRequest);
      return response?.toSearchEntity();
    });
  }
}
