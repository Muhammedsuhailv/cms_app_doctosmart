import 'package:cms_app/common/widgets/custom_eleveated_btn.dart';
import 'package:flutter/material.dart';

import '../../../../common/sized_box/sized_box.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text.dart';
import '../../../../common/widgets/custom_textfiled.dart';

class PrescriptionPopup extends StatefulWidget {
  const PrescriptionPopup({super.key});

  @override
  State<PrescriptionPopup> createState() => _PrescriptionPopupState();
}

class _PrescriptionPopupState extends State<PrescriptionPopup> {
  @override
  Widget build(BuildContext context) {
    String selectedDoctor = 'Doctor';
    String selectedDate = 'Date';
    String selectedDose = 'Dosage';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Prescription",
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
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Medicine"),
              SizedBoxes.smallSizedBox,
              CustomDropdown(
                hint: "Medicine",
                items: const [
                  'Omeprazole',
                  'Metoprolol',
                  'Albuterol',
                  'Dolo',
                  'Amoxicillin'
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value!;
                  });
                },
                value: selectedDoctor,
              ),
              SizedBoxes.smallSizedBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Dosage"),
                  CustomText(text: "Frequency"),
                  SizedBox(
                    width: 0.2,
                  )
                ],
              ),
              SizedBoxes.smallSizedBox,
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      hint: "Dosage",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDropdown(
                      hint: "Mg",
                      items: const ['Mg', 'g', 'ml'],
                      onChanged: (value) {
                        setState(() {
                          selectedDose = value!;
                        });
                      },
                      value: selectedDose,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFE0F7FA),
                              hintText: '0',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('-'),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFE0F7FA),
                              hintText: '0',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('-'),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFE0F7FA),
                              hintText: '0',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Timing"),
              SizedBoxes.smallSizedBox,
              CustomDropdown(
                hint: "Medicine Timing",
                items: const ['After Food', 'Before Food', 'With Food'],
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value!;
                  });
                },
                value: selectedDoctor,
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Duration"),
              SizedBoxes.smallSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: CustomTextfield(
                      hint: "Duration",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      width: 50,
                      child: CustomDropdown(
                        hint: "Days",
                        items: const ['Days', 'Weeks', 'Months'],
                        onChanged: (value) {
                          setState(() {
                            selectedDate = value!;
                          });
                        },
                        value: selectedDate,
                      ),
                    )

                  ),
                ],
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Note"),
              SizedBoxes.smallSizedBox,
              CustomTextfield(
                maxLines: 3,
                hint: "Enter notes here",
              ),
              SizedBoxes.normalSizedBox,
              const CustomButton(text: "ADD"),
            ],
          ),
        ),
      ),
    );
  }
}
