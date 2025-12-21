part of 'flights_form_cubit.dart';

class FlightsFormState extends Equatable {
  const FlightsFormState({
    this.initialized = false,
    this.pending = false,
    this.result,
  });

  final bool initialized;
  final bool pending;
  final Result<List<FlightOffer>>? result;

  List<FlightOffer>? get data => result?.maybeSuccess?.data;

  FlightsFormState copyWith({
    bool? initialized,
    bool? pending,
    NullableCopy<Result<List<FlightOffer>>>? result,
    ViewState<List<FlightOffer>?>? resource,
  }) {
    return FlightsFormState(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
      result: result.apply(this.result),
    );
  }

  @override
  List<Object?> get props => [
        initialized,
        pending,
        result,
      ];
}
