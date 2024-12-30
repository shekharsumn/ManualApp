
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manual_app/widgets/content_screen.dart';
import 'package:manual_app/widgets/horizontal_page_widget.dart';
import 'package:manual_app/viewModel/learn_more_viewmodel.dart';

@RoutePage()
class LearnMoreScreen extends ConsumerStatefulWidget {
  const LearnMoreScreen({super.key});

  @override
  LearnMoreScreenState createState() => LearnMoreScreenState();
}

class LearnMoreScreenState extends ConsumerState<LearnMoreScreen> {
  @override
  Widget build(BuildContext context) {
    // Watch the infoViewModelProvider to fetch the data
    final infoAsyncValue = ref.watch(infoViewModelProvider);

    return Scaffold(
      body: infoAsyncValue.when(
        data: (infoData) {
          if (infoData.isEmpty) {
            return Center(
              child: Text(
                "No information available.",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          }

          // Map infoData to a list of maps for HorizontalPageViewWithButton
          final screensData = infoData.map((info) {
            return {
              'assetID': info.assetID,
              'header': info.header,
              'title': info.title,
              'subtitle': info.subtitle,
            };
          }).toList();

          return HorizontalPageViewWithButton(
            screensData: screensData,
            buildContent: (data) => LearnMoreContent.fromMap(data),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(
            'Failed to load data: $error',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ),
    );
  }
}



