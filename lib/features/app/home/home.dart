import 'package:flutter/material.dart';
import 'package:my_chatgpt/features/app/app_constant/page_constant.dart';
import '../home/widgets/home_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                HomeButtonWidget(
                  textData: "Image Generation Demo",
                  iconData: Icons.image_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.ImageGenerationPage);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                HomeButtonWidget(
                  textData: "Text Completion Demo",
                  iconData: Icons.text_fields_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.TextCompletionPage);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                HomeButtonWidget(
                  textData: "About App",
                  iconData: Icons.info,
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.AboutAppPage);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ChatGPT: Optimizing Language Models for Dialogue",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
