import 'package:equatable/equatable.dart';

abstract class SearchEntry extends Equatable {
  final String text;
  final int page;
  final int itemPerPage;
  const SearchEntry({
    required this.text,
    required this.page,
    required this.itemPerPage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [text, page, itemPerPage];
}
