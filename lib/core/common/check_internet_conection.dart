import 'dart:io';
import '/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckNetworkConnectionWidget extends StatefulWidget {
  const CheckNetworkConnectionWidget({
    super.key,
    required this.child,
    required this.onRetryPressed,
  });

  final Widget child;
  final Function onRetryPressed;

  @override
  State<CheckNetworkConnectionWidget> createState() =>
      _CheckNetworkConnectionStateWidget();
}

class _CheckNetworkConnectionStateWidget
    extends State<CheckNetworkConnectionWidget> {
  bool _isNetworkConnected = false;

  Future _checkNetwork() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setState(() {
        _isNetworkConnected = true;
      });
    } else {
      setState(() {
        _isNetworkConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkNetwork(),
        builder: (context, snapshot) {
          if (_isNetworkConnected) {
            return widget.child;
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsManager.noInternetImage,
                    fit: BoxFit.cover,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onRetryPressed();
                    },
                    child: Text(AppLocalizations.of(context)!.retry),
                  ),
                ],
              ),
            );
          }
        });
  }
}
