import 'package:flutter/material.dart';
import 'package:food/features/Favorites/presentation/view/widgets/favorites_title.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text("Favorites")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [FavoritesTitle()]),
        ),
      ),
    );
  }
}
