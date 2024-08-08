import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: ElevatedButton(
              style:const  ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(100, 50)),
                  backgroundColor:
                  WidgetStatePropertyAll (Color(0xff01BFE1)
                  ),
              ),
              onPressed: () {},
              child:Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
          ),
      );
  }
}
