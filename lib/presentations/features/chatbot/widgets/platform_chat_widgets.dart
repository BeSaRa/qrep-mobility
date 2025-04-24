import 'dart:math';

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
            fontSize: AppSizeSp.s16,
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
                    fontSize: AppSizeSp.s25,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            AppStrings().chatOtherResponseMessage,
            style: TextStyle(
              color: ColorManager.red,
              fontSize: AppSizeSp.s14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                '${AppStrings().note}: ${AppStrings().chatOtherResponseMessageNote}',
                style: TextStyle(
                    color: ColorManager.red,
                    fontSize: AppSizeSp.s14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//=====================================================================
class CustomeTableDialog extends StatefulWidget {
  final dynamic response;
  final ScrollController horizontalController;

  const CustomeTableDialog({
    super.key,
    required this.horizontalController,
    required this.response,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomeTableDialogState createState() => _CustomeTableDialogState();
}

class _CustomeTableDialogState extends State<CustomeTableDialog> {
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final int _rowsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    final List<String> headers = widget.response.first.keys.toList();
    final int totalPages = (widget.response.length / _rowsPerPage).ceil();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteSmoke,
                borderRadius: BorderRadius.circular(AppSizeR.s12),
              ),
              padding: EdgeInsets.all(AppSizeW.s16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, size: AppSizeW.s30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Column(
                      children: [
                        Scrollbar(
                          controller: widget.horizontalController,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: CustomePaginatedTable(
                              headers: headers,
                              response: widget.response,
                              rowsPerPage: _rowsPerPage,
                              currentPageNotifier: _currentPageNotifier,
                            ),
                          ),
                        ),
                        RowPaginationWidget(
                          totalPages: totalPages,
                          currentPageNotifier: _currentPageNotifier,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomePaginatedTable extends StatelessWidget {
  final List<String> headers;
  final List<dynamic> response;
  final int rowsPerPage;
  final ValueNotifier<int> currentPageNotifier;

  const CustomePaginatedTable({
    super.key,
    required this.headers,
    required this.response,
    required this.rowsPerPage,
    required this.currentPageNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, _) {
        final startIndex = currentPage * rowsPerPage;
        final endIndex = (currentPage + 1) * rowsPerPage > response.length
            ? response.length
            : (currentPage + 1) * rowsPerPage;
        final currentRows = response.sublist(startIndex, endIndex);

        return DataTable(
          columns: headers
              .map((header) => DataColumn(
                    label: Center(child: Text(header)),
                  ))
              .toList(),
          rows: currentRows
              .map<DataRow>((row) => DataRow(
                    cells: headers
                        .map((key) => DataCell(
                              Center(child: Text(row[key].toString())),
                            ))
                        .toList(),
                  ))
              .toList(),
        );
      },
    );
  }
}

class RowPaginationWidget extends StatelessWidget {
  final int totalPages;
  final ValueNotifier<int> currentPageNotifier;

  const RowPaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPageNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded, size: AppSizeW.s16),
              onPressed:
                  currentPage > 0 ? () => currentPageNotifier.value-- : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s8),
              child: Text(
                '${AppStrings().page} ${currentPage + 1} ${AppStrings().of} $totalPages',
                style: TextStyle(fontSize: AppSizeSp.s13),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded, size: AppSizeW.s16),
              onPressed: currentPage < totalPages - 1
                  ? () => currentPageNotifier.value++
                  : null,
            ),
          ],
        );
      },
    );
  }
}

class TableCardsListWidget extends StatefulWidget {
  final bool isLargeData;
  final PlatformChatbotResponseModel response;

  const TableCardsListWidget({
    super.key,
    required this.isLargeData,
    required this.response,
  });

  @override
  State<TableCardsListWidget> createState() => _TableCardsListWidgetState();
}

