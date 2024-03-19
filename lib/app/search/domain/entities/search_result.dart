import 'package:equatable/equatable.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';

abstract class SearchResult extends Equatable {
  final List<Character> characters;
  final int page;
  final int numberPages;
  const SearchResult({
    required this.characters,
    required this.page,
    required this.numberPages,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [page, numberPages];
}
