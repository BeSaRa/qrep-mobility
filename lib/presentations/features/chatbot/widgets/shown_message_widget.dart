import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShownMessageWidget extends StatelessWidget {
  const ShownMessageWidget({
    super.key,
    required this.message,
    required this.isAvatarShow,
    //  required this.animation
  });
  final MessageRequestModel message;
  final bool isAvatarShow;
//  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    final isMessageInArabic =
        RegExp(r'[\u0600-\u06FF]').hasMatch(message.content);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: message.role == 'user'
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.role != 'user')
          SizedBox(
            height: AppSizeW.s30,
            width: AppSizeW.s30,
            child: const Image(
              image: AssetImage(
                ImageAssets.chatBot,
              ),
            ),
          ),
        SizedBox(width: AppSizeW.s5),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
            decoration: BoxDecoration(
                color: message.role == 'user'
                    ? isAvatarShow
                        ? Theme.of(context).primaryColor.withOpacity(.5)
                        : Theme.of(context).primaryColor
                    : isAvatarShow
                        ? Theme.of(context).canvasColor.withOpacity(.5)
                        : Theme.of(context).canvasColor,
                borderRadius: context.locale == ARABIC_LOCAL
                    ? BorderRadius.only(
                        topLeft: message.role == 'user'
                            ? Radius.zero
                            : Radius.circular(AppSizeR.s15),
                        topRight: message.role != 'user'
                            ? Radius.zero
                            : Radius.circular(AppSizeR.s15),
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))
                    : BorderRadius.only(
                        topLeft: message.role != 'user'
                            ? Radius.zero
                            : Radius.circular(AppSizeR.s15),
                        topRight: message.role == 'user'
                            ? Radius.zero
                            : Radius.circular(AppSizeR.s15),
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))),
            child: _formatedDataFun(isMessageInArabic, context),
          ),
        ),
      ],
    );
  }

  Widget _formatedDataFun(bool isMessageInArabic, BuildContext context) {
    //this case will happen just when user sent a message from authority
    if (message.content is String) {
    return Text(
              textDirection: isMessageInArabic
                  ? ui.TextDirection.rtl
                  : ui.TextDirection.ltr,
              message.content.toString(),
              textAlign: message.role == 'user' ? TextAlign.center : null,
              style: TextStyle(
                  color: message.role == 'user'
                      ? ColorManager.white
                      : Theme.of(context).textTheme.bodySmall!.color));
  }
  else if (message.content is PlatformChatbotResponseModel){
    final platformResponse = message.content as PlatformChatbotResponseModel;
    switch (platformResponse.responseFormat) {
      //-----------------------------------------------------------------------------
      case "OTHER":{
        if(platformResponse.response.isNotEmpty){
          return PlatformTableResponse(response:platformResponse,isHasNote: false); 
        }
        else{
          return Text(
            //zak
          "Q didn't cooooool plz explain more",
          style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
        );
        }
      }
      //-----------------------------------------------------------------------------
      case "CHART":
      {
    final int elementKeysNumber = platformResponse.response.first.keys.toList().length;
    if(elementKeysNumber > 2){
    return PlatformTableResponse(response:platformResponse,isHasNote: true); 
    }
    else{
      
        return PlatformChartResponse(responseData:platformResponse);
    }
      }
      //-----------------------------------------------------------------------------
      case "LAW":
        return PlatformLawResponse(responseData:platformResponse);
      //-----------------------------------------------------------------------------
      // case "AVG":
      //   return _buildAvgText(platformResponse);
      //-----------------------------------------------------------------------------
      default:
      return Text(
            //zak
          "Q didn't cooooool plz explain more",
          style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
        );
    }
  }
  else{
    return Text(
      //zak
      "Unsupported format",
      style: TextStyle(color: Colors.red),
    );
  }
   
  }
}
class PlatformTableResponse extends StatelessWidget {
  const PlatformTableResponse({super.key, required this.response, required this.isHasNote});
final PlatformChatbotResponseModel response;
final bool isHasNote;
  @override
  Widget build(BuildContext context) {
        // here i extract column headers dynamically from the first row
    final headers = response.response.first.keys.toList();
       return Column(
         children: [
          //-------------------Note---------------------------
          if(isHasNote)
           ChatbotNoteWidget(note:AppStrings().chartNote),
          //----------------------------------------------
           SingleChildScrollView(
              scrollDirection: Axis.horizontal,
             child: DataTable(
                 columns: headers.map((header) => DataColumn(label: Text(header))).toList(),
                 rows: response.response.map((row) {
                      return DataRow(
                cells: headers.map((key) {
                  return DataCell(Text(row[key].toString())); // Convert values to string
                }).toList(),    );
                 }).toList(),
               ),
           ),
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
    return Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
            decoration: BoxDecoration(
                color:
                        Theme.of(context).primaryColor,
                  
                borderRadius: context.locale == ARABIC_LOCAL
                    ? BorderRadius.only(
                        topLeft: 
                           Radius.zero,
                          
                        topRight:  Radius.circular(AppSizeR.s15),
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))
                    : BorderRadius.only(
                        topLeft: Radius.circular(AppSizeR.s15),
                        topRight:  Radius.zero,
                       
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))),
            child:   Text(
        
              "${AppStrings().note}: $note",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:ColorManager.white
                     )),
          ),
        );
  }
}
//======================================================================
class PlatformChartResponse extends StatelessWidget {
  final PlatformChatbotResponseModel responseData;

  const PlatformChartResponse({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    // Extract keys dynamically
    final String monthKey = responseData.response.first.keys.first;  // "الشهر"
    final String valueKey = responseData.response.first.keys.last;   // "العدد"

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: responseData.response.length * 60.0,  // Adjust width based on data
          padding: const EdgeInsets.all(16),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: responseData.response.map((e) => (e[valueKey] as num).toDouble()).reduce((a, b) => a > b ? a : b) + 50,
              barGroups: responseData.response.map((data) {
                return BarChartGroupData(
                  x: data[monthKey],
                  barRods: [
                    BarChartRodData(
                      toY: (data[valueKey] as num).toDouble(),
                      color: ColorManager.primary,
                      width: 20,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 100, // Adjust spacing
                    reservedSize: 40,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final monthLabel = responseData.response
                          .firstWhere((e) => e[monthKey] == value, orElse: () => {})[monthKey]
                          .toString();
                      return Transform.rotate(
                        angle: -0.5,
                        child: Text(
                          monthLabel,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }
}
//======================================================================
class PlatformLawResponse extends StatelessWidget {
  final PlatformChatbotResponseModel  responseData;

  const PlatformLawResponse({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: responseData.response.length,
        itemBuilder: (context, index) {
          final item = responseData.response[index];
          return PlatformLawResponseBubble(
            // title: item['title'] ?? "بدون عنوان",
            // articleNumber: item['article_number'].toString(),
            // article: item['article'] ?? "",
            // content: item['Content'] ?? "",
            title: item.title ??"zak",
            articleNumber: item.article_number.toString(),
            article: item.article??"zak1",
            content: item.content??"zak2",
          );
        },
      ),
    );
  }
}
class PlatformLawResponseBubble extends StatelessWidget {
  final String title;
  final String articleNumber;
  final String article;
  final String content;

  const PlatformLawResponseBubble({
    super.key,
    required this.title,
    required this.articleNumber,
    required this.article,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "رقم المادة: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(articleNumber),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                "المادة: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(article, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            content,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
//======================================================================


