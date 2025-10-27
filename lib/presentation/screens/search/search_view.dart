import 'package:envioflorestest/widgets/bezier.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  static const name = 'search_view';

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              BezierView(),
              // Otros widgets de la pantalla de búsqueda
            ],
          ),
        ),
      ),
    );
  }
}
