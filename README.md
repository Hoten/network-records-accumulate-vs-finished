see https://github.com/GoogleChrome/lighthouse/pull/7478.

Closer look at accumulating network request's encodedDataLength from "Network.responseReceived / Network.dataReceived" vs what is reported in "Network.loadingFinished".

Summary,

1. Network Service enabled makes the accumulated total not equal the finished total more often.
2. requests for data-urls don't have dataReceived events
3. requests that have responses from cache don't have dataReceived events.

Output:

```
===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-0
===============
538C1377A888DC371B6177C1460EF745 undefined acc 1662 finished 2013
F2350634D853B568AB14B27FBF1CFD13 undefined acc 17437 finished 19772
EAE4474586C7C34637D44BD3B8620187 undefined acc 233498 finished 234514
E633B8F20D180DDC52E6704CE30D64C7 https://a125375509.cdn.optimizely.com/client_storage/a125375509.html acc 497 finished 0
A096E33868FCB8BCDFCD63DA9078A115 https://gum.criteo.com/syncframe?topUrl=www.cnn.com acc 207 finished 0
A3F6F71DCF576512A76E41766015E894 https://cdn.krxd.net/partnerjs/xdi/proxy.3d2100fd7107262ecb55ce6847f01fa5.html acc 696 finished 0
EF7D6D4C16C023D9D280EA5A1B01B510 https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t acc 691 finished 0
5A3E8CA4DA787D2E2DAB25956CCDF6D7 https://cdns.us1.gigya.com/gs/webSdk/Api.aspx?apiKey=3_gtUbleJNtrRITgx-1mM_ci7GcIrH8xL9W_VfAbzSa4zpFrRwnpq_eYd8QTRkr7VC&version=latest acc 437 finished 0
03DA5A0E69B865FC6D9481EB3A7C4829 https://widgets.outbrain.com/widgetOBUserSync/obUserSync.html acc 479 finished 0
68F58BCE5AE30AF7DF170BF2C69F1BA5 https://staticxx.facebook.com/connect/xd_arbiter/r/m5nTkygCewO.js?version=44 acc 235 finished 0
1000060986.499 https://s.amazon-adsystem.com/x/da2e6c890e6e3636 acc 650 finished 714
D54074A3CF67F0BC7F5BCEC4675A4FC3 https://assets.bounceexchange.com/assets/bounce/local_storage_frame10.min.html acc 371 finished 0
B8B646E6E0B85DEC9C6B7774BFC642AB https://static.yieldmo.com/partner.min.html?mps=0&partners= acc 588 finished 0
37779ACF9075E4979C9BC38E61611069 undefined acc 615 finished 800
5FB433527ED459448BF571CAB31A69C3 undefined acc 21551 finished 22595



===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-1
===============
5D5A9F23CFDE88B543AD8395827707A2 undefined acc 1662 finished 2014
23817FD320D087B3FC4531CACA205B6C undefined acc 16574 finished 18907
1000061463.6 https://github.githubassets.com/images/modules/site/octocats-desk.svg acc 153 finished 33827
1000061463.8 https://github.githubassets.com/images/modules/site/logos/airbnb-logo.png acc 185 finished 12868
1000061463.9 https://github.githubassets.com/images/modules/site/logos/sap-logo.png acc 152 finished 8811
1000061463.10 https://github.githubassets.com/images/modules/site/logos/ibm-logo.png acc 302 finished 5855
1000061463.11 https://github.githubassets.com/images/modules/site/logos/google-logo.png acc 319 finished 7706
1000061463.12 https://github.githubassets.com/images/modules/site/logos/paypal-logo.png acc 120 finished 17375
1000061463.13 https://github.githubassets.com/images/modules/site/logos/bloomberg-logo.png acc 152 finished 9875
1000061463.14 https://github.githubassets.com/images/modules/site/logos/spotify-logo.png acc 193 finished 6756
1000061463.15 https://github.githubassets.com/images/modules/site/logos/swift-logo.png acc 155 finished 15406
1000061463.16 https://github.githubassets.com/images/modules/site/logos/facebook-logo.png acc 153 finished 1634
1000061463.17 https://github.githubassets.com/images/modules/site/logos/node-logo.png acc 124 finished 14916
1000061463.18 https://github.githubassets.com/images/modules/site/logos/nasa-logo.png acc 194 finished 11259
1000061463.20 https://github.githubassets.com/images/modules/site/home-illo-team.svg acc 191 finished 31446
1000061463.21 https://github.githubassets.com/images/modules/site/home-illo-team-code.svg acc 318 finished 3360
1000061463.22 https://github.githubassets.com/images/modules/site/home-illo-team-chaos.svg acc 156 finished 2003
1000061463.23 https://github.githubassets.com/images/modules/site/home-illo-team-tools.svg acc 190 finished 2030
1000061463.25 https://github.githubassets.com/images/modules/site/integrators/slackhq.png acc 178 finished 11262
1000061463.26 https://github.githubassets.com/images/modules/site/integrators/zenhubio.png acc 167 finished 748
1000061463.27 https://github.githubassets.com/images/modules/site/integrators/travis-ci.png acc 319 finished 16967
1000061463.28 https://github.githubassets.com/images/modules/site/integrators/atom.png acc 298 finished 9280
1000061463.32 https://github.githubassets.com/images/modules/site/customer-stories/hero/ariya.jpg acc 193 finished 42726
1000061463.33 https://github.githubassets.com/images/modules/site/customer-stories/hero/freakboy3742.jpg acc 186 finished 33079
1000061463.36 https://github.githubassets.com/images/modules/site/customer-stories/hero/yyx990803.jpg acc 296 finished 33291
1000061463.82 https://github.githubassets.com/images/modules/site/patterns/dots-small.svg acc 186 finished 312
1000061463.85 https://www.google-analytics.com/r/collect acc 258 finished 311
1000061463.86 https://collector.githubapp.com/github/page_view?dimensions[page]=https%3A%2F%2Fgithub.com%2F&dimensions[title]=The%20world%E2%80%99s%20leading%20software%20development%20platform%20%C2%B7%20GitHub&dimensions[referrer]=&dimensions[user_agent]=Mozilla%2F5.0%20(Linux%3B%20Android%206.0.1%3B%20Nexus%205%20Build%2FMRA58N)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F74.0.3694.0%20Mobile%20Safari%2F537.36%20Chrome-Lighthouse&dimensions[screen_resolution]=412x660&dimensions[pixel_ratio]=2.625&dimensions[browser_resolution]=412x660&dimensions[tz_seconds]=-25200&dimensions[timestamp]=1552587416559&dimensions[request_id]=E528%3A9C2E%3A51CF8%3A80DFF%3A5C8A9A97&dimensions[region_edge]=sea&dimensions[region_render]=iad&&measures[performance_timing]=1-111-20-755-643-642-642-284-20-1-0--755-0---112-316-277-55--&&&dimensions[cid]=1702818526.1552587416 acc 494 finished 529
1000061463.88 https://github.githubassets.com/favicon.ico acc 197 finished 6724
E2D3DFAAE35879BE0AAB4ED915E59DC2 undefined acc 233498 finished 234512
1000061376.13 https://cdn.cookielaw.org/geoswitch/d22a6b50-6c73-4070-8922-86c722dd1f35.js?_vers=1 acc 325 finished 911
1000061376.18 https://amplify.outbrain.com/cp/obtp.js acc 395 finished 2390
1000061376.159 https://cdn.cnn.com/ads/cnn/singles/cnn_homepage_rb.js acc 200 finished 469
1000061376.160 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_politics.png acc 173 finished 4793
1000061376.161 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_health.png acc 173 finished 1862
1000061376.162 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_entertainment.png acc 174 finished 11343
1000061376.163 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_style_new.png acc 173 finished 3183
1000061376.164 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_travel.png acc 174 finished 1754
1000061376.165 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_bleacher.png acc 174 finished 16152
1000061376.166 https://cdn.cnn.com/cnn/.e1mo/img/4.0/vr/vr_new_asset.png acc 173 finished 3064
1000061376.167 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_nav_bottom.png acc 173 finished 919
1000061376.169 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_espaniol.png acc 174 finished 1806
1000061376.170 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_arabic.png acc 174 finished 3320
1000061376.180 https://native.sharethrough.com/assets/sfp-creative-hub-listener.js acc 338 finished 1385
1000061376.183 https://geolocation.onetrust.com/cookieconsentpub/v1/geo/countries/EU?callback=? acc 163 finished 196
1000061376.187 https://www.ugdturner.com/xd.sjs acc 169 finished 516
1000061376.191 https://adservice.google.com/adsid/integrator.js?domain=www.cnn.com acc 368 finished 490
1000061376.195 https://cdn3.optimizely.com/js/geo2.js acc 407 finished 703
6201E4DDC10104E3A24FF972B959D625 https://a125375509.cdn.optimizely.com/client_storage/a125375509.html acc 497 finished 0
1000061376.219 https://www.i.cdn.cnn.com/.a/bundles/usabilla.d98d38acb1b344069359.bundle.js acc 98 finished 1629
1000061376.225 https://static.ads-twitter.com/uwt.js acc 326 finished 2289
1000061376.228 https://cdn.livefyre.com/Livefyre.js acc 524 finished 1234
DD85CE3390274508CFAF54BA6CA0FD69 https://gum.criteo.com/syncframe?topUrl=www.cnn.com acc 207 finished 0
1000061376.230 https://api.rlcdn.com/api/identity?pid=2&rt=envelope acc 217 finished 250
1000061376.233 https://www.i.cdn.cnn.com/.a/bundles/one_tap.13a0708a53734bff762d.bundle.js acc 110 finished 732
1000061376.234 https://www.i.cdn.cnn.com/.a/bundles/weather.882c0ff82c9cbc56d952.bundle.js acc 672 finished 7137
1000061376.236 https://cdn.cnn.com/cnnnext/dam/assets/181031174049-01-mitt-romney-file-1031-small-tease.jpg acc 149 finished 9416
1000061376.237 https://cdn.cnn.com/cnnnext/dam/assets/190313231339-cuomo-don-split-small-tease.jpg acc 149 finished 5771
1000061376.238 https://cdn.cnn.com/cnnnext/dam/assets/190314014458-frank-cali-file-2008-restricted-small-tease.jpg acc 150 finished 10796
1000061376.239 https://cdn.cnn.com/cnnnext/dam/assets/181011082257-01-mnuchin-file-small-tease.jpg acc 149 finished 5815
1000061376.240 https://cdn.cnn.com/cnnnext/dam/assets/181208131951-trump-manafort-cohen-split-1208-small-tease.jpg acc 150 finished 11285
1000061376.241 https://cdn.cnn.com/cnnnext/dam/assets/161014155619-01-summer-zervos-1014-small-tease.jpg acc 149 finished 8687
1000061376.243 https://cdn.cnn.com/cnnnext/dam/assets/190208131339-05-matthew-whitaker-0208-small-tease.jpg acc 149 finished 7952
1000061376.244 https://cdn.cnn.com/cnnnext/dam/assets/190312202937-loughlin-singer-huffman-split-small-tease.jpg acc 150 finished 11902
1000061376.245 https://cdn.cnn.com/cnnnext/dam/assets/190313112419-01-betsy-devos-cabinet-meeting-0212-small-tease.jpg acc 149 finished 5600
1000061376.246 https://cdn.cnn.com/cnnnext/dam/assets/190312171133-elephant-queen-tease-small-tease.jpg acc 150 finished 13945
1000061376.247 https://cdn.cnn.com/cnnnext/dam/assets/180806184154-rosie-odonnell-2018-small-tease.jpg acc 149 finished 5842
1000061376.248 https://cdn.cnn.com/cnnnext/dam/assets/190311085936-wonder-park-small-tease.jpg acc 150 finished 16155
1000061376.249 https://nexus.ensighten.com/turner/cnn-prod/serverComponent.php?r=5.659832396016153&ClientID=1511&PageID=https%3A%2F%2Fwww.cnn.com%2F acc 237 finished 417
1000061376.250 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_badge_2up.png acc 174 finished 920
1000061376.251 https://www.i.cdn.cnn.com/.a/2.144.1/assets/video_buffer_square_blk.gif acc 121 finished 4161
1000061376.255 https://www.i.cdn.cnn.com/.a/bundles/animations.50393745fb6c1acf6756.bundle.js acc 113 finished 2661
1000061376.257 https://data.cnn.com/jsonp/breaking_news/domestic.json?callback=CNNBreakingNewsCallback acc 130 finished 367
1000061376.258 https://cdn.cnn.com/cnn/.e1mo/img/4.0/placeholders/video_placeholder.jpg acc 175 finished 22360
1000061376.259 https://cdn.cnn.com/cnnnext/dam/assets/150827065423-donald-trump-bible-small-tease.jpg acc 150 finished 14497
1000061376.260 https://cdn.cnn.com/cnnnext/dam/assets/190311123719-kangaroo-attack-small-tease.jpg acc 149 finished 6248
1000061376.262 https://cdn.cnn.com/cnnnext/dam/assets/190304093954-friends-pivot-small-tease.jpg acc 149 finished 6084
1000061376.263 https://cdn.cnn.com/cnnnext/dam/assets/190313212218-ridiculist-anderson-cooper-split-small-tease.jpg acc 149 finished 6060
1000061376.264 https://cdn.cnn.com/cnnnext/dam/assets/190313232629-03-midwest-bomb-cyclone-0313-small-tease.jpg acc 150 finished 13183
1000061376.265 https://cdn.cnn.com/cnnnext/dam/assets/190312152810-van-jones-at-cpac-vjs-pkg-vpx-00021613-small-tease.jpg acc 150 finished 12056
1000061376.274 https://cdn.cnn.com/cnnnext/dam/assets/190214165421-trump-mcconnell-national-emergency-04-large-tease.jpg acc 150 finished 19105
1000061376.275 https://cdn.cnn.com/cnnnext/dam/assets/181031174049-01-mitt-romney-file-1031-large-tease.jpg acc 150 finished 16612
1000061376.276 https://cdn.cnn.com/cnnnext/dam/assets/190313231339-cuomo-don-split-large-tease.jpg acc 150 finished 15646
1000061376.278 https://cdn.cnn.com/cnnnext/dam/assets/181011082257-01-mnuchin-file-large-tease.jpg acc 150 finished 14822
1000061376.281 https://cdn.cnn.com/cnnnext/dam/assets/190302135627-04-bernie-sanders-rally-nyc-0302-large-tease.jpg acc 150 finished 19475
1000061376.282 https://cdn.cnn.com/cnnnext/dam/assets/190208131339-05-matthew-whitaker-0208-large-tease.jpg acc 150 finished 21026
1000061376.284 https://cdn.cnn.com/cnnnext/dam/assets/190313112419-01-betsy-devos-cabinet-meeting-0212-large-tease.jpg acc 150 finished 14712
1000061376.286 https://cdn.cnn.com/cnnnext/dam/assets/180806184154-rosie-odonnell-2018-large-tease.jpg acc 150 finished 16787
1000061376.288 https://cdn.cnn.com/cnnnext/dam/assets/190314094604-cleveland-browns-fan-1-large-tease.jpg acc 150 finished 19373
1000061376.289 https://cdn.cnn.com/cnnnext/dam/assets/190313194921-karanja-family-ethiopia-crash-victims-large-tease.jpg acc 150 finished 23737
1000061376.291 https://cdn.cnn.com/cnnnext/dam/assets/190309161556-01-beto-orourke-sxsw-large-tease.jpg acc 150 finished 24928
1000061376.292 https://cdn.cnn.com/cnnnext/dam/assets/190214130640-cnn-myfreedomday-human-trafficking-00013212-large-tease.jpg acc 150 finished 22727
1000061376.293 https://cdn.cnn.com/cnnnext/dam/assets/150616071937-killer-mike-file-large-tease.jpg acc 150 finished 18870
1000061376.297 https://cdn.cnn.com/cnnnext/dam/assets/190314104500-dan-wakeford-restricted-large-tease.jpg acc 150 finished 24946
1000061376.298 https://cdn.cnn.com/cnnnext/dam/assets/190313092221-infinite-time-stock-large-tease.jpg acc 150 finished 23549
1000061376.299 https://cdn.cnn.com/cnnnext/dam/assets/190129120438-02-jussie-smollett-file-large-tease.jpg acc 150 finished 11536
1000061376.300 https://cdn.cnn.com/cnnnext/dam/assets/190314143051-mark-ruffalo-noah-centineo-large-tease.jpg acc 150 finished 27508
1000061376.301 https://cdn.cnn.com/cnnnext/dam/assets/190314093803-italy-painting-theft-fake-scli-intl-large-tease.jpg acc 150 finished 37841
1000061376.306 https://cdn.cnn.com/cnnnext/dam/assets/190313103212-haven-coleman-school-climate-strike-large-tease.jpg acc 150 finished 34272
1000061376.307 https://cdn.cnn.com/cnnnext/dam/assets/190313120835-04-otters-stone-anvils-large-tease.jpg acc 150 finished 30240
1000061376.308 https://cdn.cnn.com/cnnnext/dam/assets/190313175357-ntsb-trump-boeing-comments-split-jake-tapper-large-tease.jpg acc 150 finished 15242
1000061376.309 https://cdn.cnn.com/cnnnext/dam/assets/190127144826-afghanistan-us-troops-large-tease.jpg acc 150 finished 24883
1000061376.310 https://cdn.cnn.com/cnnnext/dam/assets/181002160931-encuentro-brain-dementia-large-tease.jpg acc 149 finished 8876
1000061376.311 https://cdn.cnn.com/cnnnext/dam/assets/190313125933-uss-fort-mchenry-large-tease.jpg acc 150 finished 25658
1000061376.312 https://cdn.cnn.com/cnnnext/dam/assets/190313215003-chris-cuomo-rnc-chief-ronna-mcdaniel-split-large-tease.jpg acc 150 finished 19132
1000061376.313 https://cdn.cnn.com/cnnnext/dam/assets/190313145030-02-ancient-finds-burial-large-tease.jpg acc 150 finished 41080
1000061376.314 https://cdn.cnn.com/cnnnext/dam/assets/190313192556-lisa-page-arrives-cap-hill-july-2018-large-tease.jpg acc 150 finished 23817
1000061376.315 https://cdn.cnn.com/cnnnext/dam/assets/190311194359-nancy-on-impeachment-large-tease.jpg acc 150 finished 21787
1000061376.316 https://cdn.cnn.com/cnnnext/dam/assets/190311104526-citizen-app-large-tease.jpg acc 150 finished 20175
1000061376.317 https://cdn.cnn.com/cnnnext/dam/assets/170607104343-space-debris-large-tease.jpg acc 150 finished 32427
1000061376.320 https://secure-us.imrworldwide.com/cgi-bin/m?ci=us-204044h&cg=0&cc=1&si=https%3A//www.cnn.com/&rp=&ts=compact&rnd=1552587392954&ja=1 acc 270 finished 332
1000061376.321 https://sb.scorecardresearch.com/r2?c2=6035748&d.c=gif&d.o=cnn-adbp-domestic&d.x=25484347&d.t=page&d.u=https%3A%2F%2Fwww.cnn.com%2F acc 266 finished 309
1000061376.322 https://www.i.cdn.cnn.com/.a/bundles/oneTapMobile.65cd2d60e2c08abafc41.bundle.js acc 163 finished 7318
1000061376.325 https://bat.bing.com/action/0?ti=5526986&Ver=2&mid=f7420fd5-af81-ac3f-047c-eb0ac8d8c7a4&pi=0&lg=en-US&sw=412&sh=660&sc=24&tl=CNN%20-%20Breaking%20News,%20Latest%20News%20and%20Videos&kw=cnn%20news,%20daily%20news,%20breaking%20news,%20news%20today,%20current%20events&p=https%3A%2F%2Fwww.cnn.com%2F&r=&lt=656&evt=pageLoad&msclkid=N&rn=845080 acc 140 finished 149
13D5BE7C233644909884070167646463 https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t acc 691 finished 0
1000061376.333 https://tr.outbrain.com/pixel?marketerId=006eb1f8dded486e0974a6b4a7b9805f5f&obApiVersion=1.0.11&name=PAGE_VIEW&dl=https%3A%2F%2Fwww.cnn.com%2F&optOut=false&bust=006766036755521987 acc 232 finished 301
1000061376.334 https://amplifypixel.outbrain.com/pixel?mid=006eb1f8dded486e0974a6b4a7b9805f5f&dl=https%3A%2F%2Fwww.cnn.com%2F&bust=0026719896792503306 acc 209 finished 269
1000061376.335 https://consumer.krxd.net/consent/get/e9eaedd3-c1da-4334-82f0-d7e3ff883c87?idt=device&dt=kxcookie&callback=Krux.ns._default.kxjsonp_consent_get_0 acc 472 finished 669
A0DE428E30160D1B9F88191B91AFCA24 https://cdn.krxd.net/partnerjs/xdi/proxy.3d2100fd7107262ecb55ce6847f01fa5.html acc 698 finished 0
1000061376.352 https://t.co/i/adsct?p_id=Twitter&p_user_id=0&txn_id=nyutn&events=%5B%5B%22pageview%22%2Cnull%5D%5D&tw_sale_amount=0&tw_order_quantity=0&tw_iframe_status=0 acc 413 finished 487
1000061376.354 https://cdn.cnn.com/cnn/.e/img/3.0/weather/weatherIcon_01.png acc 173 finished 1781
1000061376.357 https://gum.criteo.com/sync?r=2&c=160&j=_ccb acc 256 finished 295
BCFB05C04A8DAEAD511676A80160F146 https://cdns.us1.gigya.com/gs/webSdk/Api.aspx?apiKey=3_gtUbleJNtrRITgx-1mM_ci7GcIrH8xL9W_VfAbzSa4zpFrRwnpq_eYd8QTRkr7VC&version=latest acc 437 finished 0
1000061376.413 https://www.i.cdn.cnn.com/.a/bundles/fave.265a062520d8b9d5866b.bundle.js acc 100 finished 3545
1000061376.426 https://geolocation.onetrust.com/cookieconsentpub/v1/geo/countries/EU?callback=jQuery331022812265550497557_1552587393715&_=1552587393716 acc 163 finished 196
1000061376.435 https://registry.api.cnn.io/assets/fave/svg/live.svg acc 242 finished 1225
1000061376.436 https://registry.api.cnn.io/assets/fave/svg/go-live.svg acc 280 finished 1955
1000061376.437 https://odb.outbrain.com/utils/get?url=https%3A%2F%2Fwww.cnn.com%2F&settings=true&recs=true&widgetJSId=MB_12&key=NANOWDGT01&idx=0&version=01020501&apv=false&sig=2GdZ7yn3&format=html&rand=71522&osLang=en-US&winW=412&winH=660&scrW=412&scrH=660&adblck=false&secured=true&va=true&cmpStat=1&ref= acc 448 finished 5964
1000061376.439 https://connect.facebook.net/en_US/sdk.js acc 464 finished 2250
1000061376.441 https://widgets.outbrain.com/images/widgetIcons/ob_logo_16x16@2x.png acc 432 finished 2732
1000061376.442 https://widgets.outbrain.com/images/widgetIcons/achoice.svg acc 452 finished 1820
53FCCB80DE6B267867C943F5D33A17D4 https://widgets.outbrain.com/widgetOBUserSync/obUserSync.html acc 479 finished 0
1000061376.444 https://odb.outbrain.com/utils/get?url=https%3A%2F%2Fwww.cnn.com&settings=true&recs=true&widgetJSId=TR_1&key=NANOWDGT01&idx=1&version=01020501&apv=true&sig=2GdZ7yn3&format=html&rand=69898&lsd=e70a66b4-9d9f-4ff8-9aa0-027f5ea58e8e&lsdt=1552587394379&osLang=en-US&t=MV85NmE0NmQyMmU5NDVmOTkxYjU0NTI3OTVmYmVmZGM0OF8w&winW=412&winH=660&scrW=412&scrH=660&adblck=false&secured=true&va=true&cmpStat=1&ref= acc 89 finished 911
B86EFB25E13B7471AE20C187D592E63E https://staticxx.facebook.com/connect/xd_arbiter/r/m5nTkygCewO.js?version=44 acc 212 finished 0
4234654F92658A2DC684EF7C1FD30619 https://tpc.googlesyndication.com/safeframe/1-0-32/html/container.html acc 275 finished 0
1000061376.462 https://beacon.krxd.net/optout_check?callback=Krux.ns._default.kxjsonp_optOutCheck acc 253 finished 334
1000061376.463 https://cdn.krxd.net/userdata/get?pub=e9eaedd3-c1da-4334-82f0-d7e3ff883c87&technographics=1&callback=Krux.ns._default.kxjsonp_userdata acc 525 finished 803
1000061376.464 https://analytics.twitter.com/i/adsct?p_id=Twitter&p_user_id=0&txn_id=nyutn&events=%5B%5B%22pageview%22%2Cnull%5D%5D&tw_sale_amount=0&tw_order_quantity=0&tw_iframe_status=0&tpx_cb=twttr.conversion.loadPixels&tw_document_href=https%3A%2F%2Fwww.cnn.com%2F acc 202 finished 268
1000061376.467 https://static.chartbeat.com/js/chartbeat_mab.js acc 331 finished 8239
1000061376.468 https://tru.am/scripts/custom/cnn.js acc 381 finished 1036
1000061376.472 https://ping.chartbeat.net/ping?h=cnn.com&p=%2F&u=BLAGpdLb1-1mFLQ0&d=cnn.com&g=37612&g0=No%20Section&g1=No%20Author&n=1&f=00001&c=0&x=0&m=0&y=19221&o=412&w=660&j=45&R=1&W=0&I=0&E=0&e=0&r=&b=4899&t=DklAnu0cfnXCwNLAwYr4IvBM4TKB&V=112&i=CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos&tz=420&sn=1&sv=DCNy8OCDmPJ1Dl4PVMC_0RihDQ3XkQ&sd=1&im=067b2ff3&_ acc 107 finished 168
1000061376.475 https://www.google.com/pagead/1p-user-list/986255830/?value=0&guid=ON&script=0&cdct=2&is_vtc=1&random=1903480009 acc 325 finished 385
1000061376.476 https://t.co/i/adsct?txn_id=l4umf&p_id=Twitter acc 95 finished 169
1000061376.477 https://analytics.twitter.com/i/adsct?txn_id=l4umf&p_id=Twitter acc 92 finished 166
1000061376.478 https://www.google.com/pagead/1p-user-list/925133270/?value=1.00&currency_code=USD&label=IEQNCNXH9GcQ1tORuQM&guid=ON&script=0&cdct=2&is_vtc=1&random=1698537537 acc 49 finished 109
1000061376.481 https://d.agkn.com/pixel/9570/?che=1552587397&tid=MkHth4SO acc 540 finished 583
1000061376.482 https://s.amazon-adsystem.com/x/da2e6c890e6e3636 acc 650 finished 0
1000061376.485 https://cdns.gigya.com/gs/i/shareBar/button/mobile/buttonCenterImgUp.png acc 368 finished 541
1000061376.486 https://cdns2.gigya.com/gs/i/shareBar/button/mobile/buttonCenterImgUp.png acc 368 finished 541
1000061376.490 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&x=Q4OpuAzx17rAy&v=C&ml=m&sl=pmoZR&e=-1 acc 107 finished 168
1000061376.491 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&x=auUOFk45ybRN0&v=A&ml=m&sl=CnoAYQ&e=-1 acc 107 finished 168
1000061376.492 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&x=KdV8DmYslKljm&v=D&ml=m&sl=CcZwix&e=-1 acc 107 finished 168
1000061376.493 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&x=uXV2GxR9ugpOb&v=E&ml=m&sl=DhlnQb&e=-1 acc 107 finished 168
1000061376.494 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&me=3&ml=m&x=HhIfjNF37T4yV acc 107 finished 168
1000061376.495 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&me=3&ml=m&x=ks8zCAClJdExh acc 107 finished 168
1000061376.496 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&me=3&ml=m&x=iobJgaozGwpnv acc 107 finished 168
1000061376.497 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=BLAGpdLb1-1mFLQ0&c=0&me=3&ml=m&x=F8aLiu8VYSCuE acc 107 finished 168
1000061376.499 https://www.facebook.com/tr/?id=731697573629176&ev=PageView&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587397114&sw=412&sh=660&v=2.8.42&r=stable&ec=0&o=30&fbp=fb.1.1552587397112.1602341290&it=1552587397045&coo=false&rqm=GET acc 217 finished 270
D82C020093B4A53EFAABC48BFB36A4C5 https://assets.bounceexchange.com/assets/bounce/local_storage_frame10.min.html acc 371 finished 0
1000061376.502 https://ad.doubleclick.net/ddm/ad/jxgu/mysijdmy/;ord=1552587397519? acc 267 finished 328
1000061376.503 https://www.facebook.com/tr/?id=731697573629176&ev=Microdata&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587397618&cd[Schema.org]=%5B%5D&cd[OpenGraph]=%7B%22og%3Apubdate%22%3A%222014-02-19T19%3A15%3A05Z%22%2C%22og%3Aurl%22%3A%22https%3A%2F%2Fwww.cnn.com%22%2C%22og%3Atitle%22%3A%22CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos%22%2C%22og%3Adescription%22%3A%22View%20the%20latest%20news%20and%20breaking%20news%20today%20for%20U.S.%2C%20world%2C%20weather%2C%20entertainment%2C%20politics%20and%20health%20at%20CNN.com.%22%2C%22og%3Asite_name%22%3A%22CNN%22%2C%22og%3Atype%22%3A%22website%22%7D&cd[Meta]=%7B%22title%22%3A%22CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos%22%2C%22meta%3Adescription%22%3A%22View%20the%20latest%20news%20and%20breaking%20news%20today%20for%20U.S.%2C%20world%2C%20weather%2C%20entertainment%2C%20politics%20and%20health%20at%20CNN.com.%22%2C%22meta%3Akeywords%22%3A%22cnn%20news%2C%20daily%20news%2C%20breaking%20news%2C%20news%20today%2C%20current%20events%22%7D&cd[DataLayer]=%5B%5D&cd[JSON-LD]=%5B%5D&sw=412&sh=660&v=2.8.42&r=stable&ec=1&o=30&fbp=fb.1.1552587397112.1602341290&it=1552587397045&coo=false&es=automatic&rqm=GET acc 45 finished 98
1000061376.504 https://mms.cnn.com/aafd3t-P2xqeWR4bnlqZG94RHtCNitmaGh0enN5ZG5pQjg3PStmZ3VCa2ZxeGord2prand3andCK3hqeHhudHNkd2prand3andCK3hqeHhudHNkcmp4eGZsamRodHpzeUI1K297QjczNTM2NjY6K2hpaEJ8bnNpdHwzZHh1ZDNyeGwzZG5zeWp3c2ZxM2hpaDYrbXdqa0JteXl1eCo4Rio3Syo3S3x8fDNoc3MzaHRyKjdLK2h0c3hqc3laWk5JQnpzaWprbnNqaSt5KjpHfSo6SUJ- acc 1058 finished 1573
1000061376.505 https://www.summerhamster.com/bcn?fe=1552587397829&y=2.0.1115&elg=188396249&flg=328&x=zzz.fqq.frp%2F&vqwo=1&deo=0&g0=vg%3A%3Aer%2Cxd%3A%3Aqexd%3A%3Aqsu%7Cvg%3A%3Ask%3A%3Aqsk%3A%3Aqsu%7Cgisl%3A%3Alp%2Clqi%2Cqh%3A%3Aqoe%3A%3Aqsu%3A%3Axuo%3D%2F%2Fdg.grxeohfolfn.qhw%2Fggp%2Fdg%2Fmajx%2Fpbvlmgpb%2F%3Brug%3D1552587397519%3F%7Cjdg%3A%3Aho%2Ckl%2Cklg%2Clqi%3A%3Aqhk%3A%3Aqsu%3A%3Avho%3D.sodlqDg%7Cjdg%3A%3Aho%2Ckl%2Cklg%2Clqi%3A%3Aqhk%3A%3Aqsu%3A%3Avho%3D.sodlqDg%7Cddg%2Cjdg%3A%3Aho%2Ckl%2Cklg%2Clqi%3A%3Aqhk%3A%3Aqsu%3A%3Avho%3D.des_re_halvw&hu=0&g2=0%3A%3A0%3A%3A0%3A%3A0%3A%3A0 acc 120 finished 181
5F0625D40F4E7A8EF13E98B1B7CBB222 https://static.yieldmo.com/partner.min.html?mps=0&partners= acc 588 finished 0
1000061376.514 https://sb.scorecardresearch.com/p?c1=8&c2=18969557&ns_ap_it=b&rn=543249e026f491e853b4 acc 266 finished 309
1000061376.515 https://sb.scorecardresearch.com/p?c1=8&c2=18969557&ns_ap_it=b&rn=4d7196f5a2acf2dc35e3 acc 266 finished 309
1000061376.516 https://ad.doubleclick.net/ddm/trackimp/N183604.2005704YIELDMO/B22112508.238313618;dc_trk_aid=435673933;dc_trk_cid=67362106;kw=764344014241209959-2135502534671860754;ord=5760835456534763538;dc_lat=;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=? acc 52 finished 112
1000061376.519 https://static.yieldmo.com/images/ad-choices.svg acc 645 finished 1344
367147CB15E03A4389A3B7FE76871058 undefined acc 615 finished 800
074BCF3377D9922BA8964A5B9D02FCBA undefined acc 21293 finished 22338
1000061097.60 https://www.google-analytics.com/analytics.js acc 272 finished 17833
1000061097.61 https://paulirish.disqus.com/count.js acc 605 finished 1476
1000061097.62 https://www.google-analytics.com/r/collect?v=1&_v=j73&a=530761524&t=pageview&_s=1&dl=https%3A%2F%2Fwww.paulirish.com%2F&ul=en-us&de=UTF-8&dt=Paul%20Irish&sd=24-bit&sr=412x660&vp=412x660&je=0&_u=IEBAAEAB~&jid=2059424362&gjid=378416872&cid=1610177010.1552587363&tid=UA-692547-2&_gid=1517488526.1552587363&_r=1&z=1576463481 acc 146 finished 199



===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-0
===============
72F62F42CF6C91E6D3F8BCFD8E4AF6FD undefined acc 0 finished 2015
67A7BEAEAEC86EC25559429944C1C3A6 undefined acc 0 finished 19724
919BF92FA84DD347F829EEAED8277D8B undefined acc 0 finished 234511
EEE71B5846F5BDEF6C3631A3C4E183C1 https://a125375509.cdn.optimizely.com/client_storage/a125375509.html acc 497 finished 0
7A7AC73355037D31208245B3CAD24BA1 https://gum.criteo.com/syncframe?topUrl=www.cnn.com acc 207 finished 0
591A246AAC4FA2118C62CC9FF49F84C5 https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t acc 691 finished 0
D743CB471CA5142218AE2DD7A45759DF https://cdn.krxd.net/partnerjs/xdi/proxy.3d2100fd7107262ecb55ce6847f01fa5.html acc 697 finished 0
1000060397.416 data:application/font-woff;charset=utf-8;base64,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 acc 0 finished 4588
F840B673B1ABA3DA5602F63FE4C2ECDC https://cdns.us1.gigya.com/gs/webSdk/Api.aspx?apiKey=3_gtUbleJNtrRITgx-1mM_ci7GcIrH8xL9W_VfAbzSa4zpFrRwnpq_eYd8QTRkr7VC&version=latest acc 437 finished 0
704202F70DA74C28DE801F649E4354DD https://widgets.outbrain.com/nanoWidget/externals/obPixelFrame/obPixelFrame.htm acc 478 finished 0
02AF0A8EC0DE1ECBD043876A0ECA7C74 https://widgets.outbrain.com/widgetOBUserSync/obUserSync.html acc 479 finished 0
E9B917F03B63789E2EDA45DBF4A3E248 https://staticxx.facebook.com/connect/xd_arbiter/r/m5nTkygCewO.js?version=44 acc 235 finished 0
1000060397.503 https://s.amazon-adsystem.com/x/da2e6c890e6e3636 acc 650 finished 714
BA3F86591384DBA1FDB740D9FBF78768 https://assets.bounceexchange.com/assets/bounce/local_storage_frame10.min.html acc 371 finished 0
F5B91A13B18D93D93229FB14966DAF96 https://static.yieldmo.com/partner.min.html?mps=0&partners= acc 588 finished 0
C28E5487B5D87E5931A751E26C53C3FF undefined acc 0 finished 508
AE861B62A65C7B05DDA01C037A4C9684 undefined acc 0 finished 483
C5576DBC9A6D8EAEBE9DEE81899AC1D7 undefined acc 0 finished 804
D71F0E9061620A76563FC1484B9D6125 undefined acc 0 finished 22341



===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-1
===============
7CAD40D24E472F039098F7063EE1B46C undefined acc 0 finished 2014
927B1A2B4CC97740FB58480835BF5265 undefined acc 0 finished 19752
1000060792.7 https://github.githubassets.com/images/modules/site/logos/sap-logo.png acc 152 finished 8811
1000060792.8 https://github.githubassets.com/images/modules/site/logos/ibm-logo.png acc 155 finished 5708
1000060792.9 https://github.githubassets.com/images/modules/site/logos/google-logo.png acc 176 finished 7563
1000060792.10 https://github.githubassets.com/images/modules/site/logos/paypal-logo.png acc 296 finished 17551
1000060792.11 https://github.githubassets.com/images/modules/site/logos/bloomberg-logo.png acc 162 finished 9885
1000060792.12 https://github.githubassets.com/images/modules/site/logos/spotify-logo.png acc 326 finished 6889
1000060792.14 https://github.githubassets.com/images/modules/site/logos/facebook-logo.png acc 144 finished 1625
1000060792.15 https://github.githubassets.com/images/modules/site/logos/node-logo.png acc 157 finished 14949
1000060792.16 https://github.githubassets.com/images/modules/site/logos/nasa-logo.png acc 194 finished 11259
1000060792.18 https://github.githubassets.com/images/modules/site/home-illo-team.svg acc 218 finished 31473
1000060792.19 https://github.githubassets.com/images/modules/site/home-illo-team-code.svg acc 232 finished 3274
1000060792.20 https://github.githubassets.com/images/modules/site/home-illo-team-chaos.svg acc 194 finished 2041
1000060792.21 https://github.githubassets.com/images/modules/site/home-illo-team-tools.svg acc 167 finished 2007
1000060792.44 https://github.githubassets.com/images/modules/site/integrators/slackhq.png acc 274 finished 11367
1000060792.45 https://github.githubassets.com/images/modules/site/integrators/zenhubio.png acc 221 finished 802
1000060792.46 https://github.githubassets.com/images/modules/site/integrators/travis-ci.png acc 171 finished 16819
1000060792.47 https://github.githubassets.com/images/modules/site/integrators/atom.png acc 162 finished 9144
1000060792.51 https://github.githubassets.com/images/modules/site/customer-stories/hero/ariya.jpg acc 185 finished 42709
1000060792.52 https://github.githubassets.com/images/modules/site/customer-stories/hero/freakboy3742.jpg acc 260 finished 33153
1000060792.57 https://github.githubassets.com/images/modules/site/customer-stories/hero/jessfraz.jpg acc 172 finished 13031
1000060792.79 https://github.githubassets.com/images/modules/site/patterns/dots-small.svg acc 272 finished 398
1000060792.82 https://www.google-analytics.com/r/collect acc 49 finished 102
1000060792.84 https://www.google-analytics.com/collect acc 258 finished 311
1000060792.85 https://collector.githubapp.com/github/page_view?dimensions[page]=https%3A%2F%2Fgithub.com%2F&dimensions[title]=The%20world%E2%80%99s%20leading%20software%20development%20platform%20%C2%B7%20GitHub&dimensions[referrer]=&dimensions[user_agent]=Mozilla%2F5.0%20(Linux%3B%20Android%206.0.1%3B%20Nexus%205%20Build%2FMRA58N)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F74.0.3694.0%20Mobile%20Safari%2F537.36%20Chrome-Lighthouse&dimensions[screen_resolution]=412x660&dimensions[pixel_ratio]=2.625&dimensions[browser_resolution]=412x660&dimensions[tz_seconds]=-25200&dimensions[timestamp]=1552587276629&dimensions[request_id]=E28B%3A640D%3A79D130%3ABC0331%3A5C8A9A0B&dimensions[region_edge]=sea&dimensions[region_render]=iad&&measures[performance_timing]=1-113-23-793-666-663-663-337-23-2-1--793-0---114-360-322-57--&&&dimensions[cid]=1258414321.1552587276 acc 494 finished 529
1000060792.87 https://github.githubassets.com/favicon.ico acc 204 finished 6731
5A6FB5EDD48602D2FB20D3A7E7212783 undefined acc 0 finished 234513
1000060696.4 https://www.googletagservices.com/tag/js/gpt.js acc 341 finished 11154
1000060696.13 https://cdn.cookielaw.org/geoswitch/d22a6b50-6c73-4070-8922-86c722dd1f35.js?_vers=1 acc 325 finished 911
1000060696.18 https://amplify.outbrain.com/cp/obtp.js acc 395 finished 2390
1000060696.159 https://cdn.cnn.com/ads/cnn/singles/cnn_homepage_rb.js acc 200 finished 469
1000060696.160 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_politics.png acc 173 finished 4793
1000060696.161 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_health.png acc 173 finished 1862
1000060696.162 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_entertainment.png acc 174 finished 11343
1000060696.163 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_style_new.png acc 173 finished 3183
1000060696.164 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_travel.png acc 174 finished 1754
1000060696.165 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/menu_bleacher.png acc 174 finished 16152
1000060696.166 https://cdn.cnn.com/cnn/.e1mo/img/4.0/vr/vr_new_asset.png acc 173 finished 3064
1000060696.167 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_nav_bottom.png acc 173 finished 919
1000060696.169 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_espaniol.png acc 174 finished 1806
1000060696.170 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_arabic.png acc 174 finished 3320
1000060696.182 https://native.sharethrough.com/assets/sfp-creative-hub-listener.js acc 338 finished 1385
1000060696.183 https://geolocation.onetrust.com/cookieconsentpub/v1/geo/countries/EU?callback=? acc 163 finished 196
1000060696.187 https://www.ugdturner.com/xd.sjs acc 169 finished 516
1000060696.192 https://adservice.google.com/adsid/integrator.js?domain=www.cnn.com acc 368 finished 490
1000060696.195 https://cdn3.optimizely.com/js/geo2.js acc 407 finished 703
D57A248D372A82B8F2FF2BFFD0FFF21E https://a125375509.cdn.optimizely.com/client_storage/a125375509.html acc 497 finished 0
1000060696.219 https://www.i.cdn.cnn.com/.a/bundles/usabilla.d98d38acb1b344069359.bundle.js acc 761 finished 2292
1000060696.225 https://static.ads-twitter.com/uwt.js acc 324 finished 2287
1000060696.228 https://cdn.livefyre.com/Livefyre.js acc 524 finished 1234
5EE4B1CCF106579E495A4D2444C23474 https://gum.criteo.com/syncframe?topUrl=www.cnn.com acc 207 finished 0
1000060696.232 https://api.rlcdn.com/api/identity?pid=2&rt=envelope acc 217 finished 250
1000060696.233 https://nexus.ensighten.com/turner/cnn-prod/serverComponent.php?r=2.280655519817356&ClientID=1511&PageID=https%3A%2F%2Fwww.cnn.com%2F acc 237 finished 417
1000060696.234 https://www.i.cdn.cnn.com/.a/bundles/one_tap.13a0708a53734bff762d.bundle.js acc 99 finished 721
1000060696.236 https://cdn.cnn.com/cnnnext/dam/assets/190214165421-trump-mcconnell-national-emergency-04-small-tease.jpg acc 150 finished 10330
1000060696.237 https://cdn.cnn.com/cnnnext/dam/assets/181031174049-01-mitt-romney-file-1031-small-tease.jpg acc 149 finished 9416
1000060696.238 https://cdn.cnn.com/cnnnext/dam/assets/190313231339-cuomo-don-split-small-tease.jpg acc 149 finished 5771
1000060696.239 https://cdn.cnn.com/cnnnext/dam/assets/190314014458-frank-cali-file-2008-restricted-small-tease.jpg acc 150 finished 10796
1000060696.240 https://cdn.cnn.com/cnnnext/dam/assets/181011082257-01-mnuchin-file-small-tease.jpg acc 149 finished 5815
1000060696.241 https://cdn.cnn.com/cnnnext/dam/assets/181208131951-trump-manafort-cohen-split-1208-small-tease.jpg acc 150 finished 11285
1000060696.244 https://cdn.cnn.com/cnnnext/dam/assets/190208131339-05-matthew-whitaker-0208-small-tease.jpg acc 149 finished 7952
1000060696.245 https://cdn.cnn.com/cnnnext/dam/assets/190312202937-loughlin-singer-huffman-split-small-tease.jpg acc 150 finished 11902
1000060696.246 https://cdn.cnn.com/cnnnext/dam/assets/190313112419-01-betsy-devos-cabinet-meeting-0212-small-tease.jpg acc 149 finished 5600
1000060696.247 https://cdn.cnn.com/cnnnext/dam/assets/190312171133-elephant-queen-tease-small-tease.jpg acc 150 finished 13945
1000060696.248 https://cdn.cnn.com/cnnnext/dam/assets/180806184154-rosie-odonnell-2018-small-tease.jpg acc 149 finished 5842
1000060696.249 https://cdn.cnn.com/cnnnext/dam/assets/190311085936-wonder-park-small-tease.jpg acc 150 finished 16155
1000060696.250 https://www.i.cdn.cnn.com/.a/bundles/animations.50393745fb6c1acf6756.bundle.js acc 100 finished 2648
1000060696.251 https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_badge_2up.png acc 174 finished 920
1000060696.254 https://data.cnn.com/jsonp/breaking_news/domestic.json?callback=CNNBreakingNewsCallback acc 130 finished 367
1000060696.255 https://cdn.cnn.com/cnn/.e1mo/img/4.0/placeholders/video_placeholder.jpg acc 175 finished 22360
1000060696.256 https://cdn.cnn.com/cnnnext/dam/assets/150827065423-donald-trump-bible-small-tease.jpg acc 150 finished 14497
1000060696.257 https://cdn.cnn.com/cnnnext/dam/assets/190311123719-kangaroo-attack-small-tease.jpg acc 149 finished 6248
1000060696.258 https://cdn.cnn.com/cnnnext/dam/assets/190311191708-bush-family-impressions-bush-years-orig-00000000-small-tease.jpg acc 149 finished 7112
1000060696.259 https://cdn.cnn.com/cnnnext/dam/assets/190304093954-friends-pivot-small-tease.jpg acc 149 finished 6084
1000060696.260 https://cdn.cnn.com/cnnnext/dam/assets/190313212218-ridiculist-anderson-cooper-split-small-tease.jpg acc 149 finished 6060
1000060696.261 https://cdn.cnn.com/cnnnext/dam/assets/190313232629-03-midwest-bomb-cyclone-0313-small-tease.jpg acc 150 finished 13183
1000060696.262 https://cdn.cnn.com/cnnnext/dam/assets/190312152810-van-jones-at-cpac-vjs-pkg-vpx-00021613-small-tease.jpg acc 150 finished 12056
1000060696.271 https://cdn.cnn.com/cnnnext/dam/assets/190214165421-trump-mcconnell-national-emergency-04-large-tease.jpg acc 150 finished 19105
1000060696.272 https://cdn.cnn.com/cnnnext/dam/assets/181031174049-01-mitt-romney-file-1031-large-tease.jpg acc 150 finished 16612
1000060696.273 https://cdn.cnn.com/cnnnext/dam/assets/190313231339-cuomo-don-split-large-tease.jpg acc 150 finished 15646
1000060696.274 https://cdn.cnn.com/cnnnext/dam/assets/190314014458-frank-cali-file-2008-restricted-large-tease.jpg acc 150 finished 23776
1000060696.275 https://cdn.cnn.com/cnnnext/dam/assets/181011082257-01-mnuchin-file-large-tease.jpg acc 150 finished 14822
1000060696.276 https://cdn.cnn.com/cnnnext/dam/assets/181208131951-trump-manafort-cohen-split-1208-large-tease.jpg acc 150 finished 37146
1000060696.278 https://cdn.cnn.com/cnnnext/dam/assets/190302135627-04-bernie-sanders-rally-nyc-0302-large-tease.jpg acc 150 finished 19475
1000060696.279 https://cdn.cnn.com/cnnnext/dam/assets/190208131339-05-matthew-whitaker-0208-large-tease.jpg acc 150 finished 21026
1000060696.280 https://cdn.cnn.com/cnnnext/dam/assets/190312202937-loughlin-singer-huffman-split-large-tease.jpg acc 150 finished 42577
1000060696.281 https://cdn.cnn.com/cnnnext/dam/assets/190313112419-01-betsy-devos-cabinet-meeting-0212-large-tease.jpg acc 150 finished 14712
1000060696.282 https://cdn.cnn.com/cnnnext/dam/assets/190312171133-elephant-queen-tease-large-tease.jpg acc 150 finished 34721
1000060696.283 https://cdn.cnn.com/cnnnext/dam/assets/180806184154-rosie-odonnell-2018-large-tease.jpg acc 150 finished 16787
1000060696.284 https://cdn.cnn.com/cnnnext/dam/assets/190311085936-wonder-park-large-tease.jpg acc 150 finished 29435
1000060696.285 https://cdn.cnn.com/cnnnext/dam/assets/190314094604-cleveland-browns-fan-1-large-tease.jpg acc 150 finished 19373
1000060696.286 https://cdn.cnn.com/cnnnext/dam/assets/190313194921-karanja-family-ethiopia-crash-victims-large-tease.jpg acc 150 finished 23737
1000060696.287 https://cdn.cnn.com/cnnnext/dam/assets/190313091603-theresa-may-brexit-031319-side-large-tease.jpg acc 150 finished 17616
1000060696.288 https://cdn.cnn.com/cnnnext/dam/assets/190309161556-01-beto-orourke-sxsw-large-tease.jpg acc 150 finished 24928
1000060696.289 https://cdn.cnn.com/cnnnext/dam/assets/190214130640-cnn-myfreedomday-human-trafficking-00013212-large-tease.jpg acc 150 finished 22727
1000060696.290 https://cdn.cnn.com/cnnnext/dam/assets/150616071937-killer-mike-file-large-tease.jpg acc 150 finished 18870
1000060696.291 https://cdn.cnn.com/cnnnext/dam/assets/190305093958-20190304-fbi-most-wanted-version-final-large-tease.jpg acc 150 finished 35181
1000060696.292 https://cdn.cnn.com/cnnnext/dam/assets/190313141625-coca-cola-recycling-restricted-large-tease.jpg acc 150 finished 36740
1000060696.295 https://cdn.cnn.com/cnnnext/dam/assets/190313092221-infinite-time-stock-large-tease.jpg acc 150 finished 23549
1000060696.296 https://cdn.cnn.com/cnnnext/dam/assets/190129120438-02-jussie-smollett-file-large-tease.jpg acc 150 finished 11536
1000060696.298 https://cdn.cnn.com/cnnnext/dam/assets/190314093803-italy-painting-theft-fake-scli-intl-large-tease.jpg acc 150 finished 37841
1000060696.299 https://cdn.cnn.com/cnnnext/dam/assets/190313113924-celine-marti-large-tease.jpg acc 150 finished 37938
1000060696.300 https://cdn.cnn.com/cnnnext/dam/assets/190314112931-01-premature-train-journey-large-tease.jpg acc 150 finished 32626
1000060696.301 https://cdn.cnn.com/cnnnext/dam/assets/190312132507-02-opioid-photo-restricted-large-tease.jpg acc 150 finished 26198
1000060696.302 https://cdn.cnn.com/cnnnext/dam/assets/190314152249-01-australia-arrow-phone-large-tease.jpg acc 150 finished 10868
1000060696.303 https://cdn.cnn.com/cnnnext/dam/assets/190313103212-haven-coleman-school-climate-strike-large-tease.jpg acc 150 finished 34272
1000060696.304 https://cdn.cnn.com/cnnnext/dam/assets/190313120835-04-otters-stone-anvils-large-tease.jpg acc 150 finished 30240
1000060696.305 https://cdn.cnn.com/cnnnext/dam/assets/190313175357-ntsb-trump-boeing-comments-split-jake-tapper-large-tease.jpg acc 150 finished 15242
1000060696.306 https://cdn.cnn.com/cnnnext/dam/assets/190127144826-afghanistan-us-troops-large-tease.jpg acc 150 finished 24883
1000060696.307 https://cdn.cnn.com/cnnnext/dam/assets/181002160931-encuentro-brain-dementia-large-tease.jpg acc 149 finished 8876
1000060696.308 https://cdn.cnn.com/cnnnext/dam/assets/190313125933-uss-fort-mchenry-large-tease.jpg acc 150 finished 25658
1000060696.309 https://cdn.cnn.com/cnnnext/dam/assets/190313215003-chris-cuomo-rnc-chief-ronna-mcdaniel-split-large-tease.jpg acc 150 finished 19132
1000060696.310 https://cdn.cnn.com/cnnnext/dam/assets/190313145030-02-ancient-finds-burial-large-tease.jpg acc 150 finished 41080
1000060696.311 https://cdn.cnn.com/cnnnext/dam/assets/190313192556-lisa-page-arrives-cap-hill-july-2018-large-tease.jpg acc 150 finished 23817
1000060696.312 https://cdn.cnn.com/cnnnext/dam/assets/190311194359-nancy-on-impeachment-large-tease.jpg acc 150 finished 21787
1000060696.313 https://cdn.cnn.com/cnnnext/dam/assets/190311104526-citizen-app-large-tease.jpg acc 150 finished 20175
1000060696.314 https://cdn.cnn.com/cnnnext/dam/assets/170607104343-space-debris-large-tease.jpg acc 150 finished 32427
1000060696.317 https://secure-us.imrworldwide.com/cgi-bin/m?ci=us-204044h&cg=0&cc=1&si=https%3A//www.cnn.com/&rp=&ts=compact&rnd=1552587254833&ja=1 acc 270 finished 332
1000060696.318 https://sb.scorecardresearch.com/r2?c2=6035748&d.c=gif&d.o=cnn-adbp-domestic&d.x=256178630&d.t=page&d.u=https%3A%2F%2Fwww.cnn.com%2F acc 266 finished 309
1000060696.326 https://www.i.cdn.cnn.com/.a/bundles/oneTapMobile.65cd2d60e2c08abafc41.bundle.js acc 123 finished 7278
1000060696.329 https://bat.bing.com/action/0?ti=5526986&Ver=2&mid=7ba5a8a7-cdc3-7090-b15e-55f81f4702f2&pi=0&lg=en-US&sw=412&sh=660&sc=24&tl=CNN%20-%20Breaking%20News,%20Latest%20News%20and%20Videos&kw=cnn%20news,%20daily%20news,%20breaking%20news,%20news%20today,%20current%20events&p=https%3A%2F%2Fwww.cnn.com%2F&r=&lt=670&evt=pageLoad&msclkid=N&rn=23895 acc 139 finished 148
317A5E2DFAEFB0D0C64052BF66DFAF82 https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t acc 691 finished 0
1000060696.347 https://t.co/i/adsct?p_id=Twitter&p_user_id=0&txn_id=nyutn&events=%5B%5B%22pageview%22%2Cnull%5D%5D&tw_sale_amount=0&tw_order_quantity=0&tw_iframe_status=0 acc 411 finished 485
1000060696.348 https://consumer.krxd.net/consent/get/e9eaedd3-c1da-4334-82f0-d7e3ff883c87?idt=device&dt=kxcookie&callback=Krux.ns._default.kxjsonp_consent_get_0 acc 472 finished 669
78625D58F36E70B18D2A1C402A136621 https://cdn.krxd.net/partnerjs/xdi/proxy.3d2100fd7107262ecb55ce6847f01fa5.html acc 697 finished 0
1000060696.365 https://tr.outbrain.com/pixel?marketerId=006eb1f8dded486e0974a6b4a7b9805f5f&obApiVersion=1.0.11&name=PAGE_VIEW&dl=https%3A%2F%2Fwww.cnn.com%2F&optOut=false&bust=0189189227589996 acc 231 finished 300
1000060696.366 https://amplifypixel.outbrain.com/pixel?mid=006eb1f8dded486e0974a6b4a7b9805f5f&dl=https%3A%2F%2Fwww.cnn.com%2F&bust=05553333576721988 acc 209 finished 269
1000060696.369 https://gum.criteo.com/sync?r=2&c=160&j=_ccb acc 256 finished 295
1000060696.370 https://www.i.cdn.cnn.com/.a/bundles/video.35ac210447d6a82e4788.bundle.js acc 716 finished 7199
1000060696.407 https://www.i.cdn.cnn.com/.a/bundles/fave.265a062520d8b9d5866b.bundle.js acc 72 finished 3517
3EF3B9918BA3A5A1462F558B7D461960 https://cdns.us1.gigya.com/gs/webSdk/Api.aspx?apiKey=3_gtUbleJNtrRITgx-1mM_ci7GcIrH8xL9W_VfAbzSa4zpFrRwnpq_eYd8QTRkr7VC&version=latest acc 437 finished 0
1000060696.411 https://cdn.cnn.com/cnn/.e/img/3.0/weather/weatherIcon_01.png acc 173 finished 1781
1000060696.421 https://geolocation.onetrust.com/cookieconsentpub/v1/geo/countries/EU?callback=jQuery33108799895995098528_1552587255514&_=1552587255515 acc 163 finished 196
1000060696.415 data:application/font-woff;charset=utf-8;base64,d09GRgABAAAAABHsAAsAAAAAHagAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAABHU1VCAAABCAAAADsAAABUIIwleU9TLzIAAAFEAAAAQAAAAFZRml4FY21hcAAAAYQAAADlAAADaPPVq1VnbHlmAAACbAAADD4AABNIsSf7emhlYWQAAA6sAAAALQAAADYUfrcoaGhlYQAADtwAAAAdAAAAJBAACSNobXR4AAAO/AAAABQAAACYCPcAAGxvY2EAAA8QAAAATgAAAE5Y2lRsbWF4cAAAD2AAAAAfAAAAIAE3AIFuYW1lAAAPgAAAATMAAAIuu3xbGHBvc3QAABC0AAABNQAAAfoj32fCeJxjYGRgYOBiMGCwY2DKSSzJY+BzcfMJYZBiYGGAAJA8MpsxJzM9kYEDxgPKsYBpDiBmg4gCAClZBUgAeJxjYGT7yTiBgZWBgaWQ5RkDA8MvCM0cwxDOeI6BgYmBlZkBKwhIc01hcPjI+FGVHcRdCCQFgTQjiAMAPjwLRnic7dHZbcQgAEXR6zHj2Tz7vq/8pbIUlK+UlGaoYMLjpYxYOlwZYWQB0AXq7CMLUH1Toecrz1ZlvmZY5gOfZU3QfIrvdx4rjfk9lLGT14a8Y0OPPoP83YiWMROmzJizYMmKNRu27Nhz4MiJMxeu3Ljz4MmLmLdq+H9aDdXP31vUaVs5/46h1qZ7TMF0I6lruuPUGGrPUPuGOjDUoenu08hQW9PfpbGhTgx1aqgzQ50b6sJQl4a6MtS1oW4MdWuoO0PdG+rBUI+GejLUs6FeDPVqqDdDvRvqw1Cfhvoy1GjEX7MKWnIAAAB4nJ0YC3BU1fWd9/a9TbLJhs3+yIfNvmyym2ySTbLfkM1nJYRfQhKCQQEJBPJlsQEpCFhwR5xYEgQVNiKCVIu0Qp2x1YIDg5M6U2t1DFBNLHWYrlanFipCRaoke+25bzc/Ic7YvNzfueeee+45555z7jLA4B/fy/cyLMOACthGzs33Dl9mFQzD0TnBL/hxLpVxMkwsq86QK0EuTNMbQK8zesrB455msYHFzGVIjVMC2aVpjYTKXoF+4gse6O0emOn1zhzo7oXC8f6BrV3+Y/kFBfnH/F3/Ge+yhVCP37MSDjl/29pb/d9fEeky9BR4Hh+eh2PkeCJRlQMqUQX9kEsG2UbIhU0y3fBlmQ7RZNL5jIIRMfWMhbEivtNitmj1bo9Grne7nPRMWnoWkCMlEeUjyLVuj94Dcr3svNPe+Dp3JmfDwqrKq8F1xwuKhl9bCc3kCN0EyuuXPrPtmZXhVYcOcYHmhnrri69Pn75m9Yanjh7e/djZjIPGfa2dbN5KcoT4SC/cJG+WpR40tRxYKes7dAjZkvQiO8EPMTzVC92aVYAVNpMe2Sq6RHac9DKj521DvBhGGeVf5fa4I0v4Vqf97rvtzpFplCfSG+EkfMxa3wB3jVHhonJIxL2UTAbDqCOLR2lx2jF1akc1HooQZP+IQmi0O8/Q4xcVHF8XvFpZheIY5zE0tiN7TTr0552t+4wHM84+thtKUBKjepBskGcUjAp1wYBJJbpMnMPlcIlg0ooqE6d1aB0qVtEHm0N9fSHSwwVCsLkvFOpjr5CePjYu1DcSwEn2F30IvyNNSkBUS9RAoqx20W1gU6iP9IQoNeinlPsomUYc4xA2D18OIZyCmTF5D6G81RJNMUMJWpXGAA7RXg4uldMGHFoK7xsJ5MzOzp6dw0XbkQAX4AelzoSJ4StcgBHG7lkMk8BoGQNjYvLwtoHZlCEX5JCFVgi8CKgKl5NHExS0Gr3Io1LAATqH3eP2APsGtDTUP/rQ5jWQxO1xfHGEXGU/C5+HbSscrpEkcgmbRLYw/CnOQNIWcmlxHcUlV7lrbIc6P3cRsTz4y1ulxFId3tj28KN7q6vhG6ldUI1guEhiKBJcpNZIeY2eP5VJR17vKAUQtSKILpHHQj9+cHhJTlV2dlWO7LjUDueDlQyxl8M69jK6iCGw0t7tIgqfCJLBYDDYF6RbR21V2j+XqZxib5PLpEUNazVCLmSYEeb2gl2n5aeCo8PLpjxly3RSG35kfTC4Pjc9lJ6Xh1Uuq6BjqSsB78DlzaxQ1gKKDlZaL5g8jOrYKLsp+SUFkxixH7UDTTBaqLRUtGhFVygo/UGuTDt8JVI4Vx/6UegPEh/tsI3B4KifEERhHVOEgwy0FrfTAigMlAVKgspGowcbmLBHZWRHW0HzMUBknvdZqw3hf8vlbKKhLresvbS0fVt7qTx8fXRUlltnYDWCt2Vzi9fbwtYZ0sCTak8F5wyjhIoYyankvbTIyJhG3kme7m0pKaH4Y/dFWIq2XcnUI4fIHYYIC2eDRDAXUMbEDCERbdpiFuScoEsHQaNHT6NXG6ACcCjp1V2Bxq/XuT1qt9nCZ9jAWQ52A2iUwJ/g+efiBHmfPCX+dOmsNE6rJENKLZs2u+R0Qoo8KOcVh3n+sILHbkrCaW9lGqtVgnUyRrh47pY5c7bsoRXnsZZbH4pNjQcuPpavtqW+pUxKUr6Vll/Nx8aTcHxq7ENRBBzchoCLUmPvipLCKqofereno7Y1t8VNoxQkg7cFxmjQ4wJTBM5x2UZoS9r/sbF5SupThGXB/6MDMjeJx/L/h0s1qnlM5chyT/c5uvm57h4oHO9PwXJ71EqxotwjIjl/G4GpuGcbR29EaftYviAKIt7ddCaHyf8B74M3Gj2NF0R0LyqNYBI9eMPv6GfW439fxEuQIXQzghGnJuGNBNAT9J85QxHS89aHvq/7zB+QqloeC5ZY8MRisJhS3Zc6yQ1yoxMU5OtOiIf4TvL11KoeiZ2ECApcHPVD/JBwEvMozFdiQWXX66gGMVplYB5hdpkixm+XmHNGVB7A1GfTto42b1mZt63jBu0EC/Jf9Hfd6PK/SFWBXb4X40QvIlopzledraVlZaWtnVsn6PsrxLYVRHmowLRPQ3kwZQgzQOQwxKuof3W6HXa+4vCSUsiyEDLw3XfnX94n3CDfzJt3lvw1HMv+F7L/dvo9ZkzPe5BOIVPFrGLWITWNgdPiYWSmDHoWJ4ZijMoup0dAAB2WowHITQb0tkrOYpcitY1FDmisNnBqezmLAChAn8diVFciMQOLCQkaisuEqYiDS/ctX+YrnEcuH3n0s5lZSxfsBJUxXWvT7X93XsXC99fDCz07F9QUVc0pespcn+LKqFjrsy5KLtDkli11l/iXe5SJakNcWlbtNKOro2uxe86G7Zx/cLDzgw86uU8zqyrrA7XLFm/buHhV6dxFPbaGJKsvJ7NI9of9DQfds3z3VuxeNm/jXK+vXEyd2VbSvb3BInpbbe3tDc6Rp1OcTeXJhZnTTQr9jGJWmVm8wjvH753BrVv30UfrLkbvdwDjD4e5o1XKVVWgk+Kr023X0aHTHBGESkyaVoB5gamcc+DMJXISVkL73WxDS/uxFtlecmrRkopGrYKcYgFgPquxzm2vOHFetndE5P4O9vmrV+9rbh65FH6bTep8sMphcIQ/hL1wrbDwCWNhcfo/RmPhfgy11BsKcp1WwypBZjJaaJKEBhdpykCnl3Snk+nNkllgvi/I3cL+ypVQ8+wQ+ctvyPWPTbkfv9J5LF1My7Wu3ze7dlZt3lZY/lbM2e7dq+5fldW5gu9YXaVMe4SEr566/0lZD7u9mVfof7tJZuby9iy+tzr4apw5s/tsm3bmxoq40TjNB9CmML8GPb2sNs6lMrnKZWg7XhQTpqVoEx43X1ivf2Vpx8vra8Vfz3tgdqGGB7nsBiwkv0swVhbWwrkvTOXAFt+3ZUsJa/ww5Z4VXffk83Jy70j4lsHpMgAblUNACDALqOWyaLQWjKCRpICaYcQA8XrSsOq2RISA0qLG7KGWShWGeQMn6M04Sso0ypKEwAA5cqHL71W7NWvLtr7R8eAnezpPPrw8t36hISZGYAWV48JLT7+0y1+2QBmTpXfby5ckr1HJBsgANMML0DzABS6QIwPGFXPft8zcda3vgbd3lKza3l3Z8Zwx3pg+XdBrypY9ffHozuNX7ykzbVqabp/1QOP8ItI0x78cfvavC0gA92fomw4rkJ3D7Elkipk6po3ZwPyU2p3DTT0O/SRfKBcsmGCYPZg1uG0gV2l4nUfKI9wut8Uk6DG3oMga/SjYMwGs1U0B5h0VgM8Ik6AA0Fq4tLQOW42zLG9hbkGcvHH23MWuDpcV2BMN/lh54Wof7EhJUkyLy8QUbMcM4FiBs+hTITMK1AHsMICM5WUUakpW3wH6beXVuz4+/l7C9S9Z3R74MxtmMcVITPfc17p16YGCohgZAMvJ3uSW1MxqcfIkKH9TrlYYNb65dYv/9HJMDB8rzK25b3n/6R8B7W+BVi5eS3aSbgh/C+M55kn6KolGGinmUbN1TQzY6G9VjkgcjDr4Xdu3nHa4MEsMkcGc7Cebmj9obnoyO4cMhjC0uhynt2wXfu90nNmyfVf4JkIwq/U3Nz2RnZOT/URTsz8YPoFL2TikcsbhjMa9776MIWgGsfhWYpIjSbPKoaKOhvt5OE34/OhwWHZBztzqPSrLD/+Ec4+YR97h3JG3w9jaJEY3abWcvlcwTkwg861/Dcwn11ndUZg/iSB5ew05dZTVkevkV1HSP0ibFg8O1RNoJyNRpAKJA5NJnwpfhkRyCnc+Gu6KEo++HaK/aYy9HegvEvSDaMka/a1DeplLpX+8Jr7RPvcu9I+46K8ykVIdaUZ9FH0zK3CAWQPmDnrMHYDvXUtWkpVr4XmpgudxyItYSb3xibH3mZ/3MTMwGnikDIkai45m8R415nA6mtrTERqJGSbm8uLEgZBw65Msl9sMLYbC2I4E7zxvQociPxXaLB7P8D/za/Lza5bV5OXVsIfzabOMAnhfsWXkK0uxmIKP8JwckYRTxGILl5DtCT9cUNtUm59f21Rns9WtqLXZalfUFozF+oXCwjHZMmpRcsaSTGn7Krsx/DgtnGW0JywMP/5a+HH+oNQghf8BTvXu2AAAeJxjYGRgYADiJNPak/H8Nl8ZuNkZQOCawTY5BP3/Pcc/sDgHAxOIAgAeUwpKAAAAeJxjYGRgYGcAAY6/DAz//3P8Y2BkQAVqAFkyBDkAAAB4nGNgYGBgHyDM8ReB0eUAkfUD/gAAAAAADgBoAH4AzADgAQIBQgFsAZgBwgIYAlgCtALgAzADsAPeBDAElgTcBSQFZgWKBiAGZga0BuoHWAgSCFgIdgikCNIJBgkoCYAJpAAAeJxjYGRgYFBjKGVgZwABJiDmAkIGhv9gPgMAGFoBuQB4nG2RTUrDQBiG3/RPTEEUxY2b2ehGSH+WXQr92RVK6T5tJ2lLkgnTabF38AQewkO48AwewkP4dvygIJ2Bb5555p0vJAFwjS8EOI4Aoa/HUcEFd39cJd0I18gPwnU08SjcoG8Lh3hGT7iJW2h2CGqXNHd4Fa7gCm/CVfp34Rr5Q7iOe3wKN+i/hUPM8CPcxFPwMh31x2UWH7Sd6HSXxfYkTjTTdrs2hepE7ZMc6kLb2Omlmh/Udp92nUtUYk2uBqZwOsuMKq3Z6IWLVs6VvVYrER8tTI4pRuhjjBIZYhz4phYT1hQ7b+zZxDk383WLNQwKKHQQ8XueSw5ZC08xHNcl03OeKd7e88ldWoeE+4QZg5w08F2P6YzT0JT+bEOzoI+w8rdK/rcWZ/IvHzHFTr/FV2JUAHicbVBrc4IwEGRVEKStr7ba99t+4kdBOCFjIDQPbf99I+hMZ+p9uOztXXK78XpeF1PvdKzQQx8D+AgwRIgII8Q4wzkuMMYEU8wwxyWucI0FlrjBLe5wjwc84gnPeMEr3vCOD6zw6Q0akf7E+5Qwrpggv0mtpngrha0oqayh0QELuTvCiufHiZIX5WRthdBMEdUJ1YbU+C/xzU2gv2yqaKgbXtekIm0zw40gHbK0MVzWDpQOkdK+Lt1kn8ki6ARddEcirRG8pvmhbB86aO6VecDSmpEIFO29hOuUUSblxi8aYXXoLm4o5/XQ7LhxWwJjq0yoyMlxFWkzTW3OZZKTE81bRX7LzBrOjFX7dckBLv9TnenFqYYzH2857ZJK5tb9LhNSU8RSlWfSpajtFYrnnvcLC+iVuwAAAA== acc 0 finished 4588
1000060696.434 https://registry.api.cnn.io/assets/fave/svg/live.svg acc 242 finished 1225
1000060696.435 https://registry.api.cnn.io/assets/fave/svg/go-live.svg acc 280 finished 1955
1000060696.436 https://odb.outbrain.com/utils/get?url=https%3A%2F%2Fwww.cnn.com%2F&settings=true&recs=true&widgetJSId=MB_12&key=NANOWDGT01&idx=0&version=01020501&apv=false&sig=FoHQKpsC&format=html&rand=71996&osLang=en-US&winW=412&winH=660&scrW=412&scrH=660&adblck=false&secured=true&va=true&cmpStat=1&ref= acc 449 finished 5907
1000060696.438 https://connect.facebook.net/en_US/sdk.js acc 461 finished 2247
1000060696.441 https://widgets.outbrain.com/images/widgetIcons/ob_logo_16x16@2x.png acc 432 finished 2732
1000060696.442 https://widgets.outbrain.com/images/widgetIcons/achoice.svg acc 452 finished 1820
B59EF7BD0A6BDC4EA960F8CE26B87695 https://widgets.outbrain.com/widgetOBUserSync/obUserSync.html acc 479 finished 0
1000060696.444 https://odb.outbrain.com/utils/get?url=https%3A%2F%2Fwww.cnn.com&settings=true&recs=true&widgetJSId=TR_1&key=NANOWDGT01&idx=1&version=01020501&apv=true&sig=FoHQKpsC&format=html&rand=15433&lsd=9036cf05-9793-4b57-a2ab-bcb94869c9dc&lsdt=1552587256284&osLang=en-US&t=MV9kN2RmMTlmNTM5Y2Y1YzM1ZTkxZjg0YTg4OGRiMGNkZF8w&winW=412&winH=660&scrW=412&scrH=660&adblck=false&secured=true&va=true&cmpStat=1&ref= acc 88 finished 913
955B490CAAFE2EF419B1019C1BD1A5E4 https://staticxx.facebook.com/connect/xd_arbiter/r/m5nTkygCewO.js?version=44 acc 212 finished 0
1000060696.457 https://cdn.ampproject.org/rtv/011903070012530/amp4ads-host-v0.js acc 103 finished 8064
1000060696.461 https://cdn.ampproject.org/rtv/011903070012530/v0/amp-fit-text-0.1.js acc 103 finished 1712
1000060696.466 https://tpc.googlesyndication.com/pagead/images/adchoices/en.png acc 231 finished 2742
1000060696.467 https://tpc.googlesyndication.com/pagead/images/adchoices/icon.png acc 97 finished 401
1000060696.468 https://securepubads.g.doubleclick.net/pagead/adview?ai=Coocv-JmKXNGEHozL_APq46ewC_LTydlV9_3Nyq4IhM-Rp60LEAEgmt3kH2DJ9viGgICgGaABq7m72gPIAQLgAgCoAwHIAwiqBMABT9CMYp2s4hbpil7T4H2qmKkn3P3Wyd_dkC6lE4csh0U_ENCEW5ePbzyPw1opLgsnUN3MVSU9r8KcJecq4Z0ZueLK6H91bGJomISjuuz59LRZZtfev-3r3cVqfffWhChimpbfgtwBrhi20QnhNGu5Sz9ZJyqGhrpmt8Ji5Z-T1o30G85jXDWQAKrYyNqwY3rMqyCapvjAmWLT2lkVgj_qmVeubFPiUpTR7oXLNZPwdzkj20J5_tXUnrSLNDM581-gwATzzrr6-wHgBAGIBb3KgX2SBQQIBBgBkgUECAUYBJIFBAgFGBiSBQUIBRioAaAGAtgGAoAHvcbEJagHjs4bqAfVyRuoB-DTG6gHqAaoB9nLG6gHz8wbqAemvhvYBwHyBwQQur4ToAiNoqcEsAgC0ggHCIBhEAEYAYAKA9gTDIIUDRoLd3d3LmNubi5jb20&sigh=U84XR0Wwemc&tpd=AGWhJmuyEZIX0jXml6L9YxML7ZutBSHxkLUZ-RWOuqIsET75_w acc 48 finished 0
1000060696.471 https://googleads.g.doubleclick.net/pagead/drt/si acc 456 finished 0
1000060696.473 https://analytics.twitter.com/i/adsct?p_id=Twitter&p_user_id=0&txn_id=nyutn&events=%5B%5B%22pageview%22%2Cnull%5D%5D&tw_sale_amount=0&tw_order_quantity=0&tw_iframe_status=0&tpx_cb=twttr.conversion.loadPixels&tw_document_href=https%3A%2F%2Fwww.cnn.com%2F acc 201 finished 267
1000060696.474 https://beacon.krxd.net/optout_check?callback=Krux.ns._default.kxjsonp_optOutCheck acc 253 finished 334
1000060696.475 https://cdn.krxd.net/userdata/get?pub=e9eaedd3-c1da-4334-82f0-d7e3ff883c87&technographics=1&callback=Krux.ns._default.kxjsonp_userdata acc 523 finished 800
1000060696.476 https://tag.bounceexchange.com/340/i.js acc 148 finished 17291
1000060696.478 https://static.chartbeat.com/js/chartbeat_mab.js acc 332 finished 8260
1000060696.479 https://tru.am/scripts/custom/cnn.js acc 382 finished 1037
1000060696.483 https://ping.chartbeat.net/ping?h=cnn.com&p=%2F&u=DuoDgeCn1tiuCw-RHy&d=cnn.com&g=37612&g0=No%20Section&g1=No%20Author&n=1&f=00001&c=0&x=0&m=0&y=19221&o=412&w=660&j=45&R=1&W=0&I=0&E=0&e=0&r=&b=3323&t=B0Tk3ODW-oECDLpUC5BC-N1vCE9ZSy&V=112&i=CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos&tz=420&sn=1&sv=D1ZzvHDkJ63772l2qCVrFEyCbzyWs&sd=1&im=067b2ff3&_ acc 107 finished 168
1000060696.484 https://connect.facebook.net/en_US/fbevents.js acc 652 finished 15877
1000060696.485 https://www.google.com/pagead/1p-user-list/986255830/?value=0&guid=ON&script=0&cdct=2&is_vtc=1&random=669367438 acc 235 finished 295
1000060696.486 https://t.co/i/adsct?txn_id=l4umf&p_id=Twitter acc 92 finished 166
1000060696.487 https://analytics.twitter.com/i/adsct?txn_id=l4umf&p_id=Twitter acc 49 finished 123
1000060696.488 https://www.google.com/pagead/1p-user-list/925133270/?value=1.00&currency_code=USD&label=IEQNCNXH9GcQ1tORuQM&guid=ON&script=0&cdct=2&is_vtc=1&random=4166832294 acc 49 finished 109
1000060696.491 https://d.agkn.com/pixel/9570/?che=1552587257&tid=MkHstMCA acc 546 finished 589
1000060696.492 https://s.amazon-adsystem.com/x/da2e6c890e6e3636 acc 650 finished 0
1000060696.494 https://tru.am/scripts/ta-pagesocial-sdk.js acc 130 finished 12365
1000060696.496 https://cdns.gigya.com/gs/i/shareBar/button/mobile/buttonCenterImgUp.png acc 368 finished 541
1000060696.497 https://cdns2.gigya.com/gs/i/shareBar/button/mobile/buttonCenterImgUp.png acc 368 finished 541
1000060696.502 https://www.facebook.com/tr/?id=731697573629176&ev=PageView&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587257471&sw=412&sh=660&v=2.8.42&r=stable&ec=0&o=30&fbp=fb.1.1552587257469.2139922309&it=1552587257418&coo=false&rqm=GET acc 215 finished 268
1000060696.503 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&x=Q4OpuAzx17rAy&v=C&ml=m&sl=pmoZR&e=-1 acc 107 finished 168
1000060696.504 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&x=auUOFk45ybRN0&v=A&ml=m&sl=CnoAYQ&e=-1 acc 107 finished 168
1000060696.505 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&x=KdV8DmYslKljm&v=D&ml=m&sl=CcZwix&e=-1 acc 107 finished 168
1000060696.506 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&x=uXV2GxR9ugpOb&v=E&ml=m&sl=DhlnQb&e=-1 acc 107 finished 168
1000060696.507 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&me=3&ml=m&x=HhIfjNF37T4yV acc 107 finished 168
1000060696.508 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&me=3&ml=m&x=ks8zCAClJdExh acc 107 finished 168
1000060696.509 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&me=3&ml=m&x=iobJgaozGwpnv acc 107 finished 168
1000060696.510 https://mabping.chartbeat.net/ping/mab?h=cnn.com&p=%2F&d=cnn.com&u=DuoDgeCn1tiuCw-RHy&c=0&me=3&ml=m&x=F8aLiu8VYSCuE acc 107 finished 168
5669E0F12869A6DDB1C4E01757C032DB https://assets.bounceexchange.com/assets/bounce/local_storage_frame10.min.html acc 372 finished 0
1000060696.515 https://www.facebook.com/tr/?id=731697573629176&ev=Microdata&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587257976&cd[Schema.org]=%5B%5D&cd[OpenGraph]=%7B%22og%3Apubdate%22%3A%222014-02-19T19%3A15%3A05Z%22%2C%22og%3Aurl%22%3A%22https%3A%2F%2Fwww.cnn.com%22%2C%22og%3Atitle%22%3A%22CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos%22%2C%22og%3Adescription%22%3A%22View%20the%20latest%20news%20and%20breaking%20news%20today%20for%20U.S.%2C%20world%2C%20weather%2C%20entertainment%2C%20politics%20and%20health%20at%20CNN.com.%22%2C%22og%3Asite_name%22%3A%22CNN%22%2C%22og%3Atype%22%3A%22website%22%7D&cd[Meta]=%7B%22title%22%3A%22CNN%20-%20Breaking%20News%2C%20Latest%20News%20and%20Videos%22%2C%22meta%3Adescription%22%3A%22View%20the%20latest%20news%20and%20breaking%20news%20today%20for%20U.S.%2C%20world%2C%20weather%2C%20entertainment%2C%20politics%20and%20health%20at%20CNN.com.%22%2C%22meta%3Akeywords%22%3A%22cnn%20news%2C%20daily%20news%2C%20breaking%20news%2C%20news%20today%2C%20current%20events%22%7D&cd[DataLayer]=%5B%5D&cd[JSON-LD]=%5B%5D&sw=412&sh=660&v=2.8.42&r=stable&ec=1&o=30&fbp=fb.1.1552587257469.2139922309&it=1552587257418&coo=false&es=automatic&rqm=GET acc 91 finished 144
7C0162F9C6CFFCE81C0AD2A5FDF67CD8 undefined acc 0 finished 798
CE7EA058AA3E0E9D6D28F341B1513E4B undefined acc 0 finished 22364
1000060568.31 https://paulirish.disqus.com/count.js acc 605 finished 1476
1000060568.62 https://www.google-analytics.com/r/collect?v=1&_v=j73&a=1040268829&t=pageview&_s=1&dl=https%3A%2F%2Fwww.paulirish.com%2F&ul=en-us&de=UTF-8&dt=Paul%20Irish&sd=24-bit&sr=412x660&vp=412x660&je=0&_u=IEBAAEAB~&jid=330346528&gjid=645518359&cid=132602523.1552587223&tid=UA-692547-2&_gid=926780806.1552587223&_r=1&z=73055286 acc 146 finished 199
1000060568.64 https://www.google-analytics.com/collect?v=1&_v=j73&a=1040268829&t=timing&_s=2&dl=https%3A%2F%2Fwww.paulirish.com%2F&ul=en-us&de=UTF-8&dt=Paul%20Irish&sd=24-bit&sr=412x660&vp=412x660&je=0&plt=1915&pdt=2&dns=0&rrt=1&srt=162&tcp=352&dit=1102&clt=1102&_gst=1102&_gbt=1714&_u=IEBAAEAB~&jid=&gjid=&cid=132602523.1552587223&tid=UA-692547-2&_gid=926780806.1552587223&z=326791553 acc 78 finished 122
```

