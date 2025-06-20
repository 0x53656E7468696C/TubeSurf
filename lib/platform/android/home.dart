
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AndroidHome extends StatefulWidget {
  const AndroidHome({Key? key}) : super(key: key);


  @override
  State<AndroidHome> createState() => _MyAppState();
}

class _MyAppState extends State<AndroidHome> {
  bool _pop = false;

 late final UserScript _fullscreenLandscapeScript = UserScript(
  source: r"""
    (function() {
      if (window.__PIP_LANDSCAPE_HOOKED__) return;
      window.__PIP_LANDSCAPE_HOOKED__ = true;

      document.addEventListener('click', function(e) {
        const btn = e.target.closest('.ytp-fullscreen-button');
        if (btn) {
          if (window.flutter_inappwebview && window.flutter_inappwebview.callHandler) {
            window.flutter_inappwebview.callHandler('lockToLandscape');
          }
        }
      }, true );

        document.addEventListener('fullscreenchange', () => {
        const isFs = !!document.fullscreenElement;
        window.flutter_inappwebview?.callHandler(
          isFs ? 'lockToLandscape' : 'unlockOrientation'
        );
      });

    })();
  """,
  injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
  forMainFrameOnly: false,
);

 
  static const _platform = MethodChannel('back_play_channel');

Future<void> enterPip() async {
  try {
    await _platform.invokeMethod('enterPip');

  } on PlatformException catch (_) {}
}

  


  InAppWebViewController? _webViewController;


  @override
  void initState() {
    super.initState();

 
  }




