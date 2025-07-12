import 'package:chefio_app/features/home/presentation/view/widgets/home_view_body_mobile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeViewBodyMobile(),
      ),
    );
  }
}
