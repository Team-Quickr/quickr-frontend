import 'package:flutter/material.dart';
import 'package:quickr/app_styles.dart';
import 'package:quickr/size_configs.dart';
import 'package:quickr/titlesModel/onboard_data.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int currentPage=0;
  PageController _pageController = PageController(initialPage: 0);
/*
  Container dotIndicator(index){
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingContents.length,
                    itemBuilder: (context, index) => Stack(
                      fit: StackFit.expand,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onboardingContents[currentPage].image,
                          height: SizeConfig.screenHeight, // Set height to fullscreen
                          width: SizeConfig.screenWidth, // Set width to fullscreen
                          fit: BoxFit.cover, // Adjust the BoxFit based on your needs
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: sizeV * 5,
                            ),
                            SizedBox(
                              height: sizeV * 50,
                            ),

                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: size.height * .4,
                            width: size.width,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget> [
                                Icon(
                                  onboardingContents[currentPage].icon,
                                  size:40,
                                  color: Colors.red[600],
                                ),
                                Text(onboardingContents[currentPage].title,
                                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: size.width*.7,
                                    child: Text(
                                      onboardingContents[currentPage].subTitle,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 15),
                                    ),
                                ),
                                Container(
                                  height: 50,
                                  width: size.width*.8,

                                  child:ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Material(
                                      color:(currentPage == 2)? Colors.red[600]: Colors.grey[200],
                                      child: InkWell(
                                        splashColor: Colors.red,
                                        onTap: (){
                                          if(currentPage<2)
                                            setState(() {
                                              currentPage++;
                                            });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Center(
                                            child: Text(
                                              currentPage == 2? "Let's Start":'Next',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: (currentPage == 2)? Colors.white: Colors.black,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  List.generate(3, (index) => Container(
                                        height: 10,
                                        width: 10,
                                        margin: EdgeInsets.symmetric(horizontal: 3),
                                        decoration: BoxDecoration(
                                          color: index == currentPage ? Colors.red :Colors.grey[200],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    )
                ),
            ),

          ],
        ),
      ),
    );
  }
}


