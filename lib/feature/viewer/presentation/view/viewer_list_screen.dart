import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer/core/constant/string_constant.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart' hide Icon;
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';
import 'package:viewer/feature/viewer/presentation/widgets/viewer_list_tile.dart';
import 'package:viewer/feature/viewer/reviewer_detail/presentation/viewer_detail_screen.dart';
import 'package:viewer/flavors.dart';

@RoutePage()
class ViewerListScreen extends StatefulWidget {
  const ViewerListScreen({Key? key}) : super(key: key);

  @override
  State<ViewerListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<ViewerListScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ViewerBloc>().add(const FetchViewer());
  }

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: BlocBuilder<ViewerBloc, ViewerState>(
        bloc: context.read<ViewerBloc>(),
        builder: (context, state) => state.relatedTopics == null
            ? _mobileView(state)
            : shortestSide < 600
                ? _mobileView(state)
                : Row(
                    children: [
                      Expanded(child: _mobileView(state)),
                      BlocBuilder<ViewerBloc, ViewerState>(
                        builder: (context, state) {
                          return Expanded(
                            child: ViewerDetailScreen(
                              relatedTopics: state.relatedTopics,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget _mobileView(ViewerState state) {
    final relatedTopics = state.viewer?.relatedTopics;
    final searchedViewer = state.searchedViewer;
    final orientation = MediaQuery.orientationOf(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: orientation == Orientation.landscape ? 32 : 8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search Viewer',
            ),
            controller: textEditingController,
            onChanged: (value) => context
                .read<ViewerBloc>()
                .add(SearchViewer(searchString: value)),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.status == Status.loading)
                Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator.adaptive(),
                )
              else if (state.status == Status.success) ...[
                if (state.searchString?.isNotEmpty ?? false) ...[
                  if (searchedViewer?.isEmpty ?? true)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'There is no Viewer associated with the searched string.',
                      ),
                    )
                  else
                    _ViewerListView(
                      relatedTopics: searchedViewer,
                    ),
                ] else if (relatedTopics?.isEmpty ?? true) ...[
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          StringConstant.errorMessage,
                        ),
                        _RetryButton(),
                      ],
                    ),
                  )
                ] else
                  _ViewerListView(
                    relatedTopics: relatedTopics,
                  )
              ] else if (state.status == Status.error)
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        state.errorMessage ?? StringConstant.errorMessage,
                      ),
                      const _RetryButton(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ViewerListView extends StatelessWidget {
  const _ViewerListView({this.relatedTopics});

  final List<RelatedTopics>? relatedTopics;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: relatedTopics?.length,
        itemBuilder: (BuildContext context, int index) {
          return ViewerListTile(
            relatedTopics: relatedTopics?[index],
          );
        },
      ),
    );
  }
}

class _RetryButton extends StatelessWidget {
  const _RetryButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<ViewerBloc>().add(const FetchViewer()),
      child: const Text('Retry'),
    );
  }
}
