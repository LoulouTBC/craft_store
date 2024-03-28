import 'package:flutter/material.dart';
import 'package:wadi_alarab/products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(size),
            _buildSofasSection(size),
            _buildBottomBar(size),
            const Expanded(
              flex: 5,
              child: ProductsGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(Size size) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white, size: size.width * 0.07),
            Text(
              'Craft',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'DancingScript',
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.shopping_bag_outlined,
                color: Colors.white, size: size.width * 0.07),
          ],
        ),
      ),
    );
  }

  Widget _buildSofasSection(Size size) {
    return Expanded(
      flex: 4,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sofas',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: size.width * 0.07,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This Catie Uphoistered Panel Bad defines bsics mode beautifully',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            child: Image(
              color: Color.fromARGB(255, 220, 111, 22),
              colorBlendMode: BlendMode.darken,
              image: AssetImage('assets/images/sofa.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(Size size) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                  ),
                ),
                Icon(Icons.list_sharp,
                    color: Colors.white, size: size.width * 0.07),
              ],
            ),
            Text(
              'Sort by',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.grid_view_outlined,
                    color: Colors.white, size: size.width * 0.07),
                Icon(Icons.menu, color: Colors.white, size: size.width * 0.07),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
