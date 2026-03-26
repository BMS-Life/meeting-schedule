'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "2bd8138ca86cf350a1622d183bc22e8b",
"version.json": "971c820531b98ef16602272691f56764",
"index.html": "a7f9872412d656ad43e5dddc608c0bda",
"/": "a7f9872412d656ad43e5dddc608c0bda",
"main.dart.js": "f5c6d12efcd835d6099d038bb4fddb00",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/app_launcher_icon.png": "a158f59d4462f881cf4574fb11bd2e9d",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"image_22-removebg-preview.png": "a158f59d4462f881cf4574fb11bd2e9d",
"assets/AssetManifest.json": "6d333500f1d0d9a121f2b293c81ebb3d",
"assets/NOTICES": "42823ca28b96095e531a14fc6ad3c2eb",
"assets/FontManifest.json": "67a28da3784fc091c2f816d615fbf08a",
"assets/AssetManifest.bin.json": "297a3d0cd2864cca9542b548cf67a157",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b07f8d17d7ae2acadea808971e1047ba",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/u_i_library_3c2hbt/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/jsons/logout.json": "a9495c30e04c221f47139f630f969bb4",
"assets/packages/u_i_library_3c2hbt/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/images/hospital.png": "85cbf4a63919823cebb4767cb520fda5",
"assets/packages/u_i_library_3c2hbt/assets/images/leaf-svgrepo-com_1.png": "1fd2b92ba9995e00564d46d298a60916",
"assets/packages/u_i_library_3c2hbt/assets/images/avatar-model.png": "305350be5f45c74dfc355bba8b1d7b11",
"assets/packages/u_i_library_3c2hbt/assets/images/139921.jpg": "f408af82f9128aaa03a785ab4f309525",
"assets/packages/u_i_library_3c2hbt/assets/images/designkit_cover.png": "1ec905112a6613f8c0a3e8235e1121a9",
"assets/packages/u_i_library_3c2hbt/assets/images/125880.jpg": "9f0c7a1dde1f9ad5add2ce532bcbe535",
"assets/packages/u_i_library_3c2hbt/assets/images/49661308_9290536.jpg": "4c52ade1499847676b309e07a4f7bfc8",
"assets/packages/u_i_library_3c2hbt/assets/images/data-widgets.png": "9a4c8ab98a7155454ca124c3067f8d97",
"assets/packages/u_i_library_3c2hbt/assets/images/provider-id-logo.png": "4188f79b4ace2b65bdb1515a02d296c0",
"assets/packages/u_i_library_3c2hbt/assets/images/Public.png": "c065df55f083b2426d575aa25ed42d42",
"assets/packages/u_i_library_3c2hbt/assets/images/app_launcher_icon.png": "1ec905112a6613f8c0a3e8235e1121a9",
"assets/packages/u_i_library_3c2hbt/assets/images/medicine-shopping.png": "009da6a59a996ccd0299b940c6079cf4",
"assets/packages/u_i_library_3c2hbt/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/images/Private.png": "a2a8391a5a6c4c93b0f80fd17b0d2b97",
"assets/packages/u_i_library_3c2hbt/assets/images/star-svgrepo-com_2.png": "60e613d5fe398f02909aaf6ac4f15e8d",
"assets/packages/u_i_library_3c2hbt/assets/images/image-placeholder.png": "2153587a853ba48f86c530ba1b7de227",
"assets/packages/u_i_library_3c2hbt/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/packages/u_i_library_3c2hbt/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4bc1fd91623a5f1700f526c82408243d",
"assets/fonts/MaterialIcons-Regular.otf": "dc88bb2c2b3f6f035d3b27494661716e",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/participate-done.png": "453713eadde8fd6f82a767b2bb1cda41",
"assets/assets/images/mascot_booking.png": "78081b162fa42f45fc3a6c5ab26627b4",
"assets/assets/images/duo-icons_clipboard.png": "1295d6167ff337468514e98bb481b880",
"assets/assets/images/lets-icons_book-open-duotone12.png": "286b56602f1697799821c2424da13c5d",
"assets/assets/images/calendar-event-icon.png": "eb2e458804306c5c8aded2e7a98212ac",
"assets/assets/images/calendar-icon.png": "97cf8274a27b42aff7f119e53071d35b",
"assets/assets/images/allowance-decorate.png": "9ce7c0f245d81a020f1b4bab29bcaeb9",
"assets/assets/images/chat-bubble-icon.png": "6f6b1f76d6333f9eb306372a9e810b2e",
"assets/assets/images/face-scan-white-icon.png": "b7d33dbc08c9b8449cbb7ee6ef973beb",
"assets/assets/images/199.jpg": "94eed22f621517fc111e23af7b420e7d",
"assets/assets/images/uim_image-v.png": "67999bac283af917b073c19b7d9f5038",
"assets/assets/images/professor.png": "d20011b10262e2fa660ded63cab1a8eb",
"assets/assets/images/event-details-icon.png": "ab6e00d5feea496db75d8430f860d835",
"assets/assets/images/confirm-icon.png": "ed7151b8dfe2fbf0973d3c96f74d5fe6",
"assets/assets/images/lets-icons_book-open-duotone.png": "d7ebb6056689210f11f71c205e40cabc",
"assets/assets/images/member.png": "516d7d2b3ee7a55fc29e16823b4660be",
"assets/assets/images/headerkm.png": "ffb9d8f85b3a2891b1ead207f31555a9",
"assets/assets/images/meeting-banner.png": "c2ecfc98d9c70f4ef445da726dfb7389",
"assets/assets/images/no-allowance-decorate.png": "746a0d56076e442a0a82cc0a34ba6754",
"assets/assets/images/create-event-done.png": "c87f9eaa98f064ff033039186e4229f8",
"assets/assets/images/add-calendar-filled.png": "9398b39f4d71a004d5e3cfee84efc59e",
"assets/assets/images/duo-icons_clipboardgreen.png": "f672360c9b276c4802c1cec5ac7fe863",
"assets/assets/images/app_launcher_icon.png": "a158f59d4462f881cf4574fb11bd2e9d",
"assets/assets/images/face-scan-done-icon.png": "035404267f944a7c0fc3aa96afb9fed4",
"assets/assets/images/allowance-icon.png": "e283ce69f4ddb599ca0dd7618f955b57",
"assets/assets/images/reviewing.png": "08790dcbf09e5c91caaa66c739443cba",
"assets/assets/images/avatar.png": "6ffd831014d18e9056b6e3517f4d2348",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/allowance-banner.png": "eb1a97af05fee31fa0a4eaff9bae1e0f",
"assets/assets/images/level.png": "75cd78b27791919d840fe06bd4d3e919",
"assets/assets/images/allowance-not-ready.png": "570647b1bb86fe66196b46baafaaffb4",
"assets/assets/images/attachment-successful.png": "c3686dc88bf4f9cfe7a4b49213d19436",
"assets/assets/images/allowance-base-modal.png": "0411bed3fde24d0213fb13d5f025fefd",
"assets/assets/images/no-allowance-base-model.png": "a127beea70d0db806095023d260c6bf2",
"assets/assets/images/duo-icons_user.png": "e0fb9cab74c94f5f22936f903f4dbbc7",
"assets/assets/images/--1.png": "973a9acd90d2e105c4ef5852cae15ca0",
"assets/assets/images/cash-icon.png": "e6996ab482ba94f5d2c085af2c527aa1",
"assets/assets/images/face-scan-pending-icon.png": "38ace056d439352cfa27380325843700",
"assets/assets/images/edit-meeting-icon.png": "dc62e2e8d6490d68973d0dced073af31",
"assets/assets/images/sitting-desk.png": "a35dd9dc6c7a53f01b6438de766326ff",
"assets/assets/images/image_22-removebg-preview.png": "a158f59d4462f881cf4574fb11bd2e9d",
"assets/assets/images/chat-icon.png": "0c63974b7eddcf8ce330cf670c635a8f",
"assets/assets/images/145.jpg": "d6bd522e83469b580aa747218a852e24",
"assets/assets/images/backgroundheader.png": "6d5589a216a2db7dd07986fd08766031",
"assets/assets/images/duo-icons_clipboardred.png": "519091c6688c5d27f9bc04db7a98c65b",
"assets/assets/images/create-event-icon.png": "3b5e15043f1f54617f524a4ab8469149",
"assets/assets/images/letter-icon.png": "61685c79aad561254bbf043136db422c",
"assets/assets/images/solar_users-group-two-rounded-bold-duotone.png": "d2bac444324bf9745fc343f5f1a4ca3a",
"assets/assets/images/open-event-icon.png": "16de3e5d97b56fcee511ec403def69ed",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
