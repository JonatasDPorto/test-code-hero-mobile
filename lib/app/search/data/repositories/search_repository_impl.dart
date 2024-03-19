import 'package:teste_code_hero_mobile/app/search/data/models/search_entry_model.dart';
import 'package:teste_code_hero_mobile/app/search/domain/errors/erros.dart';
import 'package:teste_code_hero_mobile/app/search/domain/repositories/search_repository.dart';
import 'package:teste_code_hero_mobile/app/search/domain/states/search_state.dart';

import '../datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<SearchState> getCharacters(SearchEntryModel searchModel) async {
    try {
      var list = await datasource.searchText(searchModel);
      if (list.characters.isEmpty) {
        return ErrorState(EmptyList());
      }
      return SuccessState(list);
    } catch (e) {
      return ErrorState(ErrorSearch());
    }
  }
}
