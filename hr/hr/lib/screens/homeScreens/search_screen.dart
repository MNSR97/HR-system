//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hr/constants/constance.dart';
//
// class SearchScreen extends StatelessWidget {
//   final dynamic searchController;
//   final dynamic onQueryChanged;
//   final dynamic onPressedClose;
//   const SearchScreen({super.key, required this.searchController,required this.onQueryChanged,required this.onPressedClose});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       child: SearchBar(
//
//         controller: searchController,
//         onQueryChanged: onQueryChanged,
//         onPressedClose: onPressedClose,
//       ),
//     );
//   }
// }
//
// class SearchBar extends StatelessWidget {
//   final TextEditingController controller;
//   final dynamic onPressedClose;
//   final ValueChanged<String> onQueryChanged;
//
//   const SearchBar({
//     super.key,
//     required this.controller,
//     required this.onQueryChanged,required this.onPressedClose,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // padding: EdgeInsets.all(16),
//
//       width: Get.width,
//       height: Get.height* ( 51 / 800),
//
//       child: TextField(
//         controller: controller,
//         onChanged: onQueryChanged,
//         decoration: InputDecoration(
//           hintText: 'AppText.Search',
//           hintStyle: TextStyle(
//             fontSize: 14,
//             color: FontColor.fontBlack,
//             fontWeight: FontWeight.w500,
//           ),
//           // contentPadding: EdgeInsets.only(
//           //   top: Get.height * (18 / 800),
//           //   bottom: Get.height * (12 / 800),
//           // ),
//           fillColor: Colors.black,
//           prefixIconColor: FontColor.fontBlack,
//           suffixIconColor: FontColor.fontBlack,
//           prefixIcon:  Image.asset(AppImage.search),
//           // enabledBorder: UnderlineInputBorder(
//           //   borderSide: BorderSide(color: Colors.grey),
//           // ),
//           border: InputBorder.none,
//           suffixIcon: IconButton(
//             icon: Icon(Icons.close),
//             onPressed: onPressedClose,
//           ),
//         ),
//       ),
//     );
//   }
// }
