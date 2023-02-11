// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

List<Map> doctors = [
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  }
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bglight,
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: MyColors.bg01,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.chevron_left)),
        flexibleSpace: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(50, 10, 20, 10),
            child: const SearchInput(),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          for (var doctor in doctors)
            TopDoctorCard(
              img: doctor['img'],
              doctorName: doctor['doctorName'],
              doctorTitle: doctor['doctorTitle'],
            )
        ],
      ),
    );
  }
}

class TitleAndSeeAllRow extends StatelessWidget {
  //
  const TitleAndSeeAllRow({
    super.key,
    required this.title,
    required this.onSeeAllClick,
  });

  final String title;
  final void Function() onSeeAllClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kTitleStyle,
        ),
        TextButton(
          child: Text(
            'See All',
            style: TextStyle(
              color: MyColors.yellow01,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onSeeAllClick,
        )
      ],
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  final String img;
  final String doctorName;
  final String doctorTitle;

  const TopDoctorCard({
    Key? key,
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: MyColors.grey01,
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: MyColors.header01,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: MyColors.grey02,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: MyColors.yellow02,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: MyColors.grey02),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.bg,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: MyColors.purple02,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: MyColors.purple01,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
