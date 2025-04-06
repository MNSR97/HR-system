import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr/widgets/another_custom_widgets/custom_divider.dart';
import 'package:hr/widgets/another_custom_widgets/custom_text.dart';

import '../../constants/constance.dart';
import '../../helper/extentions.dart';
import '../../preferences.dart';

class CustomSizeGuideDialog extends StatefulWidget {
  final dynamic dataMenSize;
  final dynamic dataWomenSize;

  const CustomSizeGuideDialog(
      {super.key, required this.dataMenSize, required this.dataWomenSize});

  @override
  _CustomSizeGuideDialogState createState() => _CustomSizeGuideDialogState();
}

class _CustomSizeGuideDialogState extends State<CustomSizeGuideDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize
                .min, // Ensure the dialog takes minimum space needed
            children: [
              appSizeHeight(appSizeHeight: 18),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * (20 / 360)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                    CustomText(
                      text: 'AppText.WomenSizeChart',
                      fontSize: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      child: Icon(
                        Icons.close,
                        color: FontColor.fontBlack,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }
}
