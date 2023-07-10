import 'package:duggup/controller/user_controller.dart';
import 'package:duggup/utilities/app_assets.dart';
import 'package:duggup/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => _userController.isload.value
                  ? Column(
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                              color: AppColors.btnColor),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        mayFollowView(),
                        Divider(
                          color: AppColors.border,
                          thickness: 1,
                        ),
                        topicView(),
                        Divider(
                          color: AppColors.border,
                          thickness: 1,
                        ),
                        mayFollowView(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget mayFollowView() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "People you may follow",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dataText(
                  "Topic Lorem ipsum dolor sit amet consectetur adipiscing elit"),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<UserController>(builder: (controller) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: controller.user_list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.all(8),
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              AppAssets.dummy,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          CustomButton(
                            borderColor: AppColors.btnColor,
                            btnColor: Colors.white,
                            fontColor: AppColors.btnColor,
                            fontSize: 12,
                            fontw: FontWeight.w500,
                            radius: 34.0,
                            hg: 35.0,
                            title: 'Follow',
                            onClick: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      titleText(
                          "${controller.user_list[index].name!.first!} ${controller.user_list[index].name!.last!}"),
                      subTitleText(controller.user_list[index].name!.title!),
                      const SizedBox(
                        height: 10,
                      ),
                      dataText(
                          'Lorem ipsum dolor sit amet consectet adipiscing elit Ut et massa mi bjbddad dad orem ipsum dol...'),
                      const SizedBox(
                        height: 10,
                      ),
                      richTextView("10K", "111")
                    ],
                  ),
                );
              },
            ),
          );
        }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget topicView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Trending Topic",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          dataText(
              "Topic Lorem ipsum dolor sit amet consectetur adipiscing elit"),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(8),
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border, width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                AppAssets.paythonIcon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleText("Python"),
                                richTextView("10K", "111"),
                              ],
                            )
                          ],
                        ),
                        CustomButton(
                          borderColor: AppColors.btnColor,
                          btnColor: Colors.white,
                          fontColor: AppColors.btnColor,
                          fontSize: 12,
                          fontw: FontWeight.w500,
                          radius: 34.0,
                          hg: 35.0,
                          title: 'Follow',
                          onClick: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget richTextView(String folloers, String answeres) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: folloers,
            style: blackTextStyle,
          ),
          TextSpan(
            text: ' followers ',
            style: greyTextStyle,
          ),
          TextSpan(
            text: answeres,
            style: blackTextStyle,
          ),
          TextSpan(
            text: ' answers',
            style: greyTextStyle,
          ),
        ],
      ),
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  Widget subTitleText(String title) {
    return Text(title, style: greyTextStyle);
  }

  Widget dataText(String title) {
    return Text(title,
        maxLines: 4, overflow: TextOverflow.ellipsis, style: blackTextStyle);
  }

  TextStyle greyTextStyle = TextStyle(
    color: AppColors.greyText,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  TextStyle blackTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
