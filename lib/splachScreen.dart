import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isEnd = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500),()async{
      setState(() {
        isEnd = true;
      });
    });
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backGround.jpeg'),
                fit: BoxFit.fill)
            ),
            child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              isEnd == false? SpinKitThreeInOut(
              size: 40.0,
              color: Colors.green[900],
            ): Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  )
                ),
                onPressed: goToWeb,
                child: const Padding(
                  padding:EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
                  child:  Text("Let's Go",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ],
          ),
          ),
         
        ],
      ),
    ));
  }

   void goToWeb()async{
    var url = 'https://ah-eg.net/store/';
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true
        ));
    }
  }

}