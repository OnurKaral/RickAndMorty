import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Function(String, String) onFilterChanged; // Callback function
  const CustomBottomSheet({super.key, required this.onFilterChanged});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String selectedStatus = "alive";
  String selectedGender = "male";

  void selectStatus(String status) {
    setState(() {
      selectedStatus = status;
    });
  }

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void applyFilter() {
    widget.onFilterChanged(selectedStatus, selectedGender);
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          const Text(
            textAlign: TextAlign.center,
            "Filter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text("Status:"),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FilterButton("Alive", selectedStatus == "alive",
                  () => selectStatus("alive")),
              FilterButton(
                  "Dead", selectedStatus == "dead", () => selectStatus("dead")),
              FilterButton("Unknown", selectedStatus == "unknown",
                  () => selectStatus("unknown")),
            ],
          ),
          const SizedBox(height: 8),
          const Text("Gender:"),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              FilterButton(
                  "Male", selectedGender == "male", () => selectGender("male")),
              FilterButton("Female", selectedGender == "female",
                  () => selectGender("female")),
              FilterButton("Genderless", selectedGender == "genderless",
                  () => selectGender("genderless")),
              FilterButton("Unknown", selectedGender == "unknown",
                  () => selectGender("unknown")),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: applyFilter,
            child: const Text("Apply"),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterButton(this.label, this.selected, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            selected ? Colors.lightBlueAccent : Colors.white),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
