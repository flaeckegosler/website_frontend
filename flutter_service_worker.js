'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/assets/genesis.jpg": "e9fa7f75fd397588076025a053c40a59",
"assets/assets/bild_kandidaten_2022.jpg": "6edafbf3447bb4d5923ff6d999e92f3f",
"assets/assets/youtube_vampir_2019.jpg": "ca0a24c2f5d8a5313869fd4eb8473206",
"assets/assets/fonts/Oswald-Bold.ttf": "ad9c6c18ebcfb969eb7f9a868e1c389f",
"assets/assets/fonts/FONTH.ttf": "5e928403ed357cb34d0d350214c931b3",
"assets/assets/goenner.jpg": "880521191a45f5703fbc065e5ca3ecf3",
"assets/assets/redakteure/lukasStuder.png": "c4421c53bb504d5a80205b00a710f9df",
"assets/assets/redakteure/janick.png": "22e95484c2175b07e07a7218e6d16009",
"assets/assets/redakteure/michelek.png": "24cdfd85cec19028e14feba92edec286",
"assets/assets/redakteure/stefan.png": "62eed0d396f99f05cdbec5cef14e389b",
"assets/assets/redakteure/noah.png": "415aef0209407aa45c4d521dabb8496e",
"assets/assets/redakteure/jose.png": "44116a4ae23e83bca540a3b132d8cc78",
"assets/assets/redakteure/reto.png": "33d6b243c0b6e3ac0c90311faa4ffa56",
"assets/assets/redakteure/phil.png": "02d5aa0f599b515968cedc4536687db1",
"assets/assets/redakteure/carmen.png": "8e68bb16260c83d98b1570e0c242b392",
"assets/assets/redakteure/darios.png": "e8350d32d94d4ee63b71df702079915c",
"assets/assets/redakteure/manuelm.png": "1cc6d1067c8d8176e72b65b75012277c",
"assets/assets/redakteure/olivers.png": "da42c5e0011d367fd20d41d17ccf90e2",
"assets/assets/redakteure/martin.png": "659ddbf3b65153072698f750f85e6be3",
"assets/assets/redakteure/fabiank.png": "78912ee6f0b635774dae9f3b2ba0a42c",
"assets/assets/redakteure/damian.png": "535d8a43cb2a68b2addeabc915897fcb",
"assets/assets/redakteure/raphikoch.png": "554be50a1b3e61b136cb8bf5e9b7bec8",
"assets/assets/redakteure/dominicm.png": "8d92770c453db2b3b5c715f3d0278365",
"assets/assets/redakteure/patrickv.png": "47251c432e24b30af35a04a1479eb85c",
"assets/assets/redakteure/diego.png": "e641063c245574e32005cda06434e4ab",
"assets/assets/redakteure/justin.png": "ee88bb6da5f38b729241ade6522db422",
"assets/assets/redakteure/fabio.png": "690c154d4edbb7c9d85ef5564bb29626",
"assets/assets/redakteure/dariok.png": "948678709ab4ba96d80b48c6f469c201",
"assets/assets/Hover.png": "f0a2318c40269d84384f56f54d25ad69",
"assets/assets/youtube_diadamas_2020.jpg": "cf2be5a623165280a21cdf1df43ef8ff",
"assets/assets/jsons/vorstand.json": "a2bff2248214e5df484ad37643ea15db",
"assets/assets/jsons/ehrenmitglieder.json": "4d2c651452088497155dab4a53b0e3dd",
"assets/assets/flaeckegosler_webseite_logo.png": "3271b8cdf7c4f8ca5dd0a386d8e2c263",
"assets/assets/goslergrend.png": "50f17fabf1b95bf199ac8b9187249ca8",
"assets/assets/goslermythos_title.png": "18d4d9d52ef5ff427ca490e4dcaa379c",
"assets/assets/tambi_2020_vektor.png": "14c38aaad2f14d51f8a63f8d6794bf75",
"assets/assets/MUSTER_REPETIEREND.png": "f1cae12403936b65fc61e501987ad8df",
"assets/NOTICES": "5a17593eb93d2072b64772dddc078777",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/FontManifest.json": "575eac461872ace0247a4101415b9069",
"assets/AssetManifest.json": "e8b1d02c86af67be7708fb5e622f1940",
"assets/shaders/ink_sparkle.frag": "73e4ebc6468abc93b2f556aabb23e49f",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"index.html": "fc4cc48601efddbb6877a2889964cb54",
"/": "fc4cc48601efddbb6877a2889964cb54",
"version.json": "1571572e1330d672e2303b86bc90a510",
"manifest.json": "9aa29b61c1c790624754cc26c4ca5cd1",
"main.dart.js": "e96de532d0bee0c3398e9675a3f16915",
"favicon_64x64.png": "6746a7c0d50c92e52bfd7309dc40e1f2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
