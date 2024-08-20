import 'package:cms_app/common/sized_box/sized_box.dart';
import 'package:cms_app/common/widgets/custom_eleveated_btn.dart';
import 'package:cms_app/common/widgets/custom_text.dart';
import 'package:cms_app/common/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class AddTreatment extends StatelessWidget {
  const AddTreatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Treatment",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size(10, 10)),
            backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0867A6),
              size: 16,
            ),
          ),
          constraints: const BoxConstraints(
            maxHeight: 30,
            maxWidth: 30,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomText(text: "Treatment Name"),
            SizedBoxes.smallSizedBox,
            CustomTextfield(hint: "name",),
            SizedBoxes.smallSizedBox,
            CustomText(text: "Treatment  Code"),
            SizedBoxes.smallSizedBox,
            CustomTextfield(hint: "Code",),
            SizedBoxes.smallSizedBox,
            CustomText(text: "Charge"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("₹",style: TextStyle(color: Color(0xff01BFE1),fontSize: 17,fontWeight: FontWeight.bold),),],
            ),
            SizedBoxes.smallSizedBox,
            CustomText(text: "Duration"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.watch_later_outlined,color: Color(0xff01BFE1),)
              ],
            ),
            SizedBoxes.normalSizedBox,
            CustomButton(text: "SUBMIT")
          ],
        ),
      ),
    );
  }
}
