import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Response {
  int _statusCode;
  dynamic _object;


  Response(this._statusCode, this._object);

  dynamic get object => this._object;

  set object(dynamic value) {
    this._object = value;
  }

  int get statusCode => this._statusCode;

  set statusCode(int value) {
    this._statusCode = value;
  }
}
Future<Response> getUserInfoRQ({String token}) async {



  String url = baseUrl + 'api/Account/UserInfo';
  print('url  = $url');



  try {
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' +token
      },
    );
    var res = json.decode(response.body);
    print('code  = ${response.statusCode}');
    print('response  = ${response.body}');
    if (response.statusCode == 200) {



      UserInfoModel userInfoModel=UserInfoModel.fromJson(res);
      userInfo=userInfoModel;





      return new Response(200,userInfoModel);

    }
    else if(response.statusCode==401){
      if(res['Message']!=null){
        showToast(res['Message']);
        return new Response(response.statusCode, res['Message']);}
      else {         showToast(forbiddenRequest);
      return new Response(response.statusCode,forbiddenRequest );}

    }


    else  {
      if(res['error_description']!=null){
        showToast(res['Message']);
        return new Response(response.statusCode, res['Message']);}
      else  {

        showToast(failedOpreation);
        return new Response(response.statusCode, failedOpreation);}

    }
  }
  on TimeoutException catch (_) {
    showToast(checkEnternet);
    return Response(-1000, checkEnternet);
  }

  catch (e) {
    print(e);
    showToast(failedOpreation);
    return new Response(-1, failedOpreation);
  }
}