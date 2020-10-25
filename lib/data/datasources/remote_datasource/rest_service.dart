import 'package:flutter/cupertino.dart';
import 'package:youtube_popularity_predictor/core/network/api_base_helper.dart';
import 'package:youtube_popularity_predictor/utils/constants.dart';


class RestService {
  final ApiBaseHelper helper;

  RestService({@required this.helper});

  //calls base url
  Future<dynamic> getMessage() {

    final header = {
      NetworkConstants.ACCEPT : "application/json"
    };

    return helper.get("", header);
  }

}