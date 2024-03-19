import 'package:teste_code_hero_mobile/app/search/domain/entities/search_result.dart';
import 'package:teste_code_hero_mobile/app/search/domain/errors/erros.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final SearchResult result;
  const SuccessState(this.result);
}
