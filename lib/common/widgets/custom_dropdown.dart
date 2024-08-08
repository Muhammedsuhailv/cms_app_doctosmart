import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String? selectedItem;
  final String? hint;

  const CustomDropdown({
    required this.items,
    this.onChanged,
    this.selectedItem,
    this.hint, required String value,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: const Color(0xffF1FDFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              
              isExpanded: true,
              value: selectedItem,
              hint: widget.hint != null ? Text(widget.hint!) : null,
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xff01BFE1),
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
