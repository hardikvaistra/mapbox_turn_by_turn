import 'package:flutter/material.dart';
import '../book_appointment.dart';
import '../../styles/colors.dart';
import '../../styles/styles.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus { upcoming, complete, cancel }

List<Map> schedules = [
  {
    'img': 'assets/doctor01.jpeg',
    'doctorName': 'Dr. Anastasya Syahid',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Monday, Aug 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.upcoming
  },
  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. John Doe',
    'doctorTitle': 'Something Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.complete
  },
  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.cancel
  },
  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.cancel
  },
];

class _ScheduleTabState extends State<ScheduleTab> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Schedule',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.bg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: LayoutBuilder(builder: (context, contraints) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (filterStatus == FilterStatus.upcoming) {
                                    status = FilterStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  } else if (filterStatus ==
                                      FilterStatus.cancel) {
                                    status = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Container(
                                constraints: contraints,
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    filterStatus.name,
                                    style: kFilterStyle,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule['img']),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctorName'],
                                    style: TextStyle(
                                      color: MyColors.header01,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['doctorTitle'],
                                    style: TextStyle(
                                      color: MyColors.grey02,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const DateTimeCard(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  child: const Text('Reschedule'),
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        const BookAppointment(),
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.bg03,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: MyColors.primary,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Mon, July 29',
                style: TextStyle(
                  fontSize: 12,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: MyColors.primary,
                size: 17,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '11:00 ~ 12:10',
                style: TextStyle(
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
