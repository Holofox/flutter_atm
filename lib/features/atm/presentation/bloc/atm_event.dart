part of 'atm_bloc.dart';

@freezed
class AtmEvent with _$AtmEvent {
  const factory AtmEvent.started() = AtmStarted;

  const factory AtmEvent.withdrawn() = AtmWithdrawn;
}
