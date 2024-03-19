import 'dart:convert';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  const SearchResultModel({
    required super.characters,
    required super.page,
    required super.numberPages,
  });

  factory SearchResultModel.initialState() {
    return const SearchResultModel(characters: [], page: 0, numberPages: 0);
  }

  copyWith({List<Character>? characters, int? page, int? numberPages}) {
    return SearchResultModel(
      characters: characters ?? this.characters,
      page: page ?? this.page,
      numberPages: numberPages ?? this.numberPages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'characters': characters,
      'page': page,
      'numberPages': numberPages,
    };
  }

  static SearchResultModel fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      characters: map['characters'],
      page: map['page'],
      numberPages: map['numberPages'],
    );
  }

  String toJson() => json.encode(toMap());

  static SearchResultModel fromJson(String source) =>
      fromMap(json.decode(source));
}