  @override
  Widget build(BuildContext context) {
    return PopScope(
      
            onPopInvokedWithResult: (willPop, res ) async {
      
         if (_webViewController != null) {
          _webViewController!.canGoBack().then((canGoBack) {
            if (canGoBack) {
              _webViewController!.goBack();
            } else {
              setState(() {
                 _pop = true;
              });
            
            }
          });
        } 
     
      },
      canPop: _pop,
      child: Scaffold(
       
        body: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri('https://www.youtube.com/')),
                initialSettings: InAppWebViewSettings(
                  userAgent: 
                    "Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36"
                      ,
                      disableHorizontalScroll: true,
                      allowsPictureInPictureMediaPlayback: true,
                      allowBackgroundAudioPlaying: true,
                      useShouldInterceptAjaxRequest: true, // Enable native interception
                      
                      useShouldInterceptRequest: true, // Enable native interception
                      
                      
                ),
                initialUserScripts: UnmodifiableListView<UserScript>([
                    
              UserScript(
                source: r"""
                        (function() {
                          if (document.getElementById('alresized')) return;
                          var style = document.createElement('style');
                          style.id = 'alresized';
                          style.textContent = `
              
                          
              
                          #logo-icon,
                          #country-code{
                          display: none;
                          }
              
                         #companion{
               display: none ;
               }
                        
               ytd-app{
               scroll-behavior: smooth;
                          overflow-x: hidden;
                          --ytd-app-fullerscreen-scrollbar-width: 0px;
                          
                        }
            
                        
                         @media (orientation: portrait) {
              ytd-app{
              max-width: 100vw;
              }
              
                         }

              @media (max-width: 400px){
             #below{
             max-width: 96.6vw;
             margin-left: 10.8vw;
             }
             .ytp-chrome-bottom{
             max-width: 90vw;
             margin-left: 9.9vw;
             }
              }    
              
              @media (orientation: portrait) and (min-width: 700px) {
              
              
                          html{
                          display: none;
                          }
                        }
              
                      
              
                          `;
                          (document.head || document.documentElement).appendChild(style);
                        })();
                """,
                injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
                forMainFrameOnly: false,
              ),
              
               UserScript(
              source: r"""
                (function() {

              
                        var style = document.createElement('style');
                        style.id = 'hide-ad-elements';
                        style.textContent = `
                          /* ——— Hide YouTube ad-elements ——— */
                          .ytp-ad-module,
                          .ytp-ad-player-overlay,
                          .ytp-ad-overlay-slot,
                          .video-ads,
                          .ytp-ad-skip-button-slot,
                          .ytp-ad-skip-button-container,
                          ytd-promoted-sparkles-web-renderer,
                          ytd-display-ad-renderer,
                          .ytp-ce-element,
                          ytd-banner-promo-renderer,
                          .ytp-ad-progress-list,
                          ytd-topbar-logo-renderer,
                          ytd-guide-section-renderer:nth-of-type(4),
                          .ytp-size-button,
                          .ytp-volume-icon,
                          .ytp-volume-panel,
                          .ytp-subtitles-button,
                          .ytp-fullerscreen-edu-button,
                          #footer
                          {
                            display: none !important;
                          }








                
                          #frosted-glass.with-chipbar.ytd-app{
                          max-height: 56px;
                          }
                          .reel-video-in-sequence-new{
                          margin-left: 0px;
                          }
                          #header.ytd-rich-grid-renderer{
                          display: none;
                          }
                           
                        
                        
                        ytd-watch-flexy[default-layout]:not([no-top-margin]):not([reduced-top-margin]) #primary.ytd-watch-flexy, ytd-watch-flexy[default-layout]:not([no-top-margin]):not([reduced-top-margin]) #secondary.ytd-watch-flexy{
                        padding-top: 0px;
                        }
                          #primary.ytd-watch-flexy {
                        padding-top: 0px;
                        
                        
                        }
              
                          ytd-miniplayer{
                          max-height: 210px;
                          max-width: 240px;
                         
                          }
              
                          .miniplayer #player-container{
                          max-height: 125px;
                          }
              
               
              
                          ytd-channel-video-player-renderer{
                          margin-left: -45px;
                          width: 412px;
                 }
              
                        #tabs,
                        tp-yt-paper-tabs{ 
                         margin-right: auto;
                margin-left: auto;
                padding-left: 20px;
                         } 
                         #tabsContainer{
                         }
              
                         ytd-two-column-browse-results-renderer{
                
                         }
              
                         ytd-two-column-browse-results-renderer.grid-1-columns, .grid-1-columns.ytd-two-column-browse-results-renderer{
                         min-width: 80% !important;
                        margin-right: 0px;
                         margin-left: 0px;
                         padding-left: 15px;
                         }
              
              
               #end ytd-button-renderer,
               #companion{
                            display: none !important;
               }
               #short-video-container .player-controls{
                            display: none !important;
                            }
              
                           #bottom-row {
                            margin-right: -0px;
                width: 98%;}
                
                #dismissible .details,
                #above-the-fold{
                padding-left: 10px;
                width: 96%;
              }

              
   
              
                        `;
              
                        (document.head || document.documentElement).appendChild(style);
              
                })();
              """,
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_END,
              forMainFrameOnly: false,
                ),
              
                    _fullscreenLandscapeScript,
                    // _homeLoads,
                ]),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                  _webViewController?.addJavaScriptHandler(
                      handlerName: 'unlockOrientation',
                callback: (args) async {
              await SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              return null;
                },
                  );
                  _webViewController?.addJavaScriptHandler(handlerName: 'lockToLandscape',
                   callback:
                    (args) async
                    {
                    await SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
              
                  });
                  _webViewController?.setSettings(
                    settings: InAppWebViewSettings(
                      useShouldInterceptAjaxRequest: true,
                      useShouldInterceptRequest: true,
                      // contentBlockers:contentBlockers,
                    ),
                  );
                },
                        
                   shouldInterceptRequest: (controller, request) async {
               
                final url = request.url.toString();
                if (url.contains('doubleclick.net') ||
                          url.contains('ads.pubmatic.com') ||
                          url.contains('googlesyndication.com') ||
                          url.contains('googleadservices.com') ||
                          url.contains('get_midroll_info') ||
                          url.contains('midroll') ||
                           url.contains('ads') ||
                           url.contains('adservice') ||
                           url.contains('googleadservices') ||
                           url.contains('pagead2')
                          
                          ) {
                        debugPrint('🔇 Blocked ad URL though normal : $url');
                        return WebResourceResponse(
                          data: Uint8List(0),
                          statusCode: 200,
                          reasonPhrase: 'Ad blocked', 
                        );
                }
                return null;
              }, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}

