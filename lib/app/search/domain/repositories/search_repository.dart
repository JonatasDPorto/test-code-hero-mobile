import 'package:teste_code_hero_mobile/app/search/data/models/search_entry_model.dart';
import 'package:teste_code_hero_mobile/app/search/domain/states/search_state.dart';

abstract class SearchRepository {
  Future<SearchState> getCharacters(SearchEntryModel searchModel);
}
