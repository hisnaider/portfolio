'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"my_logo.png": "fd8918153bf5f6d17256b29783755493",
"flutter_bootstrap.js": "6ed7080a9403a9841e7d45f1c4e9488a",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "4aec20d3c39e23c5febde3ab25c3b51f",
"assets/AssetManifest.bin": "ae9190d668e5d68df9b64a93f0556896",
"assets/assets/fonts/montserrat/Montserrat-Bold.ttf": "354dc625a35bef1b6ec00a79c6cfc0c8",
"assets/assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "1497e6fee4dd060b35f6b49e4241cb3f",
"assets/assets/fonts/montserrat/Montserrat-Light.ttf": "e1d9d4d7fc9ff0f24b901292a900ef66",
"assets/assets/fonts/montserrat/Montserrat-Medium.ttf": "ee130b491bf120cdb261d27ec29e2805",
"assets/assets/fonts/montserrat/Montserrat-Thin.ttf": "a6cfec0cb3e946398cffcd4fa7ac61d1",
"assets/assets/fonts/montserrat/Montserrat-Black.ttf": "b9ca03e9742434a8a843b6402995f1c8",
"assets/assets/fonts/montserrat/Montserrat-ExtraLight.ttf": "432be4a65a340e38f31651576ec58487",
"assets/assets/fonts/montserrat/Montserrat-Regular.ttf": "38712903602f88435ddddec98862f8b8",
"assets/assets/fonts/montserrat/Montserrat-SemiBold.ttf": "6e7bd3eacb1d1088e5063e375fc467aa",
"assets/assets/fonts/poppins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/poppins/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/poppins/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/fonts/poppins/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/poppins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/poppins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/poppins/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/assets/fonts/poppins/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/assets/images/my_logo.png": "fd8918153bf5f6d17256b29783755493",
"assets/assets/images/photo.jpg": "c900e8a030284a7d0b60aebcd166b48b",
"assets/assets/images/universe.webp": "0a1344092ebaad267b1be2245fb40172",
"assets/assets/images/svg/dart_icon.svg": "e1de918afe6823febb66404edad7a8cc",
"assets/assets/images/svg/logo.svg": "d8cb7f61c2250620bb67fe4910eb7e73",
"assets/assets/images/svg/star_system_icons/orbit_off.svg": "cdb0b25e2389751523adb75d8fa0297b",
"assets/assets/images/svg/star_system_icons/name_on.svg": "f6559a33e843a30d5f41a5e3e48eb956",
"assets/assets/images/svg/star_system_icons/select_on.svg": "935a6a922f02a567886d18f180abb865",
"assets/assets/images/svg/star_system_icons/orbit_on.svg": "899ad4074c3269854a3c7db258ff76e2",
"assets/assets/images/svg/star_system_icons/name_off.svg": "fc39fff5c632f4f656b378f71f9d8ae8",
"assets/assets/images/svg/star_system_icons/select_off.svg": "df7ad94925f83838e45314d7471813a2",
"assets/assets/images/svg/figma_icon.svg": "a2173e255b87c590e452f61178363fc7",
"assets/assets/images/svg/contact_icons/email.svg": "bbf86caf937932ce4e67e48f0413e02a",
"assets/assets/images/svg/contact_icons/github.svg": "55b008b093cf673ed68e2bccc7112e82",
"assets/assets/images/svg/contact_icons/phone.svg": "fe3d757f65d0c6267106dbda116b3fea",
"assets/assets/images/svg/contact_icons/linkedin.svg": "ba00a0d0ed3e2f4d93e1275d332139d5",
"assets/assets/images/svg/touch_icons/move_camera_touch.svg": "8d6f4ab0b05ba3be636c5da1a50abfe6",
"assets/assets/images/svg/touch_icons/zoom_camera_touch.svg": "f695628ccbca0958fc494f5c5b493639",
"assets/assets/images/svg/touch_icons/select_body_touch.svg": "bcd0c5e9ed74f0eed400f8e11e509541",
"assets/assets/images/svg/mouse_icons/zoom_camera_mouse.svg": "3e58bee075c95750efd90dc956f3cbb9",
"assets/assets/images/svg/mouse_icons/select_body_mouse.svg": "d99f7537b6d578a96b35810dae6f9b81",
"assets/assets/images/svg/mouse_icons/move_camera_mouse.svg": "e68732a532cea7a02620e7a441752ae2",
"assets/assets/images/svg/clean_architecture_icon.svg": "76d2f802eb2836f0e53fc19d89c06467",
"assets/assets/images/svg/formy.svg": "91cfe44e9dbde3d4222e1a4d1d310b7c",
"assets/assets/images/svg/flutter_icon.svg": "3fff126f7ef397a7da63bc26fe140d53",
"assets/assets/images/first_record.webp": "9036775b5c75390e72aa51721603fa07",
"assets/FontManifest.json": "e61059599ffe07e10858575804c62ee9",
"assets/AssetManifest.bin.json": "d76f220d685c10204399a626cf583c1a",
"assets/NOTICES": "17120aa443eb47c1132bdfe530be0b02",
"index.html": "4cb3a0fdac9dce9cbdc69714c14385a6",
"/": "4cb3a0fdac9dce9cbdc69714c14385a6",
"main.dart.js": "8be9c95d726371356f491b466aab13c7",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"favicon.png": "9caa357a972bfd9ed7d83aa8ef126bfa"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
