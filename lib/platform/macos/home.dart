import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const String _OGURL = "https://www.youtube.com" ;
class MacHome extends StatefulWidget{
  const MacHome({super.key});

  @override
  State<MacHome> createState() => _MacHomeState();

}

class _MacHomeState extends State<MacHome>{
  InAppWebViewController? _webViewController;

  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _webViewController?.dispose();
    super.dispose();
  }

Widget _divText(){
  return Padding(
    padding: const EdgeInsets.only(left: 9.0, top: 9, bottom: 12),
    child: const Text("Explore", style: TextStyle(
      color: Color.fromARGB(147, 179, 178, 178),
                          fontFamily: 'Montserrat',
                          fontSize: 12

 
    ),),
  );
}

  Widget _navibtn({ required final IconData ico, required final String label,required final String addon}) {
    const Color color = Color.fromARGB(102, 255, 194, 194);
    return ConstrainedBox(constraints: BoxConstraints(
      maxWidth: 216
    ),
    child: GestureDetector(
      onTap: (){
        _webViewController?.loadUrl(urlRequest: URLRequest(
          url : WebUri("$_OGURL/$addon")
        )
        );
      },
      child: Row(        
        children: [
           SizedBox(
            width: 15,
          ),
          Icon(ico, size: 18, color: color),
          SizedBox(
            width: 18,
          ),
          Text(label, style: const TextStyle(
            color: color,
            fontSize: 14,
            letterSpacing: 3,
            fontFamily: 'Montserrat'

          )),
          SizedBox(height: 42,)
        ],
      ),
    ),
    );
}

  Widget _naviBtnTop({ required final IconData ico, required final String label, required final String addon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  4.5, vertical: 9),
      child: GestureDetector(
        onTap:(){
          _webViewController?.loadUrl(
            urlRequest: URLRequest(
              url: WebUri("$_OGURL/$addon")
            )
          );
        } ,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 0.9,
              color: const Color.fromARGB(45, 91, 100, 177)
            )
          ),
          child: SizedBox(
            width: 66,
            height: 63,
            
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(ico, size: 21, color: const Color.fromARGB(145, 193, 191, 221)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(label, style: const TextStyle(
                    color: Color.fromARGB(120, 191, 191, 211),
                    fontSize: 10.5,
                    letterSpacing: 1.5,
                    fontFamily: 'Montserrat'
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: const Color.fromARGB(48, 19, 0, 57),
    body: Row(
      children: [
        Container(
          alignment: Alignment.topCenter,
         color: Colors.transparent,
         width: 240,
         padding: const EdgeInsets.only(top: 36, left : 9), 
         child: SingleChildScrollView(
          
          physics: const BouncingScrollPhysics(),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Row(children: [
                _naviBtnTop(ico: CupertinoIcons.home,addon: "" , label: "Home"),
                _naviBtnTop(ico: CupertinoIcons.trash,addon: "shorts" , label: "Shorts"),
                _naviBtnTop(ico: CupertinoIcons.folder,addon: "feed/subscriptions" , label: "Feeds"),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 18),
                child: Row(
                  children: [
                 _naviBtnTop(ico: CupertinoIcons.profile_circled,addon: "feed/you" , label: "You"),
                _naviBtnTop(ico: Icons.history_toggle_off_rounded,addon: "feed/history" , label: "History"),
                 _naviBtnTop(ico: Icons.settings,addon: "account" , label: "Prefs"),
                  ],
                ),
              ),

               _divText(),
              _navibtn(ico: Icons.trending_up_rounded,addon: "feed/trending" , label: "Trending"),
              _navibtn(ico: CupertinoIcons.shopping_cart,addon: "channel/UCkYQyvc_i9hXEo4xic9Hh2g" , label: "Shopping"),
               _navibtn(ico: CupertinoIcons.music_albums,addon:  "channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ", label: "Music"),
                _navibtn(ico: CupertinoIcons.video_camera,addon: "feed/storefront" , label: "Movies"),
              _navibtn(ico: CupertinoIcons.recordingtape,addon: "channel/UC4R8DWoMoI7CAwX8_LjQHig" , label: "Live"),
              _navibtn(ico: CupertinoIcons.game_controller,addon: "gaming" , label: "Gaming"),
              _navibtn(ico: CupertinoIcons.news,addon: "channel/UCYfdidRxbB8Qhf0Nx7ioOYw" , label: "News"),
             _navibtn(ico: CupertinoIcons.sportscourt,addon: "channel/UCEgdi0XIXXZ-qJOFPf4JSKw" , label: "Sports"),
             _navibtn(ico: CupertinoIcons.book,addon: "feed/courses_destination" , label: "Courses"),
             _navibtn(ico: Icons.chair_rounded,addon: "channel/UCrpQ4p1Ql_hG8rKXIKM1MOQ" , label: "Fashion"),
             _navibtn(ico: Icons.podcasts_rounded,addon: "podcasts" , label: "Podcast"),
             
             ],
          ),
         )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri("https://youtube.com/"),
                  
                ),
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  transparentBackground: false,
                  allowBackgroundAudioPlaying: true,
                  verticalScrollBarEnabled: false,
                  clearCache: true,
                  clearSessionCache: true,
                  underPageBackgroundColor: Colors.blue.shade50, 
                ),
                initialUserScripts: UnmodifiableListView<UserScript>([
                   UserScript(
        source: r"""
          (function() {
            if (document.getElementById('Modif')) return;
            var style = document.createElement('style');
            style.id = 'alresized';
            style.textContent = `
      
#guide-button.ytd-masthead{
display: none !important;

}

#logo{
min-width: 140px !important;
height: 6px !important;
}

 #logo.ytd-topbar-logo-renderer{
display: none !important;
}

tp-yt-app-drawer,
#country-code,
ytd-mini-guide-renderer{
display: none !important;
}
    
            `;
            (document.head || document.documentElement).appendChild(style);
          })();
        """,
        injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
        forMainFrameOnly: false,
      ),
      
                ]),
                onWebViewCreated: (ctrl){
                  _webViewController = ctrl;
                },
              ),
            ),
          ),
        )
      ],
    ),
   );
  }


}

