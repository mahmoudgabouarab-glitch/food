part of 'details_cubit.dart';

class DetailsState extends Equatable {
  final ToppingsModel? toppings;
  final ToppingsModel? sideOptions;
  final bool isLoading;
  final String? error;

  const DetailsState({
    this.toppings,
    this.sideOptions,
    this.isLoading = false,
    this.error,
  });

  factory DetailsState.initial() => const DetailsState();

  DetailsState copyWith({
    ToppingsModel? toppings,
    ToppingsModel? sideOptions,
    bool? isLoading,
    String? error,
  }) {
    return DetailsState(
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [toppings, sideOptions, isLoading, error];
}
