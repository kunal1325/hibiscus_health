import 'package:hibiscus_health/import.dart';

class ArticleTemplateView1 extends GetView<ArticleTemplateView1> {
  const ArticleTemplateView1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleTemplate1Controller>(
        init: ArticleTemplate1Controller(),
        builder: (controller) {
          return ConnectivityCheckWidget(
              body: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 80,
                backgroundColor: AppColors.kPrimaryColor,
                elevation: 0,
                // shape: const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.vertical(
                //     bottom: Radius.circular(20),
                //   ),
                // ),
                leading: iosBackButton,
                actions: [
                  Row(
                    children: [
                      Text(
                        "${controller.article.readTime}",
                        style: Utils.kParagraphTextStyle
                            .copyWith(color: AppColors.kLightBlue),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border,
                              size: 35, color: AppColors.kLightBlue)),
                    ],
                  )
                ],
              ),
              body: Container(
                color: AppColors.kPrimaryColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.kBgColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: controller.article.image ?? "",
                              height: 200,
                              width: Get.width,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 85,
                                    horizontal: (Get.width - 30) / 2),
                                child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset(AppImages.defaultArticleImage),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${controller.article.title}",
                            //Strings.articleHeading,
                            maxLines: 20,
                            overflow: TextOverflow.ellipsis,
                            style: Utils.kHeadingTextStyle,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.articleBy,
                                style: Utils.kParagraphTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kLightBlue),
                              ),
                              const SizedBox(height: 10),
                              ReviewedByDoctor(
                                doctorImage:
                                    "${controller.article.reviewerImageResponse?.data?.first.attributes?.formats?.thumbnail?.url}",
                                //AppImages.clDoctorImage,
                                doctorName:
                                    "${controller.article.reviewerName}",
                                //Strings.doctorName,
                                doctorQualification:
                                    "${controller.article.reviewerExperience}",
                                //Strings.doctorQualification
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          controller.article.introduction != null
                              ? Text(
                                  "${controller.article.introduction}",
                                  //Strings.articlePart1,
                                  style: Utils.kParagraphTextStyle,
                                )
                              : const SizedBox(),
                          controller.article.bulletPoints != null ||
                                  controller.article.bulletPoints != []
                              ? const SizedBox(height: 15)
                              : const SizedBox(),
                          controller.article.bulletPoints != null ||
                                  controller.article.bulletPoints != []
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.article.bulletPoints?.length ??
                                          0,
                                  itemBuilder: (context, i) {
                                    return ArticlePoints(
                                        width: Get.width,
                                        subheading:
                                            "${controller.article.bulletPoints?[i].title}",
                                        content:
                                            "${controller.article.bulletPoints?[i].description}");
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(height: 10),
                                )
                              : const SizedBox(),
                          controller.article.titleBulletPoint != null ||
                                  controller.article.titleBulletPoint != []
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                          .article.titleBulletPoint?.length ??
                                      0,
                                  itemBuilder: (context, ind) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 20),
                                        controller
                                                    .article
                                                    .titleBulletPoint?[ind]
                                                    .mainTitle !=
                                                null
                                            ? Text(
                                                "${controller.article.titleBulletPoint?[ind].mainTitle}",
                                                maxLines: 30,
                                                overflow: TextOverflow.ellipsis,
                                                style: Utils.kParagraphTextStyle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                              )
                                            : const SizedBox(),
                                        controller
                                                    .article
                                                    .titleBulletPoint?[ind]
                                                    .mainTitle !=
                                                null
                                            ? const SizedBox(height: 10)
                                            : const SizedBox(),
                                        controller
                                                        .article
                                                        .titleBulletPoint?[ind]
                                                        .bulletPoint !=
                                                    null ||
                                                controller
                                                        .article
                                                        .titleBulletPoint![ind]
                                                        .bulletPoint !=
                                                    []
                                            ? ListView.separated(
                                                itemCount: controller
                                                        .article
                                                        .titleBulletPoint![ind]
                                                        .bulletPoint
                                                        ?.length ??
                                                    0,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return ArticlePoints(
                                                      width: Get.width,
                                                      subheading:
                                                          "${controller.article.titleBulletPoint![ind].bulletPoint![index].title}",
                                                      // Strings.article5Subpart3Headings[index],
                                                      content:
                                                          "${controller.article.titleBulletPoint![ind].bulletPoint![index].description}",
                                                      extraSpaceForSubpoint:
                                                          true);
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                      height: 10);
                                                },
                                              )
                                            : const SizedBox(),
                                        // const SizedBox(height: 20),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(),
                                )
                              : const SizedBox(),
                          (controller.article.titleBulletPoint != null ||
                                      controller.article.titleBulletPoint !=
                                          []) &&
                                  (controller.article.bulletPoints != null ||
                                      controller.article.bulletPoints != [])
                              ? const SizedBox(height: 20)
                              : const SizedBox(),
                          (controller.article.summary == null ||
                                      controller.article.summary == "") ||
                                  controller.article.conclusion == null
                              ? const SizedBox()
                              : Text(
                                  "${controller.article.conclusion}",
                                  style: Utils.kParagraphTextStyle,
                                ),
                          const SizedBox(height: 20),
                          controller.article.summary != null ||
                                  controller.article.conclusion != null
                              ? ArticleSummary(
                                  articleTip:
                                      controller.article.summary != null &&
                                              controller.article.summary != ""
                                          ? "${controller.article.summary}"
                                          : "${controller.article.conclusion}")
                              : const SizedBox(),
                          const SizedBox(height: 15),
                          controller.article.disclaimer != null
                              ? Text("${controller.article.disclaimer}",
                                  style: Utils.kVerySmallText
                                      .copyWith(fontStyle: FontStyle.italic))
                              : const SizedBox(),
                          const SizedBox(height: 20),
                          controller.refText != ""
                              ? Obx(() => InkWell(
                                    onTap: controller.toggle,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Strings.references,
                                              style: Utils.kParagraphTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Icon(
                                              controller.isRefCollapsed.value
                                                  ? Icons.keyboard_arrow_down
                                                  : Icons.keyboard_arrow_right,
                                              size: 30,
                                              color:
                                                  AppColors.kPrimaryColorText,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Visibility(
                                          visible:
                                              controller.isRefCollapsed.value,
                                          child: Card(
                                            color: AppColors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            elevation: 0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: SizedBox(
                                                width: 350,
                                                child: Text(
                                                  controller.refText,
                                                  maxLines: 80,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Utils.kVerySmallText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  ))
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
        });
  }
}
