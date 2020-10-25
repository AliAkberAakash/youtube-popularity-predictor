import 'package:youtube_popularity_predictor/data/models/message_response.dart';

abstract class Repository {
  Future<MessageResponse> getMessage();
}