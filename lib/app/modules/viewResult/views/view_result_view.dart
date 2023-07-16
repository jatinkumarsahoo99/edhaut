import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/view_result_controller.dart';
import 'package:pdf/widgets.dart' as pw;

class ViewResultView extends GetView<ViewResultController> {
   ViewResultView({Key? key}) : super(key: key);

  ViewResultController controller = Get.find<ViewResultController>();

  pw.Widget buildHeader(pw.Context context1) {
    return pw.Container(
        height: 10,
        color: PdfColors.amber);
  }
   createTable(pw.Context context1) {


     final rows = <pw.TableRow>[];
     var widgetList = <pw.Widget>[];
     print("fun call");
     rows.add(pw.TableRow(
         children: [
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,

               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                     color: PdfColors.amber200,
                     child: pw.Text("Question",
                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                 ),
               ]),
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,

               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                     color: PdfColors.amber200,
                     child: pw.Text("Choices",
                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                 ),
               ]),
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                   color: PdfColors.amber200,
                   child: pw.Text("Selected Choice",
                       style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black)
                   ),
                 )]),
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                   color: PdfColors.amber200,
                   child: pw.Text("Correct Choice",
                       style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black)
                   ),
                 )]),
         ],
         decoration: pw.BoxDecoration(color: PdfColors.amber200)
     ));
     // controller.testDetailsModel
     if(controller.testDetailsModel != null && controller.testDetailsModel!.body!.isNotEmpty){
       for(int i=0;i<controller.testDetailsModel!.body![0].questions!.length;i++){
         List<pw.Widget> widgetList = [];
         for(int j=0;j<controller.testDetailsModel!.body![0].questions![i].choices!.length;j++){
           widgetList.add(
             pw.Row(
                 children: [
                   pw.Container(
                       child: pw.Text("${j+1}",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                   ),
                   pw.Container(
                       child: pw.Text(controller.testDetailsModel!.body![0].questions![i].choices![j].choiceName?? "JKS",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                   ),
                 ]
             ),
           );
         }

         rows.add(pw.TableRow(children: [
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,

               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                     child: pw.Text(controller.testDetailsModel!.body![0].questions![i].questionName??"",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                 ),
               ]),
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,

               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: widgetList,
               /*[
                 // controller.testDetailsModel!.body![0].questions![i].choices.
                 pw.Row(
                     children: [
                       pw.Container(
                           child: pw.Text("1.",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                       pw.Container(
                           child: pw.Text("JKS",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                     ]
                 ),
                 pw.Row(
                     children: [
                       pw.Container(
                           child: pw.Text("1.",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                       pw.Container(
                           child: pw.Text("JKS",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                     ]
                 ),
                 pw.Row(
                     children: [
                       pw.Container(
                           child: pw.Text("1.",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                       pw.Container(
                           child: pw.Text("JKS",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                     ]
                 ),
                 pw.Row(
                     children: [
                       pw.Container(
                           child: pw.Text("1.",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                       pw.Container(
                           child: pw.Text("JKS",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                       ),
                     ]
                 ),

               ]*/
           ),
           pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                   child: pw.Text("Jatin",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)
                   ),
                 )]),   pw.Column(
               mainAxisAlignment: pw.MainAxisAlignment.center,
               crossAxisAlignment: pw.CrossAxisAlignment.center,
               children: [
                 pw.Container(
                   child: pw.Text("Jatin",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)
                   ),
                 )]),
         ]));
       }
     }
     else{
       rows.clear();
       rows.add(pw.TableRow(
           children: [
             pw.Column(
                 mainAxisAlignment: pw.MainAxisAlignment.center,

                 crossAxisAlignment: pw.CrossAxisAlignment.center,
                 children: [
                   pw.Container(
                       color: PdfColors.amber200,
                       child: pw.Text("Question",
                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                   ),
                 ]),
             pw.Column(
                 mainAxisAlignment: pw.MainAxisAlignment.center,

                 crossAxisAlignment: pw.CrossAxisAlignment.center,
                 children: [
                   pw.Container(
                       color: PdfColors.amber200,
                       child: pw.Text("Choices",
                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                   ),
                 ]),
             pw.Column(
                 mainAxisAlignment: pw.MainAxisAlignment.center,
                 crossAxisAlignment: pw.CrossAxisAlignment.center,
                 children: [
                   pw.Container(
                     color: PdfColors.amber200,
                     child: pw.Text("Selected Choice",
                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black)
                     ),
                   )]),
             pw.Column(
                 mainAxisAlignment: pw.MainAxisAlignment.center,
                 crossAxisAlignment: pw.CrossAxisAlignment.center,
                 children: [
                   pw.Container(
                     color: PdfColors.amber200,
                     child: pw.Text("Correct Choice",
                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold,color: PdfColors.black)
                     ),
                   )]),
           ],
           decoration: pw.BoxDecoration(color: PdfColors.amber200)
       ));
     }

     return
       pw.Table(
         border: pw.TableBorder.all(style:pw.BorderStyle.solid),
         children:rows,
       );
   }

  Future<Uint8List> makePdf() async {
    print("generating");
    // _bgShape = await rootBundle.loadString('assets/invoice.svg');
    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
        header: buildHeader,
        footer: buildHeader,
        margin: pw.EdgeInsets.only(right: 0,left: 0,top: 0,bottom: 0),
        theme: pw.ThemeData(
          bulletStyle: pw.TextStyle(color: PdfColors.green),
        ),

        // footer: _buildFooter,
        build: (context) => [
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: pw.Container(
                width: double.maxFinite,
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    // crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          child: pw.Text("Edhaut")
                      ),
                      pw.Container(
                          child: pw.Text("Kendrapara,Odisha,India")
                      ),
                      pw.Container(
                          child: pw.Text("9178109440")
                      ),
                      pw.Container(
                          child: pw.Text("edhaut.com")
                      ),
                      pw.SizedBox(
                        height: 15
                      ),
                      pw.Container(
                          child: pw.Text("Score Sheet",style: pw.TextStyle(fontSize: 30,color: PdfColors.amber))
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Container(
                            child: pw.Text("Date: 09-07-2023")
                          ),
                          pw.SizedBox(
                            width: 35
                          )
                        ]
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.SizedBox(
                                width: 35
                            ),
                            pw.Container(
                                child: pw.Text("Candidate Details")
                            ),
                          ]
                      ),
                      pw.SizedBox(
                        height: 5
                      ),

                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.SizedBox(
                                width: 35
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Name: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("Jatin")
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            pw.SizedBox(
                              width: 10
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Department: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("Jatin")
                                          )
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 35
                            ),
                          ]
                      ),
                      pw.SizedBox(
                          height: 5
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.SizedBox(
                                width: 35
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Class: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("12th")
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 10
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Exam: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("Jatin")
                                          )
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 35
                            ),
                          ]
                      ),
                      pw.SizedBox(
                          height: 5
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.SizedBox(
                                width: 35
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Class: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("12th")
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 10
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Exam: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("Jatin")
                                          )
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 35
                            ),
                          ]
                      ),
                      pw.SizedBox(
                          height: 5
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.SizedBox(
                                width: 35
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Class: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("12th")
                                          )
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 10
                            ),
                            pw.Expanded(
                              child: pw.Row(
                                  children: [
                                    pw.Container(
                                        child: pw.Text("Exam: ")
                                    ),
                                    pw.Expanded(
                                      child:  pw.Container(
                                          decoration: pw.BoxDecoration(
                                            borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
                                            color: PdfColors.amber200,
                                          ),
                                          child:pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text("Jatin")
                                          )
                                      ),
                                    ),

                                  ]
                              ),
                            ),
                            pw.SizedBox(
                                width: 35
                            ),
                          ]
                      ),
                      pw.SizedBox(
                          height: 15
                      ),
                      (controller.withAnswer.value)? createTable(context):pw.Container()
                    ]
                )
            ),
          ),
          // createTable(context),
        ],
      ),
    );
    final output = await getTemporaryDirectory();
    controller. file = File("${output.path}/scoreCard.pdf");
    await controller.file!.writeAsBytes(
      await doc.save(),
    );
    return doc.save();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
        onPressed: () {
         Share.shareFiles([controller.file!.path], text: "Score Card");
      // rootBundle.
    },child: Icon(Icons.download)),
      body: SafeArea(
        child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("With Answer"),
                    ),
                    Obx(()=>Checkbox(value: controller.withAnswer.value,
                        onChanged: (value){
                          controller.withAnswer.value = value!;
                          controller.update(['refresh']);
                        }))

                  ],
                ),
                Expanded(
                  child: GetBuilder<ViewResultController>(
                    id: "refresh",
                    builder: (controller) {
                      return  PdfPreview(
                          onError: (BuildContext context2,Object x) {
                            return Container(
                              child: Text("Loading..."),
                            );
                          },
                          allowPrinting: false,
                          initialPageFormat: PdfPageFormat.a4,
                          maxPageWidth: double.maxFinite,
                          allowSharing: true,
                          useActions: false,
                          canChangePageFormat: false,
                          canChangeOrientation: true,
                          build: (context) => makePdf());
                    }
                  ),
                ),
              ],
            )
                ),
      ),
    );
  }
}
