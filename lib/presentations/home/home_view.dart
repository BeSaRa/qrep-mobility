
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
    return MediaQuery(
      data: MediaQueryData(),
      child: Directionality(
        textDirection:  TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            // title: Text('test',style: TextStyle(fontSize: 12.sp),),
          ),
          body:Column(children: [
             TextButton(onPressed: ()async{

             }, child: Text("press"))


          ],)
        ),
      ),
    );
  }


}
