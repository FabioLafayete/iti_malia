import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BlocBase{

  final _searchController = BehaviorSubject<String>();
  Sink get inSearch => _searchController.sink;
  Stream get outSearch => _searchController.stream;

  SearchBloc();

  @override
  void dispose() {
    _searchController.close();
  }

}