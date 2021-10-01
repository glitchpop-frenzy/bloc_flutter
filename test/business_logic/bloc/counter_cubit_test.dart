// test is used to test basic functionalities of the app
// therefore teh directory structure and name of files should be symmetrical to that of lib
// In name of files in lib just add '_test' in every file name of test folder.

import 'package:bloc_flutter/business_logic/bloc/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// The purpose of any test is that output of a feature == expected output
void main() {
  //group is a way of organizing muliple tests for a feature.
  // for ex., in our counter cubit group will write all the necessary tests
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    // inside the setUp you can instantiate the object or test we'll be working with.
    // In our case, we'll instantiate the counter Bloc.
    setUp(() {
      // counterCubit = CounterCubit();
    });

    // tearDown function is a function that will be called after each test is run.
    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });
  });
}
