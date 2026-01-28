import 'package:equatable/equatable.dart';
import 'package:food/features/home/data/model/details_model/side_options_model.dart';
import 'package:food/features/home/data/model/details_model/toppings_model.dart';

class DetailsState extends Equatable {
  final ToppingsModel? toppingsModel;
  final SideOptionsModel? sideOptionsModel;
  final Set<int> selectedtoppings;
  final Set<int> selectedsideOptions;
  final bool isLoading;
  final double spicy;
  final String? err;
  const DetailsState({
    this.toppingsModel,
    this.sideOptionsModel,
    this.selectedtoppings = const {},
    this.selectedsideOptions = const {},
    this.isLoading = false,
    this.spicy = 0.5,
    this.err,
  });
  DetailsState copyWith({
    ToppingsModel? toppingsModel,
    SideOptionsModel? sideOptionsModel,
    Set<int>? selectedtoppings,
    Set<int>? selectedsideOptions,
    double? spicy,
    bool? isLoading,
    String? err,
  }) {
    return DetailsState(
      toppingsModel: toppingsModel ?? this.toppingsModel,
      sideOptionsModel: sideOptionsModel ?? this.sideOptionsModel,
      selectedtoppings: selectedtoppings ?? this.selectedtoppings,
      selectedsideOptions: selectedsideOptions ?? this.selectedsideOptions,
      isLoading: isLoading ?? this.isLoading,
      spicy: spicy ?? this.spicy,
      err: err,
    );
  }

  @override
  List<Object?> get props => [
    toppingsModel,
    sideOptionsModel,
    selectedtoppings,
    selectedsideOptions,
    isLoading,
    spicy,
    err,
  ];
}
