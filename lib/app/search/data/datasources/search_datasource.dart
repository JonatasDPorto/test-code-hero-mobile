import 'package:teste_code_hero_mobile/app/search/domain/entities/search_entry.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/search_result.dart';

abstract class SearchDatasource {
  Future<SearchResult> searchText(SearchEntry searchModel);
}
