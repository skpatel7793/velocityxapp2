import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin{
  TabController? _tabController;
  double anim=1.0;
  double anim2=1.0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    withAnimation(vsync: this, tween: Tween(begin: 1.0,end: 0.0),
        callBack:( animationVal,ControllerVal){
          anim = animationVal!;
          setState(() {

          });
        },
    );
    withRepeatAnimation(vsync: this,
      isRepeatReversed: true,
      tween: Tween(begin: 2.0,end: 3.0),
      callBack:( animationVal,ControllerVal){
        anim2 = animationVal!;
        setState(() {

        });
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final tabindex= _tabController?.index;
    return Scaffold(

      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16,top: 16) ,

      ),
      body: VStack([
        VxBox(
          child: [
            VxBox()
                .square(100)
                .roundedFull
                .neumorphic(color: Vx.purple500,elevation: 30.0)
                .bgImage(DecorationImage(image: NetworkImage("https://imglarger.com/Images/before-after/ai-image-enlarger-1-after-2.jpg")))
                .white
                .make(),
            "Hi  "
            .richText
            .withTextSpanChildren(["Perry".textSpan.bold.make()])
              .white
            .xl2
            .make().p8().offset(offset: Offset(-300  * anim, 0.0)),
            "Solo Traveler".text.white.make(),
            VxTextField(
              borderType: VxTextFieldBorderType.none,
              borderRadius: 18,
              fillColor: Vx.gray200.withOpacity(0.3),
              contentPaddingTop: 13,
              hint: "search",
              autofocus: false,
              prefixIcon: Icon(Icons.search_outlined,color: Colors.white,),
            ).customTheme(themeData: ThemeData(
              brightness: Brightness.dark
            )).cornerRadius(10).p16()
          ].column()
        ).makeCentered().h32(context),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
            child: VStack([
              TabBar(
                controller: _tabController,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Vx.purple500,
                  unselectedLabelColor: Vx.gray400,
                  labelPadding: Vx.m16,
                  tabs: [
                Icon(Icons.map,size: 10).scale(scaleValue:tabindex==0? anim2:3.00),
                Icon(Icons.pin_drop,size: 10).scale(scaleValue:tabindex==1? anim2:3.00),
                Icon(Icons.restaurant,size: 10).scale(scaleValue:tabindex==2? anim2:3.00),
                Icon(Icons.person,size: 10).scale(scaleValue:tabindex==3? anim2:3.00),
              ]),
              TabBarView(
                controller: _tabController,
                  children: ["1,","2","3","4"].map((e) => VStack([
                    "Discover Place in London".text.gray600.xl2.bold.make(),
                    20.heightBox,

                    Travelcard(tittle:"Tower Bridge" ,subtitle:"South Work" ,imageurl:"https://i.ytimg.com/vi/Bl3akjUfM3U/maxresdefault.jpg" ,),
                    20.heightBox,
                    Travelcard(tittle:"london eye" ,subtitle:"Coutry hill" ,imageurl:"https://media.cntraveler.com/photos/55c8be0bd36458796e4ca38a/master/pass/london-eye-2-cr-getty.jpg" ,),

                  ]).p16()
                  ).toList()
              ).expand()
            ])
          ).white.make(),
        ).expand()
      ]),
    );
  }
}

class Travelcard extends StatelessWidget {
  const Travelcard({Key? key, required this.tittle, required this.subtitle, required this.imageurl}) : super(key: key);
final String tittle,subtitle,imageurl;
  @override
  Widget build(BuildContext context) {
   return  HStack([
      Image.network(imageurl,fit: BoxFit.cover,).wh(context.percentWidth*35, 100)
      .cornerRadius(20),
      20.widthBox,
      VStack([
        tittle.text.semiBold.make(),
        3.heightBox,
        subtitle.text.make().shimmer(),
        5.heightBox,
        [
          VxRating(
              size: 13,
              onRatingUpdate: (value){}),
          5.widthBox,
          "(100)".text.xs.gray600.make()
        ].row()
      ],crossAlignment: CrossAxisAlignment.start,
      ).expand()
    ]).cornerRadius(8).backgroundColor(Vx.gray300);
  }
}