Some interesting requests:

```
DEBUG=1 DEBUG_ID="591A246AAC4FA2118C62CC9FF49F84C5" node check.js

===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-0
===============



===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-1
===============



===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-0
===============
{ method: 'Network.requestWillBeSent',
  params: 
   { requestId: '591A246AAC4FA2118C62CC9FF49F84C5',
     loaderId: '591A246AAC4FA2118C62CC9FF49F84C5',
     documentURL: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an',
     request: 
      { url: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an',
        method: 'GET',
        headers: [Object],
        mixedContentType: 'none',
        initialPriority: 'VeryHigh',
        referrerPolicy: 'unsafe-url' },
     timestamp: 18183.364879,
     wallTime: 1552587180.083451,
     initiator: { type: 'script', stack: [Object] },
     type: 'Document',
     frameId: '08ED3863741815D6F831809EA5C7855C',
     hasUserGesture: false } }
{ method: 'Network.requestWillBeSent',
  params: 
   { requestId: '591A246AAC4FA2118C62CC9FF49F84C5',
     loaderId: '591A246AAC4FA2118C62CC9FF49F84C5',
     documentURL: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t',
     request: 
      { url: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t',
        method: 'GET',
        headers: [Object],
        mixedContentType: 'none',
        initialPriority: 'VeryHigh',
        referrerPolicy: 'unsafe-url' },
     timestamp: 18184.074418,
     wallTime: 1552587180.792982,
     initiator: { type: 'script', stack: [Object] },
     redirectResponse: 
      { url: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an',
        status: 302,
        statusText: 'Found',
        headers: [Object],
        headersText: 'HTTP/1.1 302 Found\r\nServer: Server\r\nDate: Thu, 14 Mar 2019 18:13:00 GMT\r\nContent-Length: 0\r\nConnection: keep-alive\r\nCache-Control: max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0\r\nPragma: no-cache\r\nExpires: Thu, 01 Jan 1970 00:00:00 GMT\r\np3p: policyref="https://www.amazon.com/w3c/p3p.xml", CP="PSAo PSDo OUR SAM OTR DSP COR"\r\nLocation: https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t\r\nSet-Cookie: ad-id=AzDX4uhpeUMApbhdFnJS8n4|t; Domain=.amazon-adsystem.com; Expires=Tue, 01-Oct-2019 18:13:00 GMT; Path=/; HttpOnly\r\nVary: User-Agent\r\n\r\n',
        mimeType: '',
        requestHeaders: [Object],
        requestHeadersText: 'GET /iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an HTTP/1.1\r\nHost: s.amazon-adsystem.com\r\nConnection: keep-alive\r\nUpgrade-Insecure-Requests: 1\r\nUser-Agent: Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3694.0 Mobile Safari/537.36 Chrome-Lighthouse\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3\r\nReferer: https://www.cnn.com/\r\nAccept-Encoding: gzip, deflate, br\r\nAccept-Language: en-US,en;q=0.9\r\n',
        connectionReused: false,
        connectionId: 1270,
        remoteIPAddress: '54.239.17.112',
        remotePort: 443,
        fromDiskCache: false,
        fromServiceWorker: false,
        encodedDataLength: 590,
        timing: [Object],
        protocol: 'http/1.1',
        securityState: 'secure',
        securityDetails: [Object] },
     type: 'Document',
     frameId: '08ED3863741815D6F831809EA5C7855C',
     hasUserGesture: false } }
{ method: 'Network.responseReceived',
  params: 
   { requestId: '591A246AAC4FA2118C62CC9FF49F84C5',
     loaderId: '591A246AAC4FA2118C62CC9FF49F84C5',
     timestamp: 18184.202199,
     type: 'Document',
     response: 
      { url: 'https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t',
        status: 200,
        statusText: 'OK',
        headers: [Object],
        headersText: 'HTTP/1.1 200 OK\r\nServer: Server\r\nDate: Thu, 14 Mar 2019 18:13:00 GMT\r\nContent-Type: text/html;charset=ISO-8859-1\r\nContent-Length: 184\r\nConnection: keep-alive\r\nCache-Control: max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0\r\nPragma: no-cache\r\nExpires: Thu, 01 Jan 1970 00:00:00 GMT\r\np3p: policyref="https://www.amazon.com/w3c/p3p.xml", CP="PSAo PSDo OUR SAM OTR DSP COR"\r\nSet-Cookie: ad-id=AzDX4uhpeUMApbhdFnJS8n4; Domain=.amazon-adsystem.com; Expires=Tue, 01-Oct-2019 18:13:00 GMT; Path=/; HttpOnly\r\nSet-Cookie: ad-privacy=0; Domain=.amazon-adsystem.com; Expires=Tue, 01-Oct-2019 18:13:00 GMT; Path=/; HttpOnly\r\nVary: Accept-Encoding,User-Agent\r\nContent-Encoding: gzip\r\n\r\n',
        mimeType: 'text/html',
        requestHeaders: [Object],
        requestHeadersText: 'GET /iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t HTTP/1.1\r\nHost: s.amazon-adsystem.com\r\nConnection: keep-alive\r\nUpgrade-Insecure-Requests: 1\r\nUser-Agent: Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3694.0 Mobile Safari/537.36 Chrome-Lighthouse\r\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3\r\nReferer: https://www.cnn.com/\r\nAccept-Encoding: gzip, deflate, br\r\nAccept-Language: en-US,en;q=0.9\r\nCookie: ad-id=AzDX4uhpeUMApbhdFnJS8n4|t\r\n',
        connectionReused: true,
        connectionId: 1270,
        remoteIPAddress: '54.239.17.112',
        remotePort: 443,
        fromDiskCache: false,
        fromServiceWorker: false,
        encodedDataLength: 691,
        timing: [Object],
        protocol: 'http/1.1',
        securityState: 'secure',
        securityDetails: [Object] },
     frameId: '08ED3863741815D6F831809EA5C7855C' } }
591A246AAC4FA2118C62CC9FF49F84C5 https://s.amazon-adsystem.com/iu3?cm3ppd=1&d=dtb-pub&csif=t&dl=ym_ox_pm_an&dcc=t acc 691 finished 0



===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-1
===============

```

