
List Videos = [
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4',
    'categories': Categories.natural,
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-white-sand-beach-background-1564-large.mp4',
    'categories': Categories.natural
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
    'categories': Categories.natural
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-waterfall-in-forest-2213-large.mp4',
    'categories': Categories.natural
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-huge-trees-in-a-large-green-forest-5040-large.mp4',
    'categories': Categories.natural
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-traffic-in-an-underground-tunnel-4067-large.mp4',
    'categories': Categories.business
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-open-office-space-914-large.mp4',
    'categories': Categories.business
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-wrist-watch-3653-large.mp4',
    'categories': Categories.business
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-typing-on-a-laptop-242-large.mp4',
    'categories': Categories.business
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-people-walking-in-front-of-a-building-4169-large.mp4',
    'categories': Categories.business
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-eating-salad-with-a-fork-40521-large.mp4',
    'categories': Categories.food
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-frying-diced-bacon-in-a-skillet-43063-large.mp4',
    'categories': Categories.food
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-fresh-sliced-fruit-placed-on-a-table-10419-large.mp4',
    'categories': Categories.food
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-a-waiter-serves-coffee-to-a-customer-205-large.mp4',
    'categories': Categories.food
  },
  {
    'url':
        'https://assets.mixkit.co/videos/preview/mixkit-different-types-of-fresh-fruit-in-presentation-video-42941-large.mp4',
    'categories': Categories.food
  },
];

class Categories {
  static String business = "business";
  static String businessPhoto =
      "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  static String natural = "natural";
  static String naturalPhoto =
      "https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1776&q=80";
  static String food = "food";
  static String foodPhoto =
      "https://images.unsplash.com/photo-1488998527040-85054a85150e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80";

  static List categoriesList = [
    {'name': business, 'photo': businessPhoto},
    {'name': natural, 'photo': naturalPhoto},
    {'name': food, 'photo': foodPhoto},
  ];
}
