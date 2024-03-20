import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_code_hero_mobile/app/search/domain/blocs/search_bloc.dart';
import 'package:teste_code_hero_mobile/app/search/domain/errors/erros.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/mobile_characters_table.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/header/mobile_header.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/search_bar/mobile_search_bar.dart';
import '../../../domain/states/search_state.dart';

class MobileSearchPage extends StatelessWidget {
  const MobileSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SearchBloc>((bloc) => bloc.stream);
    var theme = Theme.of(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: Column(
            children: [
              const MobileHeader(),
              const SizedBox(height: 12),
              MobileSearchBar(
                onChanged: (textChanged) {
                  bloc.add(bloc.searchModel
                      .copyWith(text: textChanged, itemPerPage: 4, page: 0));
                },
                initText: bloc.searchModel.text,
              ),
            ],
          ),
        ),
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
                return MobileCharactersTable(
                  characters: state.result.characters,
                  numberPages: state.result.numberPages,
                  pageSelected: state.result.page,
                  goToPage: (int page) {
                    bloc.add(
                        bloc.searchModel.copyWith(itemPerPage: 4, page: page));
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
    );
  }
}
