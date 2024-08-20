import 'package:cms_app/features/dash_board/presentation/data/patient_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/sized_box/sized_box.dart';
import '../../../../common/widgets/custom_text.dart';
import '../data/appointment_summary.dart';
import '../data/dashboard_summary.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedClinic = "VM CLINIC";
  final List<String> clinics = ["VM CLINIC", "TMC Clinic", "ZARA Clinic","Docto Clinic"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: SmallCurveClipper(),
            child: Container(
              height: 110,
              color: const Color(0xff01BFE1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/logo.png", width: 30, height: 30),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              dropdownColor: const Color(0xff01BFE1),
                              value: selectedClinic,
                              items: clinics.map((String clinic) {
                                return DropdownMenuItem<String>(
                                  value: clinic,
                                  child: Text(
                                    clinic,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedClinic = newValue!;
                                });
                              },
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 20),
                            Icon(Icons.login, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120,left: 15,right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text("GoodMorning",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" Dr IQBAL,",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff01BFE1)),)
                    ],
                  ),
                  SizedBoxes.smallSizedBox,
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFD0F8FF),
                          Color(0xFFEAF8FF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xff01BFE1),
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage: AssetImage("assets/doctor3.png"),
                                radius: 27,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,                        children: [
                              Text(" Muhammed Iqbal VM",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff01BFE1)),),
                              Text(" view profile ",style: TextStyle(color: Color(0xff9BD0D9)),),
                            ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBoxes.smallSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Appointments",style: TextStyle(fontWeight: FontWeight.w500),),
                          SizedBox(width: 10,),
                          CircleAvatar(minRadius:13 ,backgroundColor: Color(0xFFD0F8FF),child: Text("20",style: TextStyle(fontSize: 12,color: Color(0xff0867A6)),),)
                        ],
                      ),
                      IconButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(const Size(10, 10)),
                          backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
                        ),
                        onPressed: () {},
                        icon:const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
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
                    ],
                  ),
                  SizedBoxes.smallSizedBox,
                  SizedBox(
                    height: 150,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return   Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 240,
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xff01BFE1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child:  CircleAvatar(
                                        backgroundImage: AssetImage( AppointmentSummary[index]['imagePath']),
                                      ),
                                    ),

                                    const SizedBox(width: 15),
                                    Text(
                                      AppointmentSummary[index]['name'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 70,
                                ),
                              ),
                              Positioned(
                                bottom: 40,
                                left: 10,
                                right: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month,color: Color(0xff7D8F92),),
                                        SizedBox(width: 10),
                                        Text(AppointmentSummary[index]['date'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.watch_later_outlined,color: Color(0xff7D8F92),),
                                        SizedBox(width: 10),
                                        Text(AppointmentSummary[index]['time'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 17,
                                left: 10,
                                right: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("with ",style: TextStyle(color: Color(0xff7D8F92)),),
                                    Text(AppointmentSummary[index]['dname'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },scrollDirection: Axis.horizontal,itemCount:AppointmentSummary.length,),
                  ),
                  SizedBoxes.smallSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Patients",style: TextStyle(fontWeight: FontWeight.w500),),
                          SizedBox(width: 10,),
                          CircleAvatar(minRadius:13 ,backgroundColor: Color(0xFFD0F8FF),child: Text("89",style: TextStyle(fontSize: 12,color: Color(0xff0867A6)),),)
                        ],
                      ),
                      IconButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(const Size(10, 10)),
                          backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
                        ),
                        onPressed: () {},
                        icon:const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
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
                    ],
                  ),
                  SizedBoxes.normalSizedBox,
                  SizedBox(
                    height: 150,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                              image: AssetImage(patientSummary[index]['imagePath'],),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),color: Colors.black.withOpacity(0.6),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              child:  Text(
                                patientSummary[index]['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },itemCount: patientSummary.length,scrollDirection: Axis.horizontal,),
                  ),
                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBoxes.normalSizedBox,
                            CustomText(text:dashboardSummary[index]['title'],),
                            SizedBoxes.smallSizedBox,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(children: [
                                  Positioned(
                                      top:20,
                                      left: -2,
                                      child: Image(image: AssetImage("assets/Vector 3.png"))),
                                  Image(image: AssetImage(dashboardSummary[index]['imagePath']),width: 180,),
                                  Positioned(
                                      top: 30,
                                      left: 200,
                                      child: Text(dashboardSummary[index]['count'],style: TextStyle(color: Color(0xff01BFE1),fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Positioned(
                                      top: 60,
                                      left: 180,
                                      child: Text(dashboardSummary[index]['subtitle'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),)),

                                ],),
                              ),
                            ),
                          ],
                        );
                      },itemCount:dashboardSummary.length,scrollDirection: Axis.vertical,),
                  )




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}



