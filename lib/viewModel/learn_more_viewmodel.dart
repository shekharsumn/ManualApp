import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manual_app/model/learn_more_model.dart';
import 'package:manual_app/service/learn_more_service.dart';

final infoServiceProvider = Provider((ref) => LearnMoreService());

final infoViewModelProvider = FutureProvider<List<InfoData>>((ref) async {
  final service = ref.watch(infoServiceProvider);
  return service.fetchInfoData();
});