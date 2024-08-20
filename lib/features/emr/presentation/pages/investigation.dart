import 'package:cms_app/common/sized_box/sized_box.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_textfiled.dart';

class investigation extends StatelessWidget {
  const investigation({super.key});

  @override
  Widget build(BuildContext context) {
    List <Map<String,dynamic>>observationsSummary=[
      {
        'title':'Swelling',
      },
      {
        'title':'Redness',
      },
      {
        'title':'Rashes',
      },
      {
        'title':'Warmth to the touch',
      },
      {
        'title':'Instability',
      },
      {
        'title':'Weakness',
      },
      {
        'title':'Acne',
      },
      {
        'title':'Tumor',
      },
    ];
    void _showObservationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Diagnosis',style: TextStyle(fontWeight: FontWeight.w600),),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Complaint Name'),
                const SizedBox(height: 10),
                CustomTextfield(hint: "name",clr: Color(0xffF7F7F7),)
              ],
            ),
            actions: [
              TextButton(

                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xff01BFE1))),
                onPressed: () {
                  // Handle the submit action
                  Navigator.of(context).pop();
                },
                child: const Text('Submit',style: TextStyle(color: Colors.white),),
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Complaints",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size(10, 10)),
            backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
          ),
          onPressed: () {},
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
        actions: const [
          Icon(Icons.search_rounded, color: Color(0xff01BFE1)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return  Column(
                      children: [
                        SizedBoxes.smallSizedBox,
                        Card(
                            elevation: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                  child: Text(
                                    observationsSummary[index]['title'],
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  )),
                            )),
                      ],
                    );
                  },itemCount: observationsSummary.length,),
                )
              ],
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 28,
              child: FloatingActionButton(
                onPressed:_showObservationDialog,
                backgroundColor: const Color(0xff01BFE1),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
