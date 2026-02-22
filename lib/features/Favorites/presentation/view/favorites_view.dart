import 'package:flutter/material.dart';
import 'package:food/core/utils/function.dart';
import 'package:food/core/widgets/custom_guest_widget.dart';
import 'package:food/features/Favorites/presentation/view/widgets/favorites_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return isGuest ? const CustomGuestWidget() : const FavoritesBody();
  }
}
