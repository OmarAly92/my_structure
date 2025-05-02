part of '{{name.camelCase()}}_cubit.dart';

sealed class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();
}

final class {{name.pascalCase()}}InitialState extends {{name.pascalCase()}}State {
  const {{name.pascalCase()}}InitialState();

  @override
  List<Object> get props => [];
}
