import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/display_character_page/main_display_character_page.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/search_page/main_search_page.dart';
import 'search/data/datasources/marvel/marvel_datasource.dart';
import 'search/data/datasources/search_datasource.dart';
import 'search/data/repositories/search_repository_impl.dart';
import 'search/domain/blocs/search_bloc.dart';
import 'search/domain/repositories/search_repository.dart';

BindConfig<T> blocConfig<T extends Bloc>() {
  return BindConfig(
    notifier: (bloc) => bloc.stream,
    onDispose: (bloc) => bloc.close(),
  );
}

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Dio());
    i.add<SearchDatasource>(MarvelDatasource.new);
    i.add<SearchRepository>(SearchRepositoryImpl.new);
    i.addSingleton<SearchBloc>(SearchBloc.new, config: blocConfig());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SearchPage());
    r.child('/display', child: (_) {
      var character = r.args.data as Character;
      return DisplayCharacterPage(
        character: character,
      );
    });
  }
}
