abstract class Character {
  final String name;
  final String description;
  final String image;
  final List<String> comics;
  final List<String> series;
  final List<String> stories;
  final List<String> events;

  const Character({
    required this.name,
    required this.description,
    required this.image,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
  });
}
