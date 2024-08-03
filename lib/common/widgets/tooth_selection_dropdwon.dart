import 'package:flutter/material.dart';

class ToothSelection extends StatefulWidget {
  const ToothSelection({super.key});

  @override
  State<ToothSelection> createState() => _ToothSelectionState();
}

class _ToothSelectionState extends State<ToothSelection> {

  final List<bool> selectedItems = List.filled(5, false);

  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';


  final List<Map<String, dynamic>> items = [
    {'image': 'assets/teeth.png', 'text': '3rd Molar (Wisdom tooth)', 'number': 30},
    {'image': 'assets/teeth.png', 'text': '2nd Molar (12-yr molar)', 'number': 22},
    {'image': 'assets/teeth.png', 'text': '1st Molar (6-yr molar)', 'number': 43},
    {'image': 'assets/teeth.png', 'text': '2nd Bicuspid (2nd premolar)', 'number': 32},
    {'image': 'assets/teeth2.png', 'text': '1st Bicuspid (1st premolar)', 'number': 32},
  ];

  List<Map<String, dynamic>> get filteredItems => items
      .where((item) => item['text'].toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Color(0xffF1FDFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: const Text('select tooth'),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xff01BFE1),
            size: 24,
          ),
          items: [
            DropdownMenuItem<String>(
              enabled: false,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF3F3F3),
                  hintText: 'Search tooth',
                  border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
            ...filteredItems.map((item) {
              final index = filteredItems.indexOf(item);

              return DropdownMenuItem<String>(
                value: item['text'] as String,
                child: ListTile(
                  leading: Image.asset(item['image'] as String, width: 40, height: 40),
                  title: Text(item['text'] as String),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(style: TextStyle(color: Color(0xff0867A6)),item['number'].toString()),
                      SizedBox(width: 10,),
                      Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: selectedItems[index] ? Colors.blue : Color(0xff01BFE1),
                            width: 2,
                          ),
                        ),
                        child: selectedItems[index]
                            ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        )
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}

