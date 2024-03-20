part of 'bloc.dart';

@immutable
abstract class AppConfigState extends Equatable {
  final Model model;
  const AppConfigState(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends AppConfigState {
  const InitialState(super.model);
}

class ChangedCountryState extends AppConfigState {
  const ChangedCountryState(super.model);
}

class ChangedBusinessBuilderState extends AppConfigState {
  const ChangedBusinessBuilderState(super.model);
}

class Model extends Equatable {
  final Country country;

  const Model({
    required this.country,
  });

  Model copyWith({
    Country? country,
  }) {
    return Model(
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props {
    return [
      country,
    ];
  }
}
