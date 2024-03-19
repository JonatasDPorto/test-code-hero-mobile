import 'dart:convert';

import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.name,
    required super.description,
    required super.image,
    required super.comics,
    required super.series,
    required super.stories,
    required super.events,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'comics': comics,
      'series': series,
      'stories': stories,
      'events': events,
    };
  }

  static CharacterModel fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      image: map['thumbnail']['path'] + '/standard_medium.jpg',
      name: map['name'],
      description: map['description'],
      comics: (map['comics']['items'] as List)
          .map<String>((e) => e['name'])
          .toList(),
      series: (map['series']['items'] as List)
          .map<String>((e) => e['name'])
          .toList(),
      stories: (map['stories']['items'] as List)
          .map<String>((e) => e['name'])
          .toList(),
      events: (map['events']['items'] as List)
          .map<String>((e) => e['name'])
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  static CharacterModel fromJson(String source) => fromMap(json.decode(source));
}
