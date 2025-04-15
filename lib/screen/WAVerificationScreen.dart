import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wallet_flutter/utils/WAColors.dart';

import 'WADashboardScreen.dart';

class WAVerificationScreen extends StatefulWidget {
  static String tag = '/WAVerificationScreen';

  @override
  WAVerificationScreenState createState() => WAVerificationScreenState();
}

class WAVerificationScreenState extends State<WAVerificationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back),
          ).onTap(() {
            finish(context);
          }),
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/wa_bg.jpg'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.height,
                Image.asset(
                  'assets/wa_verification.png',
                ),
                8.height,
                Text(
                  'Verification',
                  style: boldTextStyle(size: 20),
                  textAlign: TextAlign.center,
                ),
                16.height,
                Text(
                  'We have send a 4 digit verification code to your mail. Please enter the code below to verify it\'s you',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                30.height,
                Wrap(
                  children: [
                  SizedBox(
                  height: 60,
                  child: OTPTextField(
                    decoration: InputDecoration(
                      counterText: "", // 🚫 hides the "0/1" counter
                      border: InputBorder.none, // remove default borders
                    ),
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: WAPrimaryColor, width: 1.5),
                    ),
                    pinLength: 4,
                    fieldWidth: context.width()*.15 ,
                    textStyle: TextStyle(fontSize: 20),
                    onChanged: (value) {},
                    onCompleted: (value) {},
                  ),
                ),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I didn\'t get the Code.', style: secondaryTextStyle()),
                    4.width,
                    Text('Resend Code', style: boldTextStyle(color: WAPrimaryColor)),
                  ],
                ),
                16.height,
                SizedBox(
                  width: context.width() * 0.5,
                  child: AppButton(
                      text: "Verify Me",
                      color: WAPrimaryColor,
                      textColor: Colors.white,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      width: context.width(),
                      onTap: () {
                        WADashboardScreen().launch(context);
                      }),
                ),
              ],
            ).paddingAll(30),
          ),
        ),
      ),
    );
  }
}
