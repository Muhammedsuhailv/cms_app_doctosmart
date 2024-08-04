import 'package:flutter/material.dart';

class ToothSelection extends StatefulWidget {
  const ToothSelection({super.key});

  @override
  State<ToothSelection> createState() => _ToothSelectionState();
}

class _ToothSelectionState extends State<ToothSelection> {
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

  final List<Map<String, dynamic>> selectedItems = [];

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: const Color(0xffF1FDFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: const Text('Select tooth'),
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
                      fillColor: const Color(0xffF3F3F3),
                      hintText: 'Search tooth',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                ...filteredItems.map((item) {
                  final isSelected = selectedItems.contains(item);
                  return DropdownMenuItem<String>(
                    value: item['text'] as String,
                    child: ListTile(
                      leading: Image.asset(item['image'] as String, width: 40, height: 40),
                      title: Text(item['text'] as String),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['number'].toString(),
                            style: const TextStyle(color: Color(0xff0867A6)),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.blue : const Color(0xff01BFE1),
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? const Center(
                              child: Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.blue,
                              ),
                            )
                                : null,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedItems.remove(item);
                          } else {
                            selectedItems.add(item);
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ],
              onChanged: (_) {},
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 15.0,
          runSpacing: 4.0,
          children: selectedItems.map((item) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffF1FDFF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        item['image'] as String,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${item['number']}',
                        style: const TextStyle(fontSize: 12, color: Color(0xff0867A6)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  right: -25,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectedItems.remove(item);
                      });
                    },
                    icon: const Icon(Icons.close, color: Colors.white, size: 16),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff01BFE1)),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 16,
                    splashRadius: 16,
                    tooltip: 'Remove selection',
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
