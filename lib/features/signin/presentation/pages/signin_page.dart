import 'package:cms_app/common/widgets/custom_eleveated_btn.dart';
import 'package:cms_app/common/widgets/custom_text.dart';
import 'package:cms_app/common/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

import '../../../../common/sized_box/sized_box.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01BFE1),
      body:Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBoxes.normalSizedBox,
                      Row(
                        children: [
                          SizedBoxes.normalSizedBox,
                          Image(image: AssetImage("assets/logo.png"),width: 30,height: 30,),
                          SizedBox(width: 10,),
                          Text("doctosmart",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                        Image(image: AssetImage("assets/signin.png"))
                      ],)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "Username"),
                        SizedBoxes.smallSizedBox,
                        CustomTextfield(hint:"eg Dr Smith",),
                        SizedBoxes.normalSizedBox,
                        const CustomText(text: "Password"),
                        SizedBoxes.smallSizedBox,
                        CustomTextfield(hint:"Password",),
                        SizedBoxes.normalSizedBox,
                        const CustomText(text: "Clinic ID"),
                        SizedBoxes.smallSizedBox,
                        CustomTextfield(hint:"id",),
                        SizedBoxes.normalSizedBox,
                        const CustomButton(text: "Login"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
