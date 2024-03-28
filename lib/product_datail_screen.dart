import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wadi_alarab/dottedIndicator.dart';
import 'package:wadi_alarab/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentSliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(size),
              SizedBox(height: size.height * 0.025),
              _backIcon(size, context),
              _buildSlider(size),
              _buildSliderIndicator(size),
              _buildColorSelectionRow(size),
              _buildProductInfo(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(Size size) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.black, size: size.width * 0.07),
          Text(
            'Craft',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'DancingScript',
              fontSize: size.width * 0.07,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.shopping_bag_outlined,
              color: Colors.black, size: size.width * 0.07),
        ],
      ),
    );
  }

  Widget _buildSlider(Size size) {
    return Expanded(
      flex: 6,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 300),
          onPageChanged: (int index, reason) {
            setState(() {
              currentSliderIndex = index;
            });
          },
        ),
        items: [
          _offerImage(size,
              'https://tameed.org/wadi_alarab/wadi_al_arab/public/storage/${widget.product.image}'),
          _offerImage(size,
              'https://tameed.org/wadi_alarab/wadi_al_arab/public/storage/${widget.product.image}'),
          _offerImage(size,
              'https://tameed.org/wadi_alarab/wadi_al_arab/public/storage/${widget.product.image}'),
          _offerImage(size,
              'https://tameed.org/wadi_alarab/wadi_al_arab/public/storage/${widget.product.image}'),
        ],
      ),
    );
  }

  Widget _buildSliderIndicator(Size size) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 4; i++)
            DottedIndecator(
                size: size, i: i, currentSliderIndex: currentSliderIndex),
        ],
      ),
    );
  }

  Widget _offerImage(Size size, String imagePath) {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildColorSelectionRow(Size size) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Color :',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                child: const Image(
                    image: AssetImage('assets/images/greySofa.png')),
              ),
              GestureDetector(
                child: const Image(
                    image: AssetImage('assets/images/blueSofa.png')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfo(Size size) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  size: 20,
                  color: index == 4 ? Colors.grey : Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontSize: size.width * 0.04,
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: size.height * 0.04,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: size.width * 0.032,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _backIcon(Size size, BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios_new),
    iconSize: size.height * 0.03,
    color: const Color.fromARGB(255, 65, 60, 60),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
