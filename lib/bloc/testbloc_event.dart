part of 'testbloc_bloc.dart';

@immutable
abstract class TestblocEvent {}

class GoToSecondPageEvent extends TestblocEvent {}

class GoBackEvent extends TestblocEvent {}
