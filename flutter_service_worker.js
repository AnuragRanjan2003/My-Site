'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "6b8e8eafb12be4f5207d12580295cc5a",
".git/config": "115d9a8888645abbad6b1489a90d1733",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "34bbf06f32c7506eacfd968f20000e14",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "8188dd646fe40b36901cd8ef11593344",
".git/logs/refs/heads/master": "8188dd646fe40b36901cd8ef11593344",
".git/logs/refs/remotes/origin/master": "462b15da5df233ea7a9ad419cfc6488f",
".git/objects/00/559eeb290fb8036f10633ff0640447d827b27c": "7fbd4486d5ea862eb2c1d2a07b06b395",
".git/objects/03/c531a7a4eadfbb97e5434401927ee31890cf33": "fe6b24f60048b7f218835d95c2c650ae",
".git/objects/0b/85bcdb86bf9e9f9fda81b13cec9c9349d47d77": "77cbf4b6cc88e2471afd14a98ef2e0ed",
".git/objects/15/676adb4686c566b3b9ac2b6730f0d74bae5dae": "6d8f10a31870c139b60dc480054bf270",
".git/objects/1a/fb713af4e5ad5f86a5f43cbd8e94e2db62fda5": "0f46de29a1efdcdde2c6df7ce38307ef",
".git/objects/1a/fe9d7f84cd0c8e9c81470b119eb44fb74b167d": "f19e8eb59247cf78c9343cd4eda0a3d4",
".git/objects/1d/384f3748038966a5c7316223edf120dd5894dd": "a8d542276aa823dfefb8d26439e1077a",
".git/objects/1e/bf993c04c08e17a0122730f8d7ce6e139c8bad": "eeb4f0d71f24758335fe1753273ad6c2",
".git/objects/1f/56867e70c434d8dff86a85ca09e6d942a38257": "27d844aa56b9fd88c276a37ccf62cee6",
".git/objects/1f/686edd1465272558af328ca43cb7189a0059e6": "5e83820f6d3e5392693d45bc239b2b61",
".git/objects/25/45f34a79d75b3939bae4123d9d7547ffb45c39": "3770fddd17aaa8992043a3a8dcf0d8eb",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/37/52783cf094b50e73db42eb73229b197d8b4df8": "6a45ae36a11e25001a5ac2dc01a63381",
".git/objects/37/7580cbf691d03aea79c63a3a251b1b48ac01f1": "c196d282a50e3c372b4445c6b8868297",
".git/objects/3c/0e2a3ae40a85baf8b3dd8215b3a8b7363cc4dd": "3b1f40f97033bec5d871e63e7eb7a889",
".git/objects/3e/ac245fee4d1adbe97ae3da9706d9547b97b307": "737570cbd4d22bd7fce326e4020344c3",
".git/objects/42/0aacda1d1b71f05dd5df2170f73ba200191901": "9e1c68c3d8d5ef7b1096aae1716dbc4a",
".git/objects/42/d8933b3adc71b146518efb8957e5de83965543": "ce1b2ae9ed2fc2475c0e4ef289126ad4",
".git/objects/47/eb0f2dbfb9e57235c4c593bbff7329348f63fd": "2d6e92c0975feb6dc63c6d92e04865d0",
".git/objects/49/603fdb70eed76fad53fb23ea3c776939b4d768": "f54848cdbd3290a49469ff87264d6cdb",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/51/34e6402246228fb7f58ce8fe76727a61d99a62": "6b5e5b48febe40daec7062aecdc3b39f",
".git/objects/5c/fdb2429b82a7e0213274a83ff510d4e610aee3": "92f87f02144552a03b5830eb0ba319a6",
".git/objects/62/a01d6826913d9efa140d2e9f4bc0f13918e607": "44ba2af6a4f05cb190463143170ae010",
".git/objects/66/fd1eec0c2d5cdde263f49da17e97f0b04e5cc0": "4f591e35aa5915196788c3afe4f3a8bf",
".git/objects/6a/64dc77c78e7a6808aa68180b4fdee52f0d5a35": "bdddeed19125153bac55a86253b70e18",
".git/objects/6a/fb15b2038d3772092303e5a7ec51c632b5c5d2": "816f3926b6819394173b727f7fd7bedb",
".git/objects/6b/cdcc27f22e001e46defdfd9e23f224ff65dd67": "624b5324c1f5198f7f6ede95410d5b7b",
".git/objects/6c/380f467a1ca94b64d753c9fb660c969640e045": "2cebf43cc47176029fff47b5fd505e88",
".git/objects/6e/4a1bc5cf02e2d962ec52a0e2e10eb27ceb5f47": "28078bdf0d10f5d558ec1dc4bf2ed440",
".git/objects/70/010cc4761157d9d7cc2d082cf342e63fe1190a": "baf21d1dacab382149ee93266543ff40",
".git/objects/74/41651e94b58f3fe832e80ec8cce97e96cb0a66": "8abd275625ffc369d041f71ba81d75c4",
".git/objects/77/065d2907e5f1a427a33e0ef1ce673ed272f45a": "32808fa91e8b8a99b6ea9dbfdd3cee14",
".git/objects/7b/0cc4438140a474be833f5bf28f12ba7540efc3": "684ba7073c7d745115745556ef5b017a",
".git/objects/86/bb971747f241c1ddcd4e1e99efb09988736db1": "173f1c85e49a6e92cf391fc25f68feba",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/48bc845c0494eb6ab040b592a336895e846461": "b8ac4dc925978f5c9beb11a6e867cf5c",
".git/objects/8e/7f4b338840099949781ab85496d7a67fae46f1": "7f2803c236e9e7d95ef6ed16a3a2bd13",
".git/objects/97/0902fe03ce821b30961b48f29c332b9959541a": "ce01020b19821afa694d9d629ee158a0",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/a0/2ca279f4c68d9e498992fbb16265904d5349a6": "d89142a080aa67788f4fb48a3395d284",
".git/objects/a1/33e63ebea053e295cd786a936da890af64ac1d": "3406f1d4ffe4c0fb458aec8349b3d337",
".git/objects/a2/dee9d8625b732c2aea96031efe569a2e52203d": "338456b44af1de1ad778c0495200b5dc",
".git/objects/a7/93759fd39aa3aa386252a4f8dd6b523cc1718c": "116558dc232ddae7db01b8bd18da9431",
".git/objects/aa/5e0811e3f731daab858d769acf1cba9f5572ce": "ecf95fad9ccb6b6edf899b6ff90351a7",
".git/objects/ab/57dac50ca8dfc74428ad362772c8a63b57f6e3": "56d85a07a2d704500e0c794f7dd92e6a",
".git/objects/ae/37803d1933c3979fd1b939ff61cc667b0b70dc": "f5c08c98e82ebd9034dbd78b64a292fa",
".git/objects/b1/5b843742e02119b6313a971d0652e5eb32dd75": "f019450fb28d6f11f54a0319a0b994a2",
".git/objects/b2/2fdb2d1fa6a3bced274617d58f6ab432bb0d8b": "1b405e4dfab487f51d41422d52600614",
".git/objects/b2/67b6175800903cf6ba16432067af8875906f0f": "febf30c8537b58049db6ede06d011fc4",
".git/objects/b2/97fd4b89d6b53b40c71dc37f0e15fa38e3ec0a": "0948310d310e84a4f297c2455da05bbb",
".git/objects/b3/4dca3c02244c90bf3fd0a322b8fae93284e229": "16abfa9d5c42197afcca62014d3844fe",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/bc/36bcc2427a84e29e61ea7b634024072c04b206": "08cd2a4fd07be093532cedca2675ee60",
".git/objects/c0/2540aa574044198255333c4e4c36be37d44a76": "0b0e9e3c7a4e86c514b60e522bc03dc3",
".git/objects/c4/00aa3e98adb951faec5cb3368ff2e2710fcd3f": "53170d96ce6ff21d6904a0ebc629d26e",
".git/objects/c4/f250aa977dfbbca4e118f57b8beed19179c04b": "9d00b40ad34635561ceed13a29d75c5c",
".git/objects/c9/08fbd2ff9f0b1c74d0574114580dc4bea47c83": "84167002ab0c95a5dac16059b1ba8b92",
".git/objects/cc/290da8369a29b8ae0045968a272ccbb3859fd5": "0092406dba846ad2efe314e9a2263e59",
".git/objects/cc/4422ddfa80c1cdcfc922f0682c864c6d87164c": "a4b7f312d30808f083e87d77f4e466b4",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/eb922905f7f7b32a75b458e850dd36d6d800a2": "5e2926627d9844aca791e090eb6fb26a",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fb/276f57f794690fef599f969fa9388f7dcf79e0": "6cff604f42e27bbea3356ca5f08e4a56",
".git/objects/fc/0f322e61617230621468a8090f25edb73110d5": "ecc6495fc2bada51dd28771bea5b58eb",
".git/objects/fc/ec0a21f95452f9333464d52a4f71ce6fae4d95": "a322de9530c0fc88a74c91cea89bad3e",
".git/objects/fd/3740395fdb43b6a09872f7b3c145b8ebc731a1": "dec974b50dd69bff7d759b7bddd582d4",
".git/objects/fe/2d44cabe12346c83e9d3ea5474e68dd6f9cff8": "aaba40e69fd06e6e0670f5a82d281160",
".git/refs/heads/master": "33d16ed6d6ab7034693bea7162e386c8",
".git/refs/remotes/origin/master": "33d16ed6d6ab7034693bea7162e386c8",
"assets/AssetManifest.bin": "f374401d9498e1af1f60611c095570f2",
"assets/AssetManifest.json": "2dc1f386fe67287181999d03f9252cc5",
"assets/FontManifest.json": "1c58bd82acd88683da593af57aeb3634",
"assets/fonts/MaterialIcons-Regular.otf": "ce0d1e0d7b53ac6cde0e6807758c988b",
"assets/lib/assets/fonts/Poppins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/lib/assets/fonts/Poppins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/lib/assets/fonts/Poppins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/lib/assets/fonts/Poppins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/lib/assets/images/admin.png": "512894c7bab1c99fe331180e29593c64",
"assets/lib/assets/images/android_icon.png": "ea7b91947860186540ecdc745d7266f7",
"assets/lib/assets/images/android_image.png": "29f15bec3b7552f3508e18e25ee4e39b",
"assets/lib/assets/images/blog.png": "95cf30a9c772e9acda1f9f70efa94a57",
"assets/lib/assets/images/body_background.png": "ad874fc1a6e118b50c326f1c126bbaa1",
"assets/lib/assets/images/dart.png": "cdc189d734b00c7dc950bda7bf0d0b63",
"assets/lib/assets/images/done.png": "c87ba8c858cdcf41583800e00f1a62bc",
"assets/lib/assets/images/firebase_logo.png": "45ec5c8523c42019e2aa9fe5436750af",
"assets/lib/assets/images/firebase_logo_disabled.png": "4ede6400b999437848b67bb12f72f4de",
"assets/lib/assets/images/flutter_color_logo.png": "70135fb5474e65fa678024389564b59e",
"assets/lib/assets/images/flutter_disabled.png": "f0d9afde6c1fe3106f34432fa2154fad",
"assets/lib/assets/images/home.png": "20ceead0f958882567ec41d62f70fa4b",
"assets/lib/assets/images/login.png": "d264fdaca996ee87c16925b60417bd3b",
"assets/lib/assets/images/programming.png": "d94e6395b0bae44f556e9db6df373210",
"assets/lib/assets/images/sign_up.png": "1ba47d439001e5d2462fd12069905f4b",
"assets/lib/assets/images/write.png": "bd6cd5809a9f650e10ec76f8adca599b",
"assets/NOTICES": "c177cd2c636ac8c8ff3c9207c2043182",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cb33eb7e913414e0cc72467851a0e2db",
"/": "cb33eb7e913414e0cc72467851a0e2db",
"main.dart.js": "5bf55ddabba141d321b75fbc5e6f3e20",
"manifest.json": "48f3627917214352803099d3b37f5f72",
"version.json": "50b682faf8094170be98ae8569e03ca2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
