class TravelModel {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String discription;
  String price;

  TravelModel({
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.discription,
    required this.price,
  });
}

List<TravelModel> travelList = [
  TravelModel(
      name: "Guangzhou",
      location: "Asia, China",
      image: "assets/images/Guangzhou.jpg",
      distance: "64",
      temp: "17",
      rating: "7",
      discription: "Guangzhou, often called Canton, is the most populous city in southern China. With a population of approximately 18.7 million in 2020, Guangzhou is one of the largest and most densely populated cities in China. The city serves as a major trade and transportation hub, playing a crucial role in the country’s economy. Located in the Pearl River Delta, Guangzhou is known for its rich history, vibrant culture, and status as a key center for international business and manufacturing.",
      price: "5000"),

  TravelModel(
      name: "New York",
      location: "America, United States",
      image: "assets/images/newyork.jpg",
      distance: "47",
      temp: "11",
      rating: "10",
      discription: """New York, often called New York City or NYC, is the most populous city in the United States. With a 2020 population of 8,804,190 distributed over 300.46 square miles (778.2 km2), New York City is the most densely populated major city in the United States. The city is more than twice as populous as Los Angeles, the nation's second-largest city, and has a larger population than 38 of the nation's 50 states. New York City is located at the southern tip of New York state.""",
      price: "4000"),

  TravelModel(
      name: "Shanghai",
      location: "Asia, China",
      image: "assets/images/Shanghai.jpg",
      distance: "37",
      temp: "20",
      rating: "19",
      discription: """Shanghai, the largest city in China, is a global financial hub and one of the most populous cities in the world. With a population of approximately 24.9 million in 2020, it is the most densely populated major city in China. Located on the eastern coast of the country, at the mouth of the Yangtze River, Shanghai serves as a vital center for commerce, finance, trade, and innovation. The city is known for its iconic skyline, historical landmarks, and rapid modernization, making it a key player in both China’s economy and global affairs."""
      ,price: "6000"),

  TravelModel(
      name: "Seoul",
      location: "Asia, South korea",
      image: "assets/images/southkorea.jpg",
      distance: "30",
      temp: "18",
      rating: "4.7",
      discription: """Seoul, the capital and largest city of South Korea, is a vibrant metropolis and a global economic and cultural hub. With a population of approximately 9.6 million in 2020, it is the most densely populated city in the country. Located in the northwestern part of South Korea along the Han River, Seoul is known for its advanced technology, historical landmarks, and dynamic entertainment industry. As a leading center for finance, business, and innovation, the city plays a crucial role in South Korea’s economy and global influence."""
      ,price: "5600"),

  TravelModel(
      name: "Tokyo",
      location: "Asia, Japan",
      image: "assets/images/Tokyo.jpg",
      distance: "25",
      temp: "10",
      rating: "9.3",
      discription:"""Tokyo, the capital of Japan, is the most populous metropolitan area in the world and a major global financial and cultural hub. With a population of approximately 14 million in the city and over 37 million in the greater metropolitan area, Tokyo is a densely populated and highly developed urban center. Located on the eastern coast of Japan’s Honshu island, the city is known for its blend of modern skyscrapers, historic temples, and cutting-edge technology. As a leading center for business, innovation, and entertainment, Tokyo plays a crucial role in Japan’s economy and global influence."""
      ,price: "5700"),
];
