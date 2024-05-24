import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page_view_model.dart';

class AppLinkIcon extends StatelessWidget {
  const AppLinkIcon({
    super.key,
    required this.url,
    required this.icon,
  });

  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, viewModel, _) {
        return InkWell(
          onTap: () async {
            await viewModel.launchInBrowser(url);
          },
          child: Icon(
            icon,
            size: 35,
          ),
        );
      },
    );
  }
}