```
DEBUG=1 DEBUG_ID="1000060568.31" node check.js

===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-0
===============


===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-1
===============


===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-0
===============


===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-1
===============


{ method: 'Network.requestWillBeSent',
  params: 
   { requestId: '1000060568.31',
     loaderId: 'CE7EA058AA3E0E9D6D28F341B1513E4B',
     documentURL: 'https://www.paulirish.com/',
     request: 
      { url: 'https://paulirish.disqus.com/count.js',
        method: 'GET',
        headers: [Object],
        mixedContentType: 'none',
        initialPriority: 'Low',
        referrerPolicy: 'no-referrer-when-downgrade' },
     timestamp: 18226.157678,
     wallTime: 1552587222.87579,
     initiator: { type: 'script', stack: [Object] },
     type: 'Script',
     frameId: '968950953B7E32DD8084D430283E68F6',
     hasUserGesture: false } }
{ method: 'Network.responseReceived',
  params: 
   { requestId: '1000060568.31',
     loaderId: 'CE7EA058AA3E0E9D6D28F341B1513E4B',
     timestamp: 18226.510442,
     type: 'Script',
     response: 
      { url: 'https://paulirish.disqus.com/count.js',
        status: 200,
        statusText: 'OK',
        headers: [Object],
        mimeType: 'application/javascript',
        connectionReused: false,
        connectionId: 168,
        remoteIPAddress: '151.101.196.134',
        remotePort: 443,
        fromDiskCache: false,
        fromServiceWorker: false,
        encodedDataLength: 605,
        timing: [Object],
        protocol: 'http/1.1',
        securityState: 'secure',
        securityDetails: [Object] },
     frameId: '968950953B7E32DD8084D430283E68F6' } }
{ method: 'Network.dataReceived',
  params: 
   { requestId: '1000060568.31',
     timestamp: 18226.510547,
     dataLength: 1517,
     encodedDataLength: 0 } }
{ method: 'Network.loadingFinished',
  params: 
   { requestId: '1000060568.31',
     timestamp: 18226.510212,
     encodedDataLength: 1476,
     shouldReportCorbBlocking: false } }
1000060568.31 https://paulirish.disqus.com/count.js acc 605 finished 1476
```


