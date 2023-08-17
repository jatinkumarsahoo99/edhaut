import 'package:edhaut/app/data/Constants.dart';
import 'package:edhaut/app/modules/performancescreen/views/result_component.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/performancescreen_controller.dart';
import '../data/ResultDataModel.dart';

class PerformancescreenView extends GetView<PerformancescreenController> {
  const PerformancescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(3.h),
            height: 20.h,
            child: CustomPaint(
              foregroundPainter: CircularPainter(
                width: 5.w,
                backgroundColor: kPrimaryColor,
                lineColor: kOtherColor
              ),
              child: Center(
                child: Text('550 / 700',textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1),
              ),
            ),
          ),
          Text(
            "You are excellent",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "Aisha!!",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: kTopBorderRadius, color: kOtherColor),
            child: ListView.builder(
                itemCount: result.length,
                padding: EdgeInsets.all(kDefaultPadding),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: kDefaultPadding),
                    padding: EdgeInsets.all(kDefaultPadding / 2),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        boxShadow: [
                          BoxShadow(color: kTextLightColor, blurRadius: 2.0)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              result[index].subjectName ?? "",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${result[index].obtainedMarks} / ${result[index].totalMarks}",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width:
                                          result[index].totalMarks?.toDouble(),
                                      height: 2.h,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding))),
                                    ),
                                    Container(
                                      width: result[index]
                                          .obtainedMarks
                                          ?.toDouble(),
                                      height: 2.h,
                                      decoration: BoxDecoration(
                                          color: (result[index].grade == 'D')
                                              ? kErrorBorderColor
                                              : kOtherColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  kDefaultPadding),
                                              bottomRight: Radius.circular(
                                                  kDefaultPadding))),
                                    )
                                  ],
                                ),
                                Text(
                                  result[index].grade ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(fontWeight: FontWeight.w900),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
