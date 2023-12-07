import 'package:get_storage/get_storage.dart';
import 'package:hibiscus_health/import.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      init: LibraryController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kPrimaryColor,
              leading: !controller.isSearching.value
                  ? iosBackButton
                  : const SizedBox(),
              elevation: 0,
              toolbarHeight: 80,
              title: const Text(Strings.learn),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    controller.isSearching.value =
                        !controller.isSearching.value;
                  },
                  icon: const Icon(Icons.search,
                      size: 30, color: AppColors.white),
                )
              ],
            ),
            body: Container(
              color: AppColors.kPrimaryColor,
              height: Get.height,
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.kBgColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Visibility(
                                visible: controller.isSearching.value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, bottom: 20),
                                  child: TextFormField(
                                    controller: controller.searchKey,
                                    decoration: Utils.kRoundTextFieldDecoration
                                        .copyWith(
                                      hintText: 'Search articles',
                                      prefixIcon: const Icon(Icons.search,
                                          color: AppColors.kPrimaryColor),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.searchKey.clear();
                                          },
                                          icon: const Icon(Icons.close,
                                              color: AppColors.kPrimaryColor)),
                                    ),
                                    validator: (val) {
                                      controller.isSearchValueValid(val);
                                    },
                                    onFieldSubmitted: (val) {
                                      controller.onSearch(val);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              Strings.browseContent,
                              style: Utils.kHeadingTextStyle
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: controller.isCategoryLoading.value
                                    ? Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        enabled: true,
                                        child: SizedBox(
                                          height: 38,
                                          child: ListView.builder(
                                            itemCount: 4,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, ind) {
                                              return Row(
                                                children: [
                                                  Container(
                                                    height: 38,
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 38,
                                        child: ListView.builder(
                                          itemCount:
                                              controller.categoryList.length ??
                                                  0,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, ind) {
                                            return Row(
                                              children: [
                                                Obx(
                                                  () => InkWell(
                                                    onTap: controller
                                                            .isArticlesLoading
                                                            .value
                                                        ? null
                                                        : () {
                                                            controller
                                                                .onChipSelected(
                                                                    ind);
                                                          },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10,
                                                          horizontal: 15),
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                    .isChipSelected
                                                                    .value ==
                                                                ind
                                                            ? AppColors
                                                                .kPrimaryColor
                                                            : AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Text(
                                                          "${controller.categoryList[ind].attributes?.categoryName}",
                                                          // controller.subContentType[ind],
                                                          style: Utils.kSmallText.copyWith(
                                                              color: controller
                                                                          .isChipSelected
                                                                          .value ==
                                                                      ind
                                                                  ? AppColors
                                                                      .white
                                                                  : AppColors
                                                                      .kPrimaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: controller.isArticlesLoading.value
                                // child: controller.articleList.isEmpty
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    enabled: true,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: 8,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 15,
                                              mainAxisSpacing: 20,
                                              childAspectRatio: 1.6),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 110,
                                          width: 175,
                                          decoration: BoxDecoration(
                                            color: AppColors.kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : (controller.articleList.isNotEmpty
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15,
                                                mainAxisSpacing: 20,
                                                childAspectRatio: 1.6),
                                        itemCount:
                                            controller.articleList.length ?? 0,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () => Get.toNamed(
                                                controller.screensToGo[index %
                                                    controller
                                                        .screensToGo.length],
                                                arguments: [
                                                  controller.articleList[index]
                                                      .attributes
                                                ]),
                                            child: LibraryCard(
                                                cardTitle:
                                                    "${controller.articleList[index].attributes?.title}",
                                                image:
                                                    "${controller.articleList[index].attributes?.image}"),
                                          );
                                        },
                                      )
                                    : Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 30),
                                            Utils.assetImage(
                                                AppImages.searchIcon,
                                                height: 80),
                                            const SizedBox(height: 30),
                                            Text(
                                              Strings.noResultsForTopic,
                                              style: Utils.kParagraphTextStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.kGreyText),
                                            ),
                                            const SizedBox(height: 25),
                                            InkWell(
                                                onTap: () {
                                                  controller.resetFilters();
                                                },
                                                child: CustomButtons(
                                                  weight: Get.width / 2,
                                                  height: 40,
                                                  color: AppColors.kSecColor,
                                                  shadowColor:
                                                      AppColors.kSecColor,
                                                  borderRadius: 30,
                                                  title: Strings.backToContent,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontColor:
                                                      AppColors.kPrimaryColor,
                                                  withShadow: false,
                                                )),
                                          ],
                                        ),
                                      )),
                          ),

                          // builderDelegate: PagedChildBuilderDelegate(
                          //   itemBuilder: (BuildContext context, item,
                          //       int index) {
                          //     return InkWell(
                          //       onTap: () => Get.toNamed(
                          //           controller.screensToGo[index %
                          //               controller
                          //                   .screensToGo.length],
                          //           arguments: [item.attributes]),
                          //       child: LibraryCard(
                          //           cardTitle:
                          //               "${item.attributes?.title}",
                          //           image:
                          //               "${item.attributes?.image}"),
                          //     );
                          //   },
                          // ),
                          //),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Obx(() => Utils.bottomNavigationBar(
                controller, controller.unreadNotificationFlag.value)),
          ),
        );
      },
    );
  }
}
