import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'testbloc_event.dart';
part 'testbloc_state.dart';

class TestblocBloc extends Bloc<TestblocEvent, TestblocState> {
  TestblocBloc() : super(TestblocInitial());

  @override
  Stream<TestblocState> mapEventToState(
    TestblocEvent event,
  ) async* {
    if (event is GoToSecondPageEvent) yield SecondPageState();
    if (event is GoBackEvent) yield TestblocInitial();
  }
}
