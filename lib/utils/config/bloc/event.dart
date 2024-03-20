part of 'bloc.dart';

abstract class Event extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeCountryEvent extends Event {
  final Country country;

  ChangeCountryEvent(this.country);
}
