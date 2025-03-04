import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/pdf_service.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';

//=====================================================================
class PlatformAvgResponse extends StatelessWidget {
  final PlatformChatbotResponseModel responseData;
  final bool isMessageInArabic;
  const PlatformAvgResponse(
      {super.key, required this.responseData, required this.isMessageInArabic});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //-------------------Note---------------------------
      ChatbotNoteWidget(note: AppStrings().avgNote),
      //--------------------------- Title ------------------------

      Container(
        padding: EdgeInsets.all(AppSizeW.s12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(AppSizeR.s12),
          //     topRight: Radius.circular(AppSizeR.s12)),
        ),
        child: Text(
          responseData.response.isNotEmpty
              ? responseData.response.first.keys.first
              : "AVG",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSizeW.s16,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),
      ),
      //--------------------------- Data ------------------------
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textDirection: isMessageInArabic
                    ? ui.TextDirection.rtl
                    : ui.TextDirection.ltr,
                responseData
                    .response.first[responseData.response.first.keys.first]
                    .toString(),
                style: TextStyle(
                    fontSize: AppSizeW.s25,
                    color: Theme.of(context).textTheme.bodySmall!.color)),
          ],
        ),
      )
    ]);
  }
}

//=====================================================================
class InvalidQuestionWidget extends StatelessWidget {
  const InvalidQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizeH.s5,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // padding: EdgeInsets.all(AppSizeW.s3),
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.red, width: 1),
              borderRadius: BorderRadius.circular(AppSizeR.s100)),
          child: Icon(
            Icons.error_outline_outlined,
            color: ColorManager.red,
          ),
        ),
        Flexible(
          child: Text(
            AppStrings().chatOtherResponseMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorManager.red,
                fontSize: AppSizeSp.s14,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

//=====================================================================
class PlatformTableResponse extends StatefulWidget {
  const PlatformTableResponse({
    super.key,
    required this.response,
    required this.isHasNote,
    required this.note,
    required this.pdfTitle,
  });

  final PlatformChatbotResponseModel response;
  final bool isHasNote;
  final String note;
  final String pdfTitle;

  @override
  State<PlatformTableResponse> createState() => _PlatformTableResponseState();
}

class _PlatformTableResponseState extends State<PlatformTableResponse> {
  final ScrollController _horizontalController = ScrollController();
  final ValueNotifier<bool> isPDFDownloding = ValueNotifier(false);

  @override
  void dispose() {
    _horizontalController.dispose();
    isPDFDownloding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> headers = widget.response.response.first.keys.toList();
    return Column(
      children: [
        Row(
          spacing: AppSizeH.s5,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isPDFDownloding,
                  builder: (context, downloading, child) {
                    return downloading
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () async {
                              isPDFDownloding.value = true;

                              try {
                                String filePath = await PdfDownloadService(
                                  pdfTitle: widget.pdfTitle,
                                  response: widget.response,
                                ).downloadPDF();
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('PDF saved to $filePath')),
                                  );
                                }
                              } catch (e) {
                                if (mounted) {
                                  errorToast(
                                      AppStrings().defaultError, context);
                                }
                              } finally {
                                isPDFDownloding.value = false;
                              }
                            },
                            child: Icon(Icons.download, size: AppSizeW.s30));
                  }),
            ),
            Expanded(
                child: Column(
              children: [
                //-------------------Note---------------------------
                if (widget.isHasNote) ChatbotNoteWidget(note: widget.note),
                //----------------------------------------------
                //if (widget.isAvgTable) ChatbotNoteWidget(note: AppStrings().avgNote),
                Scrollbar(
                  controller: _horizontalController,
                  // scrollbarOrientation: ScrollbarOrientation.top,
                  thumbVisibility: true,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: PaginatedDataTable(
                      controller: _horizontalController,
                      columns: headers
                          .map((header) => DataColumn(
                                label: Center(child: Text(header)),
                              ))
                          .toList(),
                      source:
                          _TableDataSource(widget.response.response, headers),
                      rowsPerPage: widget.response.response.length < 10
                          ? widget.response.response.length
                          : 10, // Pagination: 10 rows per page
                      showCheckboxColumn:
                          false, // Hide unnecessary checkbox column
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }
}

class _TableDataSource extends DataTableSource {
  final List<dynamic> data;
  final List<String> headers;

  _TableDataSource(this.data, this.headers);

  @override
  DataRow getRow(int index) {
    if (index >= data.length) return const DataRow(cells: []);
    final row = data[index];

    return DataRow(
      cells: headers.map((key) {
        return DataCell(
          Center(
              child: Text(row[key].toString(),
                  overflow: TextOverflow.ellipsis)), // Centering Data
        );
      }).toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
}

//======================================================================
class ChatbotNoteWidget extends StatelessWidget {
  const ChatbotNoteWidget({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
      margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: context.locale == ARABIC_LOCAL
              ? BorderRadius.only(
                  topLeft: Radius.circular(AppSizeR.s15),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(AppSizeR.s15),
                  bottomRight: Radius.circular(AppSizeR.s15))
              : BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(AppSizeR.s15),
                  bottomLeft: Radius.circular(AppSizeR.s15),
                  bottomRight: Radius.circular(AppSizeR.s15))),
      child: Text("${AppStrings().note}: $note",
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorManager.white)),
    );
  }
}

//======================================================================
class PlatformChartResponse extends StatefulWidget {
  final PlatformChatbotResponseModel responseData;
  final int currentMessageIndex;
  final String pdfTitle;
  const PlatformChartResponse({
    super.key,
    required this.responseData,
    required this.currentMessageIndex,
    required this.pdfTitle,
  });

  @override
  State<PlatformChartResponse> createState() => _PlatformChartResponseState();
}

class _PlatformChartResponseState extends State<PlatformChartResponse> {
  final ScrollController _horizontalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  final ValueNotifier<bool> isPDFDownloding = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    // Extract keys dynamically
    final String monthKey =
        widget.responseData.response.first.keys.first; // "الشهر"
    final String valueKey =
        widget.responseData.response.first.keys.last; // "العدد"

    // Get the maximum value from the API response
    final double maxValue = widget.responseData.response
        .map((e) => (e[valueKey] as num?)?.toDouble() ?? 0.0)
        .reduce((a, b) => a > b ? a : b);

    // Dynamic height based on maxValue (with constraints)
    double chartHeight =
        (maxValue * 10).clamp(AppSizeH.s200, 800.0); // min 200 and max 600

    if (widget.responseData.response.isEmpty) {
      return const Center(child: Text("No data available"));
    }

    return Column(
      children: [
        Row(
          spacing: AppSizeW.s5,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ValueListenableBuilder<bool>(
                  valueListenable: isPDFDownloding,
                  builder: (context, downloading, child) {
                    return downloading
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () async {
                              isPDFDownloding.value = true;

                              try {
                                String filePath = await PdfDownloadService(
                                  pdfTitle: widget.pdfTitle,
                                  response: widget.responseData,
                                ).downloadPDF();
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('PDF saved to $filePath')),
                                  );
                                }
                              } catch (e) {
                                if (mounted) {
                                  errorToast(
                                      AppStrings().defaultError, context);
                                }
                              } finally {
                                isPDFDownloding.value = false;
                              }
                            },
                            child: Icon(Icons.download, size: AppSizeW.s30));
                  }),
            ),
            Expanded(
              child: Column(
                children: [
                  //--------------------------- Title ------------------------

                  if (widget.currentMessageIndex != 0 &&
                      context
                          .read<ChatHistoryCubit>()
                          .state
                          .platformMessages[widget.currentMessageIndex - 1]
                          .content is String)
                    Container(
                      padding: EdgeInsets.all(AppSizeW.s12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizeR.s12),
                            topRight: Radius.circular(AppSizeR.s12)),
                      ),
                      child: Text(
                        //the last message from the user
                        context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[widget.currentMessageIndex - 1]
                            .content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppSizeW.s16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  //--------------------------- CHART ------------------------
                  SizedBox(
                    height: chartHeight,
                    child: Scrollbar(
                      controller: _horizontalController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _horizontalController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).focusColor),
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                          ),
                          width: widget.responseData.response.length *
                              AppSizeW.s60,
                          padding: EdgeInsets.only(top: AppSizeW.s50),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: widget.responseData.response
                                  .map((e) => (e[valueKey] as num).toDouble())
                                  .reduce((a, b) => a > b ? a : b),
                              barGroups:
                                  widget.responseData.response.map((data) {
                                final value =
                                    (data[valueKey] as num).toDouble();
                                return BarChartGroupData(
                                  x: data[monthKey],
                                  barRods: [
                                    BarChartRodData(
                                      toY: value,
                                      color: ColorManager.primary,
                                      width: AppSizeW.s20,
                                      borderRadius:
                                          BorderRadius.circular(AppSizeR.s6),
                                    ),
                                  ],
                                );
                              }).toList(),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 100, // Adjust spacing
                                    reservedSize: AppSizeW.s50,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final monthLabel = widget
                                          .responseData.response
                                          .firstWhere(
                                              (e) => e[monthKey] == value,
                                              orElse: () => {})[monthKey]
                                          .toString();
                                      return Text(
                                        monthLabel,
                                        style: TextStyle(
                                            fontSize: AppSizeW.s12,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: false), // Hide right axis
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: false), // Hide top axis
                                ),
                              ),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  getTooltipColor: (group) =>
                                      Colors.transparent,
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    // Get the value for the current bar
                                    final value = rod.toY.toString();
                                    return BarTooltipItem(
                                      value,
                                      TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: AppSizeW.s14,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    );
                                  },
                                  // Adjust the tooltip position based on the touch location
                                  tooltipPadding: EdgeInsets.symmetric(
                                      horizontal: AppSizeW.s5),
                                ),
                                // touchResponse: TouchResponse(
                                //   touchTooltipData: BarTouchTooltipData(
                                //     tooltipBgColor: Colors.black.withOpacity(0.8),
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //--------------------- month -------------
                  Padding(
                    padding: EdgeInsets.only(top: AppSizeW.s5),
                    child: Text(
                      monthKey,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//======================================================================
class PlatformLawResponse extends StatelessWidget {
  final PlatformChatbotResponseModel responseData;
  const PlatformLawResponse({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: responseData.response.length,
      itemBuilder: (context, index) {
        final item = responseData.response[index];
        return PlatformLawResponseBubble(
          title: item['title'] ?? "بدون عنوان",
          articleNumber: item['article_number'] ?? 0.0,
          article: item['article'] ?? "",
          content: item['Content'] ?? "",
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: AppSizeH.s10),
    );
  }
}

class PlatformLawResponseBubble extends StatelessWidget {
  final String title;
  final double articleNumber;
  final String article;
  final String content;
  // final bool isMessageInArabic;

  const PlatformLawResponseBubble({
    super.key,
    required this.title,
    required this.articleNumber,
    required this.article,
    required this.content,
    // required this.isMessageInArabic,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizeR.s12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizeW.s12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizeR.s12),
                  topRight: Radius.circular(AppSizeR.s12)),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSizeW.s16,
                fontWeight: FontWeight.bold,
                color: ColorManager.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppSizeW.s10),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
            ),
            child: Column(
              spacing: AppSizeH.s20,
              children: [
                Text(
                  content,
                  style: TextStyle(fontSize: AppSizeW.s14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(AppStrings().articleNumber,
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(articleNumber.toInt().toString(),
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    Text(article,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//======================================================================
