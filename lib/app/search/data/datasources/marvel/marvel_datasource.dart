import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_code_hero_mobile/app/search/data/models/search_result_model.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/search_entry.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/search_result.dart';
import '../../models/character_model.dart';
import '../search_datasource.dart';

class MarvelDatasource implements SearchDatasource {
  final Dio dio;

  MarvelDatasource(this.dio);

  @override
  Future<SearchResult> searchText(SearchEntry searchModel) async {
    var privateKey = dotenv.env['MARVEL_PRIVATE_API_KEY']!;
    var publicKey = dotenv.env['MARVEL_PUBLIC_API_KEY']!;
    var ts = DateTime.timestamp().toString();
    String concatenatedString = ts + privateKey + publicKey;
    var hash = md5.convert(utf8.encode(concatenatedString)).toString();
    var result = await dio.get(
        "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=${searchModel.text}&orderBy=name&limit=${searchModel.itemPerPage}&offset=${searchModel.page * searchModel.itemPerPage}&ts=$ts&apikey=$publicKey&hash=$hash");
    if (result.statusCode == 200) {
      var jsonList = result.data['data']['results'] as List;
      var characters =
          jsonList.map((item) => CharacterModel.fromMap(item)).toList();

      var totalItems = result.data['data']['total'] as int;
      var numberPages = totalItems ~/ searchModel.itemPerPage;
      if (totalItems % searchModel.itemPerPage != 0) {
        numberPages += 1;
      }
      return SearchResultModel(
          characters: characters,
          page: searchModel.page,
          numberPages: numberPages);
    } else {
      throw Exception();
    }
  }
}