```
DEBUG=1 DEBUG_ID="1000060792.7"  node check.js

===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-0
===============


===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-1
===============


===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-0
===============


===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-1
===============
{ method: 'Network.requestWillBeSent',
  params: 
   { requestId: '1000060792.7',
     loaderId: '927B1A2B4CC97740FB58480835BF5265',
     documentURL: 'https://github.com/',
     request: 
      { url: 'https://github.githubassets.com/images/modules/site/logos/sap-logo.png',
        method: 'GET',
        headers: [Object],
        mixedContentType: 'none',
        initialPriority: 'Low',
        referrerPolicy: 'strict-origin-when-cross-origin' },
     timestamp: 18279.444226,
     wallTime: 1552587276.16176,
     initiator: { type: 'parser', url: 'https://github.com/', lineNumber: 402 },
     type: 'Image',
     frameId: 'BCB6A0F7181BC6502F2075B38BE225AA',
     hasUserGesture: false } }
{ method: 'Network.responseReceived',
  params: 
   { requestId: '1000060792.7',
     loaderId: '927B1A2B4CC97740FB58480835BF5265',
     timestamp: 18279.549959,
     type: 'Image',
     response: 
      { url: 'https://github.githubassets.com/images/modules/site/logos/sap-logo.png',
        status: 200,
        statusText: '',
        headers: [Object],
        mimeType: 'image/png',
        connectionReused: true,
        connectionId: 124,
        remoteIPAddress: '185.199.109.154',
        remotePort: 443,
        fromDiskCache: false,
        fromServiceWorker: false,
        encodedDataLength: 152,
        timing: [Object],
        protocol: 'h2',
        securityState: 'secure',
        securityDetails: [Object] },
     frameId: 'BCB6A0F7181BC6502F2075B38BE225AA' } }
{ method: 'Network.dataReceived',
  params: 
   { requestId: '1000060792.7',
     timestamp: 18279.550037,
     dataLength: 8650,
     encodedDataLength: 0 } }
{ method: 'Network.loadingFinished',
  params: 
   { requestId: '1000060792.7',
     timestamp: 18279.548799,
     encodedDataLength: 8811,
     shouldReportCorbBlocking: false } }
1000060792.7 https://github.githubassets.com/images/modules/site/logos/sap-logo.png acc 152 finished 8811

```


```
DEBUG_ID="1000060696.502 1000060397.520 1000060986.509 1000061376.499" node check.js

===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-0
===============



===============
_Applications_Google_Chrome.app_Contents_MacOS_Google_Chrome-ns-1
===============


1000061376.499 https://www.facebook.com/tr/?id=731697573629176&ev=PageView&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587397114&sw=412&sh=660&v=2.8.42&r=stable&ec=0&o=30&fbp=fb.1.1552587397112.1602341290&it=1552587397045&coo=false&rqm=GET acc 217 finished 270
===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-0
===============


===============
_Applications_Google_Chrome_Canary.app_Contents_MacOS_Google_Chrome_Canary-ns-1
===============
1000060696.502 https://www.facebook.com/tr/?id=731697573629176&ev=PageView&dl=https%3A%2F%2Fwww.cnn.com%2F&rl=&if=false&ts=1552587257471&sw=412&sh=660&v=2.8.42&r=stable&ec=0&o=30&fbp=fb.1.1552587257469.2139922309&it=1552587257418&coo=false&rqm=GET acc 215 finished 268
```
