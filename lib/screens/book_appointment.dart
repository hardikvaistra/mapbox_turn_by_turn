// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class Data {
  IconData icon;
  String lable;
  List<String> times;

  Data({
    required this.icon,
    required this.lable,
    required this.times,
  });
}

class FeesInformation {
  IconData icon;
  String title;
  String subtitle;
  String rupees;

  FeesInformation({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.rupees,
  });
}

class _BookAppointmentState extends State<BookAppointment> {
  int _selectedTimePhaseIndex = 0;
  int _selectedTimeIndex = 0;
  int _selectedFeeInfomation = 0;

  final List<Data> _choiceChipsList = [
    Data(
      icon: Icons.wb_sunny,
      lable: "Morning",
      times: [
        "09:30 AM",
        "10:00 AM",
        "10:30 AM",
        "11:00 AM",
        "11:30 AM",
      ],
    ),
    Data(
      icon: Icons.lunch_dining,
      lable: "Afternoon",
      times: [
        "12:00 PM",
        "12:30 PM",
        "01:00 PM",
        "01:30 PM",
      ],
    ),
    Data(
      icon: Icons.beach_access,
      lable: "Evening",
      times: [
        "04:00 PM",
        "04:30 PM",
        "05:00 PM",
        "05:30 PM",
        "06:00 PM",
        "06:30 PM",
      ],
    ),
  ];

  final feesInfo = <FeesInformation>[
    FeesInformation(
        icon: Icons.call,
        title: "Call",
        subtitle: "You can call the Doctor",
        rupees: "₹100"),
    FeesInformation(
        icon: Icons.home,
        title: "Home Visit",
        subtitle: "Doctor will visit your Home",
        rupees: "₹450"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: MyColors.bg01,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 28,
          ),
        ),
        title: const Text("Book Appointment"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Appointment Date",
                    style: kFilterStyle2,
                  ),
                  const SizedBox(height: 10),
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate:
                        DateTime.now().add(const Duration(days: 1)),
                    selectionColor: MyColors.primary,
                    selectedTextColor: Colors.white,
                    dateTextStyle: defaultDateTextStyle.copyWith(
                        color: Colors.grey.shade600),
                    dayTextStyle: defaultDayTextStyle.copyWith(
                        color: Colors.grey.shade600),
                    monthTextStyle: defaultMonthTextStyle.copyWith(
                        color: Colors.grey.shade600),
                    onDateChange: (date) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Appointment Time",
                    style: kFilterStyle2,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Wrap(
                      spacing: 6,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: choiceTimePhase(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Wrap(
                      spacing: 4,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: choiceChips(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Fees Information",
                    style: kFilterStyle2,
                  ),
                  const SizedBox(height: 10),
                  ...feeInformation(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primary,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Pay For Appointment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> feeInformation() {
    List<Widget> listItem = [];
    for (int i = 0; i < feesInfo.length; i++) {
      Widget item = Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () => setState(() {
            _selectedFeeInfomation = i;
          }),
          child: Container(
            decoration: BoxDecoration(
              border: i == _selectedFeeInfomation
                  ? Border.all(width: 2, color: MyColors.bg01)
                  : null,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    feesInfo[i].icon,
                    color: MyColors.bg01,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.bg02,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feesInfo[i].title,
                        style: TextStyle(
                          color: MyColors.header01,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        feesInfo[i].subtitle,
                        style: TextStyle(
                          color: MyColors.grey02,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 60,
                  child: Center(
                      child: Text(
                    feesInfo[i].rupees,
                    style: TextStyle(
                      color: MyColors.grey02,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      );

      listItem.add(item);
    }
    return listItem;
  }

  List<Widget> choiceTimePhase() {
    List<Widget> chips = [];
    for (int i = 0; i < _choiceChipsList.length; i++) {
      Widget item = ChoiceChip(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _choiceChipsList[i].icon,
              color: _selectedTimePhaseIndex == i ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 5),
            Text(_choiceChipsList[i].lable),
          ],
        ),
        labelStyle: TextStyle(
          color: _selectedTimePhaseIndex == i ? Colors.white : Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        selected: _selectedTimePhaseIndex == i,
        backgroundColor: MyColors.bg,
        elevation: 2,
        selectedColor: MyColors.primary,
        onSelected: (bool value) {
          setState(() {
            _selectedTimePhaseIndex = i;
          });
        },
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0;
        i < _choiceChipsList[_selectedTimePhaseIndex].times.length;
        i++) {
      Widget item = ChoiceChip(
        label: Text(_choiceChipsList[_selectedTimePhaseIndex].times[i]),
        labelStyle: TextStyle(
          color: _selectedTimeIndex == i ? MyColors.primary : Colors.black,
        ),
        backgroundColor: MyColors.bg03,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          side: _selectedTimeIndex == i
              ? BorderSide(color: MyColors.primary)
              : BorderSide.none,
        ),
        selected: _selectedTimeIndex == i,
        selectedColor: Colors.white,
        onSelected: (bool value) {
          setState(() {
            _selectedTimeIndex = i;
          });
        },
      );
      chips.add(item);
    }
    return chips;
  }
}
