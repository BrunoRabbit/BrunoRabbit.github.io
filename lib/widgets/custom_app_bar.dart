import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.titleFontSize,
    this.automaticallyImplyLeading,
    this.actions,
  });

  final String title;
  final Widget? leading;
  final double? titleFontSize;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 1.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        centerTitle: false,
        backgroundColor: Colors.white,
        surfaceTintColor: AppColors.white,
        actions: actions,
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: titleFontSize,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(context, shrinkOffset, overlapsContent) {
//     bool isExpanded = shrinkRate(shrinkOffset) == 1;
//     double fontSize = isExpanded ? 14.0 : 24.0;

//     return AppBar(
//       backgroundColor:
//           !isExpanded ? AppColors.backgroundColor : AppColors.white,
//       shadowColor: Colors.transparent,
//       surfaceTintColor: Colors.transparent,
//       // actions: [
//       // Text(
//       //   'Portfolio',
//       //   style: TextStyles.body.copyWith(
//       //     color: AppColors.purple,
//       //     fontFamily: 'Scada',
//       //     fontWeight: FontWeight.w600,
//       //   ),
//       // ),
//       //   const SizedBox(width: 20),
//       // ],
//       flexibleSpace: FlexibleSpaceBar.createSettings(
//         maxExtent: maxExtent,
//         minExtent: minExtent,
//         child: Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 70),
//             child: AnimatedDefaultTextStyle(
//               duration: const Duration(milliseconds: 200),
//               style: TextStyle(
//                 fontSize: fontSize,
//                 color: AppColors.blackGrey,
//                 fontFamily: 'Scada',
//                 fontWeight: FontWeight.w900,
//               ),
//               child: const Text('Bruno Coelho'),
//             ),
//           ),
//         ),
//         currentExtent: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 80.0;

//   @override
//   double get minExtent => kToolbarHeight;

//   double get delta => maxExtent - minExtent;

//   double shrinkRate(double shrinkOffset) {
//     return (shrinkOffset / delta).clamp(0.0, 1.0);
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       true;
// }
