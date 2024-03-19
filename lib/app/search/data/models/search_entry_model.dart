import 'dart:convert';
import 'package:teste_code_hero_mobile/app/search/domain/entities/search_entry.dart';

class SearchEntryModel extends SearchEntry {
  const SearchEntryModel({
    required super.text,
    required super.page,
    required super.itemPerPage,
  });

  factory SearchEntryModel.initialState() {
    return const SearchEntryModel(text: '', page: 0, itemPerPage: 1);
  }

  copyWith({String? text, int? page, int? itemPerPage}) {
    return SearchEntryModel(
      text: text ?? this.text,
      page: page ?? this.page,
      itemPerPage: itemPerPage ?? this.itemPerPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'page': page,
      'itemPerPage': itemPerPage,
    };
  }

  static SearchEntryModel fromMap(Map<String, dynamic> map) {
    return SearchEntryModel(
      text: map['text'],
      page: map['page'],
      itemPerPage: map['itemPerPage'],
    );
  }

  String toJson() => json.encode(toMap());

  static SearchEntryModel fromJson(String source) =>
      fromMap(json.decode(source));
}
