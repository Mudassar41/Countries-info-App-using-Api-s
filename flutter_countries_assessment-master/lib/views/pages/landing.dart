import 'package:countries_info/animations/flare_assets.dart';
import 'package:countries_info/routes.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlareActor(
          FlareAssets.palotaIntro,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: FlareAssets.palotaIntroAnimationName,
          callback: (String _) {
            // wait 1 second before navigating
            Future.delayed(Duration(seconds: 1)).then(
              (value) => _navigateToCountries(context),
            );
          },
        ),
      ),
    );
  }

  void _navigateToCountries(BuildContext context) {
    // replace because we don't want to navigate back to the landing screen
    Navigator.of(context).pushReplacementNamed(AppRoutes.countries);
  }
}
