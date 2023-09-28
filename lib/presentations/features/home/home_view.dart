
import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:flutter/material.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key,  this.title = 'press'});
  final String title ;
  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,),
        body:Column(children: [
           TextButton(onPressed: ()async{

           }, child: Text(AppStrings().test
             .tr(),style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)),
Container(
  height: 40,
  width: 100,
  color: Theme.of(context).colorScheme.tertiaryContainer,)

        ],)
      ),
    );
  }


}
