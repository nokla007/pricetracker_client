import 'dart:convert';

import 'package:pricetracker_client/services/api.dart';

import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

class ProductService {
  ProductService(this.user);
  final User user;
  final api = API();

  // Future<List<Product>> searchProduct(String query) async {
  //   // return List<Product>.from(productlistjson.map((x) => Product.fromJson(x)));
  //   List<Map<String, dynamic>> productList = await api.search(query);
  //   return List<Product>.from(productList.map((x) => Product.fromJson(x)));
  // }

  Future<List<Product>> searchProduct(String query) async {
    var url = Uri.parse(API.searchUrl + query);
    print(url);
    var response = await http.post(url);
    if (response.statusCode == 200) {
      print(response.body);
      return List<Product>.from(
          json.decode(response.body).map((x) => Product.fromJson(x)));
    } else if (response.statusCode == 404) {
      throw Exception("No results found");
    } else {
      throw Exception('Error');
    }
  }

  // Future<Product> fetchProduct(String url) async {
  //   // return Product.fromJson(productjson);
  //   Map<String, dynamic> product = await api.fetch(url);
  //   return Product.fromJson(product);
  // }
  Future<Product> fetchProduct(String producturl) async {
    var url = Uri.parse(API.fetchUrl);
    var response = await http.post(url, body: {
      "url": producturl,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return Product.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("No products found");
    } else {
      throw Exception('Error');
    }
  }

  Future<Product> getProduct(int id) async {
    // return Product.fromJson(productjson);
    Map<String, dynamic> product = await api.getProduct(id);
    return Product.fromJson(product);
  }

  List<Product> getProducts() {
    return List<Product>.from(productlistjson.map((x) => Product.fromJson(x)));
  }
}

var productjson = {
  "title": "Anker Life Q30 Hybrid ANC Headphones",
  "price": 8990.0,
  "image":
      "https://www.gadstyle.com/wp-content/uploads/2021/09/anker-life-q30-hybrid-anc-headphones-1-600x600.jpg",
  "url":
      "https://www.gadstyle.com/item/67948/anker-life-q30-hybrid-anc-headphones/",
  "id": 3
};

var productlistjson = [
  {
    "title": "TEAM C186 64GB 3.1 USB Pendrive",
    "price": 760.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/t/e/team-c186-64gb-3.1-usb-pendrive-186.jpg",
    "url": "https://www.pickaboo.com/team-c186-64gb-3-1-usb-pendrive.html"
  },
  {
    "title": "Apacer AH360 64GB USB 3.1 Pendrive",
    "price": 850.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/a/p/apacer-ah360-64gb-usb-3.1-pendrive-3.jpg",
    "url": "https://www.pickaboo.com/apacer-ah360-64gb-usb-3-1-pendrive.html"
  },
  {
    "title": "Transcend TS64GJF790K 64GB Jetflash 790 USB 3.0 Pendrive - Black",
    "price": 880.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/7/9/790-1.jpg",
    "url":
        "https://www.pickaboo.com/transcend-ts64gjf790k-64gb-jetflash-790-black-usb-3-0-pendrive.html"
  },
  
  {
    "title": "TEAM C183 64GB 3.1 USB Pendrive",
    "price": 760.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/t/e/team-c183-64-gb.jpg",
    "url": "https://www.pickaboo.com/team-c183-64gb-3-1-usb-pendrive.html"
  },
  {
    "title": "Adata UV360 64GB USB 3.2 Metal Pendrive",
    "price": 770.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/a/d/adata-uv360-64gb-usb-3.2-metal-pendrive3.jpg",
    "url":
        "https://www.pickaboo.com/adata-uv360-64gb-usb-3-2-pendrive-black.html"
  },
  {
    "title": "HP 64GB Pendrive Flash Drive USB 3.0",
    "price": 1250.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2020/03/hp-x750w-usb-flash-drive-usb-3-0-64gb-high-speed-metal-usb-stick-64gb-pendrive-flash-drive-1-600x600.jpg",
    "url":
        "https://www.gadstyle.com/item/34818/hp-x750w-usb-flash-drive-usb-3-0-64gb-high-speed-metal-usb-stick-64gb-pendrive-flash-drive/"
  },
  {
    "title": "SanDisk 64GB Ultra microSDXC UHS-I Class 10 Memory Card",
    "price": 1390.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2019/05/sandisk-64gb-ultra-microsdxc-uhs-i-class-10-memory-card-with-sd-adapter-5-600x600.jpg",
    "url":
        "https://www.gadstyle.com/item/18311/sandisk-64gb-ultra-microsdxc-uhs-i-class-10-memory-card-with-sd-adapter/"
  },
  {
    "title": "SanDisk Ultra Micro SD Card 64GB With 1 Year Warranty",
    "price": 1550.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2018/10/SanDisk-Ultra-Micro-SD-Card-64GB-3-600x600.jpg",
    "url": "https://www.gadstyle.com/item/3173/sandisk-ultra-64gb/"
  },
  {
    "title": "Anker SoundCore Life Q30 ANC Headphone",
    "price": 9990.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/a/n/anker-soundcore-life-q30--1.jpg",
    "url":
        "https://www.pickaboo.com/anker-soundcore-life-q30-anc-headphone.html"
  },
  {
    "title": "Anker Life Q30 Hybrid ANCHeadphones",
    "price": 8990.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2021/09/anker-life-q30-hybrid-anc-headphones-1-600x600.jpg",
    "url":
        "https://www.gadstyle.com/item/67948/anker-life-q30-hybrid-anc-headphones/"
  },
  {
    "title":
        "Anker Life Q30 Hybrid Active Noise Cancelling (18 Months OfficialWarranty)",
    "price": 9500.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2021/09/anker-life-q30-hybrid-anc-headphones-600x600.jpg",
    "url":
        "https://www.gadstyle.com/item/68422/anker-life-q30-hybrid-active-noise-cancelling/"
  },
  {
    "title": "Honor Band 6 Smart Sports Wristband With Blood Oxygen Monitor",
    "price": 3449.0,
    "image":
        "https://azse77seaprodsa.blob.core.windows.net/b2b-dr-pickaboocdn/media/catalog/product/cache/ad6eca43ef1a34982ffeb01940d91d5b/h/o/honor-band-6.jpg",
    "url":
        "https://www.pickaboo.com/honor-band-6-smart-sports-wristband-with-blood-oxygen-monitor.html"
  },
  {
    "title": "Huawei Honor Band 6 Smart Wristband",
    "price": 3190.0,
    "image":
        "https://www.gadstyle.com/wp-content/uploads/2020/12/huawei-honor-band-6-smart-wristband-7-600x600.jpg",
    "url":
        "https://www.gadstyle.com/item/49999/huawei-honor-band-6-smart-wristband/"
  }

];

