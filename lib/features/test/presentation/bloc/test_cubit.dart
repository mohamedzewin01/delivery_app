import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
}
