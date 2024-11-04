import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nahlaonline/Controllers/HomeController/homecontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeCntrl = Get.put(HomeScreenCntrl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenCntrl>(builder: (_) {
      return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? null
                : Colors.white,
            appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : Colors.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 110,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nahla Online".tr,
                    style: GoogleFonts.raleway(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.grey.shade900,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  search(context, homeCntrl.searchFocusNode),
                ],
              ),
              surfaceTintColor: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : Colors.white,
              centerTitle: false,
              bottom: TabBar(
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.center,
                enableFeedback: true,
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white54
                        : Colors.black54,
                labelStyle: GoogleFonts.raleway(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey.shade900,
                    fontWeight: FontWeight.w600),
                physics: const BouncingScrollPhysics(),
                tabs: [
                  Tab(text: "Explore".tr),
                  Tab(text: "Sale".tr),
                  Tab(text: "Home".tr),
                  Tab(text: "Fashion".tr),
                  Tab(text: "Outdoor".tr),
                  // Add more tabs as needed
                ],
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                firstScreen(),
                const Center(child: Text("Sale Content")),
                const Center(child: Text("Home Content")),
                const Center(child: Text("Fashion Content")),
                const Center(child: Text("Outdoor Content")),
                // Add more TabBarView widgets if there are more tabs
              ],
            ),
          ),
        ),
      );
    });
  }

  //----------------------------------homeSlider
  Widget homeSlider(BuildContext context) {
    return

        // GetBuilder<HomeScreenCntrl>(builder: (_) {
        //   return
        //   Column(
        //     children: [
        //       SizedBox(
        //         height: 200,
        //         child: PageView.builder(
        //           controller: homeCntrl.pageController,
        //           itemCount: homeCntrl.posters.length,
        //           onPageChanged: (index) {
        //             homeCntrl.pageCarousal(index);
        //           },
        //           itemBuilder: (context, index) {
        // return Image.network(
        //   homeCntrl.posters[index],
        //   fit: BoxFit.fill,
        // );
        //           },
        //         ),
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: List.generate(homeCntrl.posters.length, (index) {
        //           return AnimatedContainer(
        //             duration: const Duration(milliseconds: 300),
        //             height: 4,
        //             width: MediaQuery.of(context).size.width /
        //                 (homeCntrl.posters.length * 4),
        //             margin: const EdgeInsets.only(top: 8, left: 6, right: 6),
        //             decoration: BoxDecoration(
        //               color: homeCntrl.currentPage == index
        //                   ? Colors.amber
        //                   : Colors.grey,
        //               borderRadius: BorderRadius.circular(3),
        //             ),
        //           );
        //         }),
        //       )
        //     ],
        //   );
        // });

        GetBuilder<HomeScreenCntrl>(builder: (_) {
      return CarouselSlider(
        items: homeCntrl.posters.map((url) {
          return Image.network(
            url,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            // height: 180.0, // Adjusts image height to fit within this size
          );
        }).toList(),
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  //-----------------------------------------------search

  SizedBox search(BuildContext context, FocusNode focusNode) {
    return SizedBox(
      height: 52,
      child: GetBuilder<HomeScreenCntrl>(
        builder: (_) {
          return Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) async {
              List<String> suggestions =
                  await homeCntrl.fetchHomeSearchData(textEditingValue.text);
              return suggestions
                  .where((suggestion) => suggestion
                      .toLowerCase()
                      .startsWith(textEditingValue.text.toLowerCase()))
                  .toList();
            },
            onSelected: (String suggestion) {
              handleSuggestionSelected(suggestion);
            },
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    controller: controller,
                    focusNode: focusNode,
                    onEditingComplete: onEditingComplete,
                    textCapitalization: TextCapitalization.sentences,
                    style: GoogleFonts.rubik(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 13),
                    decoration: InputDecoration(
                        hintText: 'What are you looking for?'.tr,
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white70
                                : Colors.black54),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset("assets/images/search.png",
                                color:
                                    Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white70
                                        : const Color(0xff767676),
                                height: 8,
                                width: 8,
                                fit: BoxFit.contain)),
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 18, top: 10, bottom: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white54
                                    : const Color(0xff010041).withOpacity(0.3))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.dark ? Colors.white54 : const Color(0xff010041).withOpacity(0.3))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xffc49a6d),
                            )),
                        filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.black45 : Colors.white)),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              List<String> optionsList = options.toList();
              return Material(
                // color: Colors.amber,
                elevation: 8.0,
                child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    itemCount: optionsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = optionsList[index];
                      return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                              onTap: () {
                                //
                              },
                              child: Text(option.tr,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

// Replace this function with your actual logic to handle suggestion selection
  void handleSuggestionSelected(String suggestion) {
    // Handle the selected suggestion
    print("Selected suggestion: $suggestion");
  }

//----------------------------------firstScreen
  Widget firstScreen() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 20),
        homeSlider(Get.context!),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeCntrl.gridText.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      homeCntrl.navigateToScreen(index);
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 72,
                              decoration: BoxDecoration(
                                  border: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Border.all(
                                          color: const Color(0xffc49a6d))
                                      : null,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.transparent
                                            : Colors.grey.shade200,
                                        blurRadius: 5)
                                  ],
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black45
                                      : Colors.white,
                                  shape: BoxShape.circle),
                              child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Center(
                                      child: Image.asset(
                                    homeCntrl.imageList[index],
                                    fit: BoxFit.contain,
                                  )))),
                          const SizedBox(height: 5),
                          Text(homeCntrl.gridText[index].toString().tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Free Shipping ",
                    style: GoogleFonts.raleway(
                        color: Colors.brown, fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: Text(
                      "Over SAR 250 on all choice items",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                          fontSize: 12.5,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Riyad Bank | ",
                    style: GoogleFonts.raleway(
                        color: const Color.fromARGB(255, 5, 47, 68),
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Text(
                      "Extra 100 SAR off when spend min 250 SAR",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                          fontSize: 12.5,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
//----------------------------------

//----------------------------------
}
