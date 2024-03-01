// import '../models/userprofile_item_model.dart';
// import 'package:calender/core/app_export.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class UserprofileItemWidget extends StatelessWidget {
//   UserprofileItemWidget(
//     this.userprofileItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   UserprofileItemModel userprofileItemModelObj;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 14.h,
//         vertical: 15.v,
//       ),
//       decoration: AppDecoration.outlineBlack.copyWith(
//         borderRadius: BorderRadiusStyle.customBorderTL13,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(right: 3.h),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 9.adaptSize,
//                   width: 9.adaptSize,
//                   margin: EdgeInsets.only(
//                     top: 3.v,
//                     bottom: 2.v,
//                   ),
//                   decoration: BoxDecoration(
//                     color: appTheme.teal500,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10.h),
//                   child: Text(
//                     userprofileItemModelObj.timeText!,
//                     style: theme.textTheme.bodySmall,
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//                   height: 3.adaptSize,
//                   width: 3.adaptSize,
//                   margin: EdgeInsets.only(bottom: 11.v),
//                   decoration: BoxDecoration(
//                     color: appTheme.blueGray300,
//                     borderRadius: BorderRadius.circular(
//                       1.h,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 3.adaptSize,
//                   width: 3.adaptSize,
//                   margin: EdgeInsets.only(
//                     left: 2.h,
//                     bottom: 11.v,
//                   ),
//                   decoration: BoxDecoration(
//                     color: appTheme.blueGray300,
//                     borderRadius: BorderRadius.circular(
//                       1.h,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 3.adaptSize,
//                   width: 3.adaptSize,
//                   margin: EdgeInsets.only(
//                     left: 2.h,
//                     bottom: 11.v,
//                   ),
//                   decoration: BoxDecoration(
//                     color: appTheme.blueGray300,
//                     borderRadius: BorderRadius.circular(
//                       1.h,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8.v),
//           Text(
//             userprofileItemModelObj.designText!,
//             style: theme.textTheme.titleMedium,
//           ),
//           SizedBox(height: 7.v),
//           Text(
//             userprofileItemModelObj.startText!,
//             style: theme.textTheme.bodySmall,
//           ),
//         ],
//       ),
//     );
//   }
// }
