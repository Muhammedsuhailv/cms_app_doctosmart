import 'package:cms_app/common/sized_box/sized_box.dart';
import 'package:cms_app/common/widgets/custom_text.dart';
import 'package:cms_app/features/emr/presentation/data/emr_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Emr extends StatelessWidget {
  const Emr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "EMR",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size(10, 10)),
            backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
          ),
          onPressed: () {},
          icon:const Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff0867A6),
              size: 16,
            ),
          ),
          constraints:const BoxConstraints(
            maxHeight: 30,
            maxWidth: 30,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: "Electronic Medical Records "),
            SizedBoxes.normalSizedBox,
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(emrSummary[index]["imagePath"])),
                            SizedBoxes.smallSizedBox,
                            Text(
                              emrSummary[index]["title"],
                              style: TextStyle(color: Color(0xff01BFE1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: emrSummary.length,
              ),
            )

          ],
        ),
      ),
    );
  }
}
