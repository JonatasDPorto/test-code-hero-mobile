import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_code_hero_mobile/app/search/data/models/search_entry_model.dart';
import 'package:teste_code_hero_mobile/app/search/domain/repositories/search_repository.dart';

import '../states/search_state.dart';

class SearchBloc extends Bloc<SearchEntryModel, SearchState>
    implements Disposable {
  final SearchRepository repository;

  SearchEntryModel searchModel = SearchEntryModel.initialState();

  SearchBloc(this.repository) : super(const StartState()) {
    on<SearchEntryModel>((textSearch, emit) async {
      if (searchModel == textSearch) return;
      if (textSearch.text.isEmpty && textSearch.page == 0) {
        emit(const StartState());
        return;
      }
      searchModel = textSearch;
      emit(const LoadingState());
      var newState = await repository.getCharacters(textSearch);
      emit(newState);
    }, transformer: transform());
  }

  EventTransformer<SearchEntryModel> transform<LoginEvent>() {
    return (events, mapper) =>
        events.debounceTime(const Duration(milliseconds: 300)).flatMap(mapper);
  }

  @override
  void dispose() {
    close();
  }
}
