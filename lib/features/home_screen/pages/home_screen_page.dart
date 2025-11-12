import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_colors.dart';
import 'package:portfolio_website/core/constants/app_sizes.dart';

import '../../../core/constants/app_enum.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: AppColors.scaffoldBg,
      body: ListView( 
        scrollDirection: Axis.vertical,
        children: [ 
          //top nav button
          Container( 
            // height: 500,
            margin: EdgeInsets.symmetric(vertical: AppSizes.bodyPadding,horizontal: AppSizes.insidePadding),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.insidePadding,vertical: AppSizes.insidePadding ),
            width: double.maxFinite,
            decoration: BoxDecoration( 
              gradient: LinearGradient(colors: [ 
                Colors.transparent, 
                AppColors.bgLight1
              ]),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row( 
              children: [ 
                Text("RH",style: TextStyle(color: AppColors.yellowPrimary,fontSize: AppSizes.fontSizeExtraLarge,fontWeight: FontWeight.bold),),
                Spacer(),
                for(int i = 0 ; i<navItemList.length ; i++)
                TextButton(onPressed: (){ 
                  
                }, child: Text(navItemList[i],style: TextStyle(
                   color: AppColors.whitePrimary,
                   fontSize: AppSizes.fontSizeLarge,
                   fontWeight: FontWeight.w500

                ),))
              ],
            ),
          ),
                    Container( 
            height: 500,
            width: double.infinity,
            color: Colors.blueGrey,
          ),
                              Container( 
            height: 500,
            width: double.infinity,
          ),
                              Container( 
            height: 500,
            width: double.infinity,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}