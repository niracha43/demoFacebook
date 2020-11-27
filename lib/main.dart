import 'package:facebook/actionbtn.dart';
import 'package:facebook/feedbox.dart';
import 'package:facebook/storytile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //I'm going to disable the debug banner
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Let's add the color code for our project
  Color bgBlack = Color(0xFF1a1a1a);
  Color mainBlack = Color(0xFF262626);
  Color fbBlue = Color(0xFF2D88FF);
  Color mainGrey = Color(0xFF505050);

  //Here I'm going to import a list of images that we will use for the profile picture and the storys
  List<String> avatarUrl = [ //รูปโปร
  "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",//รูปโลก
    "https://i.pinimg.com/564x/c7/ab/8d/c7ab8dcfd618862eaaeacc60067c8bee.jpg", //kagaya
    "https://i.pinimg.com/236x/4f/70/f2/4f70f28404941cbd22bc879f52f22c31.jpg", //รูปทันจิโร่
    "https://i.pinimg.com/564x/84/e2/c3/84e2c324daa9276f35a1c75f3b01ec72.jpg", //Zenitsu
    "https://i.pinimg.com/564x/0f/2d/87/0f2d87b7a9c510462743047bc17220b5.jpg", //Muzan
    "https://i.pinimg.com/564x/64/0c/c3/640cc3fb9f8b8a8dd003fe33efccb285.jpg", //rui
    "https://i.pinimg.com/564x/ed/39/de/ed39dedf43a2f3ef575180d16702970f.jpg", //Enmu
    "https://i.pinimg.com/564x/b3/a7/e8/b3a7e8d643a6224bf6a88105fd237ec8.jpg", //Kokushibou
    "https://i.pinimg.com/564x/cd/3f/2f/cd3f2ff0cb459514217610493f6a7341.jpg", //Giyu
  ];
  List<String> storyUrl = [ //รูปโพส
    "https://i.pinimg.com/564x/4b/1d/22/4b1d22ddb955afae2b9860e5f831ba11.jpg", //kagaya
    "https://i.pinimg.com/564x/0f/6d/84/0f6d84b4c4b1fbba4e1889a2838ef557.jpg", //ทันจิโร่
    "https://i.pinimg.com/564x/92/cb/74/92cb741ceb5ac0cde7a22f034f43a5a9.jpg", //Zenitsu
    "https://i.pinimg.com/564x/b7/cb/e3/b7cbe39fa4bb2f60bd34db26c73b464e.jpg", //Muzan
    "https://i.pinimg.com/564x/f3/c7/00/f3c7003def4c224c7f22533ccb3d78f2.jpg", //rui
    "https://i.pinimg.com/564x/d8/0f/3b/d80f3b3e8cdf67e771f383c73b399331.jpg", //Enmu
    "https://i.pinimg.com/564x/68/2d/1a/682d1afca5117b04d612e21c1da70c16.jpg", //Kokushibou
    "https://i.pinimg.com/564x/eb/9c/5f/eb9c5f405067e9d93a60d20993ab0fd7.jpg", //Giyu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's add the bg color
      backgroundColor: bgBlack,
      //let's add the app bar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: mainBlack,
        title: Text(
          "Facebook",
          style: TextStyle(
              color: fbBlue
          ),
        ),
        // Now let's add the action button
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),

      //Now let's work on the body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //First of all we need to creat the post editor
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mainBlack,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 10.0
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(avatarUrl[0]),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 25.0),
                                hintText: "Post something...",
                                filled: true,
                                fillColor: mainGrey,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: mainGrey,
                        thickness: 1.5,
                      ),
                      //Now we will create a Row of three button
                      Row(
                        children: [
                          actionButton(
                              Icons.live_tv, "Live",
                              Color(0xFFF23E5C)
                          ),
                          actionButton(
                              Icons.image, "Picture",
                              Color(0xFF58C472)
                          ),
                          actionButton(
                              Icons.insert_emoticon, "Activity",
                              Color(0xFFF8C03E)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //We have finished the Post editor now let's create
              //the story's timeline
              //let's first create a new file for the custom widget
              //now let's buil the container
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 160.0,  //ค.ยาวของขนาด story
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,  //เปลี่ยนจากสไลด์แนวตั้ง เป็นแนวนอน
                  children: [
                    storyTile(avatarUrl[4], storyUrl[3], "Muzan Kibutsuji"),
                    storyTile(avatarUrl[5], storyUrl[4], "Rui"),
                    storyTile(avatarUrl[6], storyUrl[5], "Enmu"),
                    storyTile(avatarUrl[7], storyUrl[6], "Kokushibo"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //Now let's create the news feed
              //first we will make the custom container of the feed
              //Let's test our widget
              feedBox(avatarUrl[1], "Kagaya Ubuyashiki", "6 min", "ตระกูลอุบุยาชิกิ ผู้นำองค์กรนักล่าอสูร", storyUrl[0]),
              feedBox(avatarUrl[2], "Tanjiro Kamado", "14h", "มีประสาทสัมผัสการดมกลิ่นดีเยี่ยมที่ถึงขั้นทำให้สามารถรับรู้ความรู้สึกของทั้งมนุษย์และอสูรได้", storyUrl[1]),
              feedBox(avatarUrl[3], "Zenitsu Agatsuma", "1d", "มีประสาทสัมผัสในการได้ยินเสียงมากกว่าคนทั่วไป", storyUrl[2]),
              feedBox(avatarUrl[8], "Giyu Tomioka", "2d", "เสาหลักผู้สืบทอดปราณวารีคนปัจจุบัน", storyUrl[7]),
            ],
          ),
        ),
      ),
    );
  }
}

