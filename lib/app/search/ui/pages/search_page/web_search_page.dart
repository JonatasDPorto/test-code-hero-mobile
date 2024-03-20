import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_code_hero_mobile/app/search/domain/blocs/search_bloc.dart';
import 'package:teste_code_hero_mobile/app/search/domain/errors/erros.dart';
import 'package:teste_code_hero_mobile/app/search/domain/states/search_state.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/web_characters_table.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/header/web_header.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/search_bar/web_search_bar.dart';

class WebSearchPage extends StatefulWidget {
  const WebSearchPage({super.key});

  @override
  State<WebSearchPage> createState() => _WebSearchPageState();
}

class _WebSearchPageState extends State<WebSearchPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final bloc = context.watch<SearchBloc>((bloc) => bloc.stream);
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 42, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WebHeader(),
          const SizedBox(height: 34),
          WebSearchBar(
            initText: bloc.searchModel.text,
            onChanged: (textChanged) {
              bloc.add(bloc.searchModel
                  .copyWith(text: textChanged, itemPerPage: 4, page: 0));
            },
          ),
          const SizedBox(height: 34),
          Expanded(
            child: StreamBuilder(
              stream: bloc.stream,
              builder: (context, snapshot) {
                var state = bloc.state;
                if (state is ErrorState) {
                  if (state.error is EmptyList) {
                    return Center(
                      child: Text(
                        'Nenhum super heroi com esse nome foi encontrado :(',
                        style: theme.textTheme.tableText,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      'Algum problema ocorreu ao fazer sua pesquisa :(',
                      style: theme.textTheme.tableText,
                    ),
                  );
                }
                if (state is StartState) {
                  return Center(
                    child: Text(
                      'Pesquise personagens!',
                      style: theme.textTheme.tableText,
                    ),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessState) {
                  return WebCharactersTable(
                    characters: state.result.characters,
                    numberPages: state.result.numberPages,
                    pageSelected: state.result.page,
                    goToPage: (int page) {
                      bloc.add(bloc.searchModel
                          .copyWith(itemPerPage: 4, page: page));
                    },
                    onTapCharacter: (character) {
                      Modular.to.pushNamed('/display', arguments: character);
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
