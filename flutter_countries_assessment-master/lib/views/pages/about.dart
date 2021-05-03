import 'package:countries_info/images/images.dart';
import 'package:countries_info/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class AboutPage extends StatelessWidget {
  static const String _website = "https://palota.co.za";
  static const String _email = "jobs@palota.co.za";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blue,
            AppColors.cyan,
            AppColors.green,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logoWhite,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              Text(
                'This is a simple Flutter project prepared by Palota to be used for assessment purposes.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      textColor: Colors.white,
                      color: AppColors.blue,
                      child: Text("Open Website"),
                      onPressed: () => _openWebsite(),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Text("E-Mail Us"),
                      onPressed: () => _launchEmail(),
                    ),
                  ),
                ],
              ),
              _buildVersionText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVersionText(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext ctx, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          final PackageInfo packageInfo = snapshot.data;
          return Text(
            "v${packageInfo.version} (${packageInfo.buildNumber})",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Future<bool> _openWebsite() async {
    if (await urlLauncher.canLaunch(_website)) {
      return urlLauncher.launch(_website);
    } else {
      return false;
    }
  }

  Future<bool> _launchEmail() async {
    final emailLink = "mailto:$_email";
    if (await urlLauncher.canLaunch(emailLink)) {
      return urlLauncher.launch(emailLink);
    } else {
      return false;
    }
  }
}
