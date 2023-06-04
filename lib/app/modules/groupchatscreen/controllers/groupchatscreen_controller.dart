import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

import '../../../data/ApiFactory.dart';
import '../../../data/Const.dart';
import '../../../data/SharedPref.dart';
import '../../../widgets/MyWidget.dart';
import '../../../widgets/Snack.dart';
import '../../ConnectorController.dart';
import '../../loginscreen/NewLoginResponseModel.dart';
import '../GroupMsgModel.dart';
import '../MsgModel.dart';

class GroupchatscreenController extends GetxController {
  final count = 0.obs;
  var uuid = Uuid();
  // String? uuidNu;
  TextEditingController? msgController = new TextEditingController();
  List<MsgModel> listMsg = [];
  IO.Socket? socket;
  void connect() {

    socket = IO.io( ApiFactory.BASEURL2??  "http://192.168.0.162:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    print("we are here");
    socket!.onConnect((_) {
      print("connect");
      // socket!.emit('sendMsg','test');
      socket!.on("sendMsgServer", (msg) {
        print("msg>>>"+msg.toString());
        print("msg>>>"+loginResponseModel!.body![0].userId.toString());
        print("msg>>>"+msg['userId'].toString());
        if (msg['userId'] != loginResponseModel!.body![0].userId) {
          print("in if block");
          listMsg.add(new MsgModel(
              msg: msg['msg'],
              type: msg['type'],
              sender: msg['senderName'],
              userId: msg['userId']));
          update(['chat']);
        }

      });
    });
  }

  NewLoginResponseModel? loginResponseModel;
  SharedPref sharedPref = SharedPref();
  var login;
  Future<void> fetchLocalData() async {
    login = await sharedPref.getKey(Const.IS_LOGIN);
    // loginResponseModel = await sharedPref.getKey(Const.LOGIN_DATA);
    if (login != null && login.replaceAll("\"", "") == "true") {
      loginResponseModel = NewLoginResponseModel.fromJson(
          jsonDecode(await sharedPref.getKey(Const.LOGIN_DATA)));
    }
  }

  void sendMsg(String msg, String senderName, String userId) {
    msgController!.text = "";
    MsgModel ownMsg = new MsgModel(
        msg: msg, sender: senderName, type: "ownMsg", userId: userId);
    listMsg.add(ownMsg);
    socket!.emit('sendMsg', {
      'type': 'ownMsg',
      'msg': msg,
      'senderNamne': senderName,
      'userId': userId
    });
    Map<String, String> postData = {
      "userId": userId,
      "userName": senderName,
      "userMsg": msg,
      "timeStamp": DateTime.now().toString()
    };
    MyWidgets.showLoading3();
    Get.find<ConnectorController>().POSTMETHOD(
        api: ApiFactory.GROUPCHAT_POSTALLMSG,
        json: postData,
        fun: (Map<String, dynamic> map) {
          log(">>>>>" + map.toString());
          if (map['code'] == "sucess") {
            Get.back();
            update(['chat']);
          } else {
            Get.back();
            Snack.callError("Something went wrong");
          }
        });
  }

  getAllServerMsg() {
    MyWidgets.showLoading3();

    Get.find<ConnectorController>().GETMETHODCALL(
        api: ApiFactory.GROUPCHAT_GETALLMSG,
        fun: (Map<String,dynamic> map){
          // Get.back();
          if(map['code'] == "success"){
            Get.back();
            log("msg"+map.toString());
            GroupMsgModel groupMsgModel = GroupMsgModel.fromJson(map);
            listMsg.clear();
            for(int i=0;i<groupMsgModel.body!.length;i++){
              listMsg.add(new MsgModel(
                  msg: groupMsgModel.body![i].userMsg,
                  // type: msg['type'],
                  sender: groupMsgModel.body![i].userName,
                  userId: groupMsgModel.body![i].userId
              ));
              // Get.back();

            }
            update(['chat']);
            connect();
          }else{
            Get.back();
            Get.back();
            Snack.callError("Something went wrong");
          }
        });
  }

  @override
  void onInit() {
    // uuidNu = uuid.v1();
    fetchLocalData().then((value) {
      getAllServerMsg();
    });

    super.onInit();
  }

  @override
  void onReady() {
    /*fetchLocalData().then((value) {
      getAllServerMsg();
    });*/
    super.onReady();
  }

  @override
  void onClose() {
    socket!.close();
    super.onClose();
  }

  void increment() => count.value++;
}
