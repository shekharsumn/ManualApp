import 'dart:convert';

import 'package:manual_app/jsonData/app_json_data.dart';
import 'package:manual_app/model/learn_more_model.dart';

class LearnMoreService {
  // Simulate an API call
  Future<List<InfoData>> fetchInfoData() async {
    // Mocked JSON data
    const jsonData = AppJsonData.learMoreJson;
    final data = jsonDecode(jsonData) as Map<String, dynamic>;
    final list = data['data'] as List;

    return list.map((json) => InfoData.fromJson(json)).toList();
  }
}