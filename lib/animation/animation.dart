
// import 'package:flutter/material.dart';



// // define animated properties
// enum AniProps { opacity, translateY }

// //function to animate opacity and position on the Y axis
// class FadeCustomAnimation extends StatelessWidget {
//   final double delay;
//   final Widget? child;
//   final bool fromBottom;

//   const FadeCustomAnimation(
//       {this.delay = 1, this.child, this.fromBottom = false});

//   @override
//   Widget build(BuildContext context) {
//     final tween = TimelineTween<AniProps>()
//       ..addScene(
//               begin: const Duration(milliseconds: 0),
//               duration: const Duration(milliseconds: 500))
//           .animate(AniProps.opacity, tween: Tween<double>(begin: 0.0, end: 1.0))
//           .animate(AniProps.translateY,
//               tween: Tween<double>(begin: fromBottom ? 30.0 : -30.0, end: 0.0));

//     return PlayAnimation<TimelineValue<AniProps>>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, animation) => Opacity(
//         opacity: animation.get(AniProps.opacity),
//         child: Transform.translate(
//             offset: Offset(0, animation.get(AniProps.translateY)),
//             child: child),
//       ),
//     );
//   }
// }

// //function to animate opacity and position on the X axis
// class FadeSlideCustomAnimation extends StatelessWidget {
//   final double delay;
//   final Widget? child;

//   const FadeSlideCustomAnimation({this.delay = 1, this.child});

//   @override
//   Widget build(BuildContext context) {
//     final tween = TimelineTween<AniProps>()
//       ..addScene(
//               begin: const Duration(milliseconds: 0),
//               duration: const Duration(milliseconds: 500))
//           .animate(AniProps.opacity, tween: Tween<double>(begin: 0.0, end: 1.0))
//           .animate(AniProps.translateY,
//               tween: Tween<double>(begin: -30.0, end: 0.0));

//     return PlayAnimation<TimelineValue<AniProps>>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, animation) => Opacity(
//         opacity: animation.get(AniProps.opacity),
//         child: Transform.translate(
//             offset: Offset(animation.get(AniProps.translateY), 0),
//             child: child),
//       ),
//     );
//   }
// }
