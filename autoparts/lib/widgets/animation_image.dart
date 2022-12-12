// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';


// class ImageAnimation extends StatefulWidget {
//   final Size size;
//   const ImageAnimation({
//     super.key,
//     required this.size,
//   });

//   @override
//   State<ImageAnimation> createState() => _ImageAnimationState();
// }

// class _ImageAnimationState extends State<ImageAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   late final Animation<Offset> _animation = Tween(
//     begin: Offset.zero,
//     end: const Offset(0, 0.08),
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeInOut,
//   ));

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SlideTransition(
//       position: _animation,
//       child: SvgPicture.asset(
//         AssetsApp.chat,
//         height: size.height * 0.45,
//       ),
//     );
//   }
// }
