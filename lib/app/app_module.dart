import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/main_page.dart';
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
    r.child('/', child: (context) => const MainPage());
  }
}
