import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import 'app_animated_icon_view_model.dart';
import 'package:provider/provider.dart';

class AppAnimatedIcon extends StatelessWidget {
  const AppAnimatedIcon({
    required this.url,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAnimatedIconViewModel>(
      builder: (context, viewModel, _) {
        return InkWell(
          onHover: (event) {
            if (!event) return viewModel.posUpdateIconPadding(icon);

            return viewModel.updateIconPadding(icon);
          },
          onTap: () async {
            await viewModel.launchInBrowser(url);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 225),
            curve: Curves.decelerate,
            height: 100,
            padding: EdgeInsets.only(
              bottom: viewModel.paddingMap[icon] ?? 0,
            ),
            child: Icon(
              icon,
              color: viewModel.paddingMap[icon] == 30
                  ? Colors.white
                  : AppColors.lightYellow,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