class _TableCardsListWidgetState extends State<TableCardsListWidget> {
  @override
  Widget build(BuildContext context) {
    // Take only the first 10 elements if it's large data
    final dataToDisplay = widget.isLargeData
        ? widget.response.response.take(10).toList()
        : widget.response.response;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isLargeData)
          ChatbotNoteWidget(note: AppStrings().largeDataNote),
        Wrap(
          spacing: AppSizeW.s8,
          runSpacing: AppSizeH.s8,
          children: dataToDisplay.map<Widget>((data) {
            final item = data as Map<String, dynamic>;

            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - AppSizeW.s276,
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizeR.s12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizeW.s12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: AppSizeH.s8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              entry.key,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppSizeSp.s12,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.primary,
                              ),
                            ),
                            SizedBox(height: AppSizeH.s4),
                            Text(
                              textAlign: TextAlign.center,
                              '${entry.value}',
                              style: TextStyle(
                                fontSize: AppSizeSp.s12,
                                color: Colors.black87,
                              ),
                            ),
                            const Divider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 0.5,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

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
  // final ValueNotifier<bool> showTableView = ValueNotifier(false);

  bool _isLargeDataset(PlatformChatbotResponseModel response) {
    return response.response.length > 50;
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    isPDFDownloding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeData = _isLargeDataset(widget.response);

    return Stack(
      children: [
        Column(
          children: [
            if (widget.isHasNote) ChatbotNoteWidget(note: widget.note),

            // Download button row
            Row(
              spacing: AppSizeH.s5,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isPDFDownloding,
                    builder: (context, downloading, child) {
                      return downloading
                          ? SizedBox(
                              width: AppSizeW.s20,
                              height: AppSizeH.s20,
                              child: const CircularProgressIndicator())
                          : GestureDetector(
                              onTap: () async {
                                isPDFDownloding.value = true;
                                try {
                                  if (isLargeData) {
                                    await PdfDownloadService(
                                      pdfTitle: widget.pdfTitle,
                                      response: widget.response,
                                    ).generateAndOpenExcel(context: context);
                                  } else {
                                    String filePath = await PdfDownloadService(
                                      pdfTitle: widget.pdfTitle,
                                      response: widget.response,
                                    ).downloadPDF();
                                    if (context.mounted) {
                                      successToast(
                                          'PDF saved to $filePath', context);
                                    }
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    errorToast(
                                        AppStrings().defaultError, context);
                                  }
                                } finally {
                                  isPDFDownloding.value = false;
                                }
                              },
                              child: Icon(
                                  isLargeData
                                      ? Icons.list_alt_outlined
                                      : Icons.download,
                                  size: AppSizeW.s30));
                    },
                  ),
                ),
                Expanded(
                    child: TableCardsListWidget(
                        //here widget.response.response.length >12 to disply just 12 element
                        //And I didn't make pass above isLargeData instead current condition because it's just for the PDF and Excil button
                        isLargeData: widget.response.response.length > 12,
                        response: widget.response)),
                // Expanded(child: _buildCardView(isLargeData)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizeH.s16),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => CustomeTableDialog(
                      horizontalController: _horizontalController,
                      response: widget.response.response,
                    ),
                  );
                },
                child: Text(AppStrings().viewAsTable),
              ),
            ),
          ],
        ),
        // Table dialog
        // ValueListenableBuilder<bool>(
        //   valueListenable: showTableView,
        //   builder: (context, showTable, child) {
        //     return showTable ? _buildTableDialog() : const SizedBox.shrink();
        //   },
        // ),
      ],
    );
  }
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
  double getDynamicInterval(double maxY) {
    if (maxY <= 0) return 100;

    int magnitude = maxY.floor().toString().length - 1;

    // Limit to max 7 zeros (10^9)
    if (magnitude >= 1 && magnitude <= 9) {
      return pow(10, magnitude).toDouble();
    }

    return 100000;
  }

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

    if (widget.responseData.response.isEmpty) {
      return const Center(child: Text("No data available"));
    }
    double maxY = widget.responseData.response
        .map((e) => (e[valueKey] as num).toDouble())
        .reduce((a, b) => a > b ? a : b);

    double interval = getDynamicInterval(maxY);
    // double interval = maxY >= 3000 ? 10000 : 200;

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
                                if (context.mounted) {
                                  successToast(
                                      'PDF saved to $filePath', context);
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //       content:
                                  //           Text('PDF saved to $filePath')),
                                  // );
                                }
                              } catch (e) {
                                if (context.mounted) {
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
                          fontSize: AppSizeSp.s16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  //--------------------------- CHART ------------------------
                  SizedBox(
                    height: AppSizeH.s304,
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
                              // maxY: widget.responseData.response
                              //     .map((e) => (e[valueKey] as num).toDouble())
                              //     .reduce((a, b) => a > b ? a : b),
                              maxY: maxY,
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
                                      interval: interval,
                                      reservedSize: AppSizeW.s50,
                                      getTitlesWidget: (value, meta) {
                                        if (value == maxY) {
                                          return const SizedBox
                                              .shrink(); // Hide maxY label
                                        }

                                        String formattedValue;
                                        if (value >= 1000) {
                                          formattedValue =
                                              '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
                                        } else {
                                          formattedValue =
                                              value.toInt().toString();
                                        }

                                        return Text(
                                          formattedValue,
                                        );
                                      }),
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
                                            fontSize: AppSizeSp.s12,
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
                                        fontSize: AppSizeSp.s14,
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
                fontSize: AppSizeSp.s16,
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
                  style: TextStyle(fontSize: AppSizeSp.s14),
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
