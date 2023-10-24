import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:viewer/core/constant/app_color.dart';
import 'package:viewer/core/constant/string_constant.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';

@RoutePage()
class ViewerDetailScreen extends StatefulWidget {
  const ViewerDetailScreen({super.key, required this.relatedTopics});

  final RelatedTopics? relatedTopics;

  @override
  State<ViewerDetailScreen> createState() => _ViewerDetailScreenState();
}

class _ViewerDetailScreenState extends State<ViewerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return OrientationBuilder(
      builder: (context, orientation) {
        if (shortestSide > 600) {
          context.router.pop();
        }
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.white,
            foregroundColor: AppColor.black,
          ),
          body: ListView(
            children: [
              _viewerImage(),
              _viewerTextAndResult(),
            ],
          ),
        );
      },
    );
  }

  Widget _viewerImage({Orientation? orientation}) {
    final size = MediaQuery.of(context).size;
    final isIconAvailable =
        (widget.relatedTopics?.icon?.uRL?.isNotEmpty ?? false);
    final imageHeight =
        orientation == Orientation.landscape ? size.height : size.height / 2;

    if (isIconAvailable) {
      return CachedNetworkImage(
        imageUrl:
            ('${StringConstant.duckDuckGoUrl}${widget.relatedTopics?.icon?.uRL}'),
        height: imageHeight,
        placeholder: (context, url) => FlutterLogo(
          size: imageHeight,
        ),
        width: 200,
      );
    } else {
      return FlutterLogo(
        size: imageHeight,
      );
    }
  }

  Widget _viewerTextAndResult() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text('Text: ${widget.relatedTopics?.text ?? 'N/A'}')),
              const SizedBox(height: 20),
              HtmlWidget(widget.relatedTopics?.result ?? 'N/A'),
            ],
          ),
        )
      ],
    );
  }
}
