import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';
import 'package:viewer/router/router.dart';

class ViewerListTile extends StatelessWidget {
  const ViewerListTile({super.key, this.relatedTopics});

  final RelatedTopics? relatedTopics;

  @override
  Widget build(BuildContext context) {
    final text = relatedTopics?.text ?? 'N/A';
    final indexOfDash = text.indexOf('-');
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return ListTile(
      title: Text(
        indexOfDash == -1 ? text : text.substring(0, indexOfDash),
      ),
      onTap: () {
        context.read<ViewerBloc>().add(SelectRelatedTopics(relatedTopics));

        if (shortestSide < 600) {
          context.router.push(ViewerDetailRoute(relatedTopics: relatedTopics));
        }
      },
    );
  }
}
