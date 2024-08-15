import 'package:cms_app/common/widgets/custom_dropdown.dart';
import 'package:cms_app/common/widgets/custom_eleveated_btn.dart';
import 'package:cms_app/common/widgets/custom_text.dart';
import 'package:cms_app/common/widgets/custom_textfiled.dart';
import 'package:cms_app/common/sized_box/sized_box.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/tooth_selection_dropdwon.dart';

class DentalTestAdd extends StatefulWidget {
  const DentalTestAdd({super.key});

  @override
  State<DentalTestAdd> createState() => _DentalTestAddState();
}

class _DentalTestAddState extends State<DentalTestAdd> {
  String selectedDoctor = 'Doctor';
  String workName = 'work';
  String alloyType = 'alloy';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dental Test",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Doctor"),
              CustomDropdown(
                hint: "doctor",
                items: const ['Muhammed iqbal', 'Saif Ali', 'Thomas', 'Devid', 'Kumar'],
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value!;
                  });
                },
                value: selectedDoctor,
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Work Name"),
              CustomDropdown(
                hint: "select work name",
                items: const [
                  'Work one',
                  'Work Two',
                  'Work Three',
                  'Work four',
                ],
                onChanged: (value) {
                  setState(() {
                    workName = value!;
                  });
                },
                value: workName,
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Shade"),
              SizedBoxes.smallSizedBox,
              CustomTextfield(
                hint: "shade",
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Tooth No"),
              SizedBoxes.smallSizedBox,
              const ToothSelection(),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Note"),
              SizedBoxes.smallSizedBox,
              CustomTextfield(
                maxLines: 3,
                hint: "Enter notes here",
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Work type"),
              SizedBoxes.smallSizedBox,
              CustomTextfield(
                hint: "work type",
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Alloy Type"),
              SizedBoxes.smallSizedBox,
              CustomDropdown(
                hint: "alloy type",
                items: const [
                  'alloy one',
                  'alloy Two',
                  'alloy Three',
                  'alloy four',
                ],
                onChanged: (value) {
                  setState(() {
                    alloyType = value!;
                  });
                },
                value: alloyType,
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Tooth No"),
              SizedBoxes.smallSizedBox,
              CustomTextfield(
                hint: "select tooth no",
              ),
              SizedBoxes.smallSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Charge"),
                    SizedBoxes.smallSizedBox,
                    Container(
                      height: 50,
                      width: screenWidth*0.39,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF1FDFF)),
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("₹ ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff01BFE1)),),
                            Text("00.00",style:TextStyle(fontWeight: FontWeight.bold), )
                          ],),
                      ),
                    ),
                  ],
                ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: "Discount"),
                      SizedBoxes.smallSizedBox,
                      Container(
                        height: 50,
                        width: screenWidth*0.39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffF1FDFF)),
                        child:const  Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("% ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff01BFE1)),),
                              Text("00.00",style:TextStyle(fontWeight: FontWeight.bold), )
                            ],),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBoxes.normalSizedBox,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:const Color(0xffF1FDFF)),
                child: const Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Net Amount :",style: TextStyle(color: Color(0xff0867A6)),),
                      Text("₹24000",style: TextStyle(color: Color(0xff0867A6)), )
                    ],),
                ),
              ),
              SizedBoxes.largeSizedBox,
           const CustomButton(text: "SUBMIT"),
            ],
          ),
        ),
      ),
    );
  }
}
