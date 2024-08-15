import 'package:cms_app/common/sized_box/sized_box.dart';
import 'package:cms_app/features/prescription/presentation/pages/prescription_popup.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_eleveated_btn.dart';
import '../../../../common/widgets/custom_text.dart';
import '../../../../common/widgets/custom_textfiled.dart';
class PrescriptionAdd1 extends StatefulWidget {
  const PrescriptionAdd1({super.key});

  @override
  State<PrescriptionAdd1> createState() => _PrescriptionAdd1State();
}

class _PrescriptionAdd1State extends State<PrescriptionAdd1> {
  String selectedDoctor = 'Doctor';
  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
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
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Text("Add Clinic Note :",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff01BFE1)),),
                      Icon(Icons.event_note,color: Color(0xff01BFE1),)
                    ],),
                ),
              ),

              SizedBoxes.smallSizedBox,
              const CustomText(text: "Date"),
              SizedBoxes.smallSizedBox,
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => _selectDate(context),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Color(0xff01BFE1),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF1FDFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style:const TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxes.smallSizedBox,
              const CustomText(text: "Doctor"),
              SizedBoxes.smallSizedBox,
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
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(text: "Medicines"),
                  Row(
                    children: [
                      const Text(
                        "Add Medicine",
                        style: TextStyle(color: Color(0xff01BFE1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          iconSize: 15,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PrescriptionPopup(),));
                          },
                          icon: const Icon(Icons.add, color: Colors.white),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(const Color(0xff01BFE1)),
                          ),
                        ),
                      ),
                    ],
                  )
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
              const CustomButton(text: "SUBMIT"),
            ],
          ),
        ),
      ),
    );
  }
}
