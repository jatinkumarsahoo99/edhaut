import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/OtherMsgWidget.dart';
import '../../../widgets/OwnMsgWidget.dart';
import '../controllers/groupchatscreen_controller.dart';


class GroupchatscreenView extends GetView<GroupchatscreenController> {
   GroupchatscreenView({Key? key}) : super(key: key);
   GroupchatscreenController controller = Get.find<GroupchatscreenController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Chat'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          GetBuilder<GroupchatscreenController>(
            id: "chat",
            builder: (context) {
              return Expanded(
                  child: ListView.builder(
                      itemBuilder: (context,index){
                        if(controller.loginResponseModel!.body![0].userId == controller.listMsg[index].userId){
                          return OwnMsgWidget(sender:controller.listMsg[index].sender ,msg: controller.listMsg[index].msg,);
                        }else{
                          return OtherMsgWidget(sender: controller.listMsg[index].sender,msg: controller.listMsg[index].msg,);
                        }
                      },
                    itemCount: controller.listMsg.length,
                  ),
              );
            }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.msgController,
                    decoration: InputDecoration(
                      hintText: "Type here ...",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          width: 2
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if(controller.msgController!.text.isNotEmpty)
                            {
                              controller.sendMsg(controller.msgController!.text,
                                  controller.loginResponseModel!.body![0].name?? 'JKS',
                                  controller.loginResponseModel!.body![0].userId??"");
                          }else{
                            print("empty");
                          }

                        },
                      icon: Icon(Icons.send,
                      color: Colors.teal,
                        size: 26,
                      ),
                      )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
