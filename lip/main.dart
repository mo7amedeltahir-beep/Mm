import 'package:flutter/material.dart';

void main() {
  runApp(const SweetyFashionApp());
}

class SweetyFashionApp extends StatelessWidget {
  const SweetyFashionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweety Fashion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFF0F8FF), // أزرق فاتح جداً
        primaryColor: Colors.black,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl, // دعم الواجهة من اليمين لليسار
        child: HomeScreen(),
      ),
    );
  }
}

// نموذج بيانات المنتج
class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'الكل';

  final List<String> categories = [
    'الكل',
    'أدوات التجميل',
    'العطور',
    'الملابس الداخلية',
    'الإكسسوارات',
  ];

  // قائمة المنتجات (يمكنك تعديل الأسماء والصور والأسعار هنا)
  final List<Product> products = [
    Product(
      id: '1',
      name: 'كريم مغذي',
      price: 150.0,
      description: 'كريم مرطب ومغذي للبشرة بتركيبة غنية بزيوت طبيعية وفيتامينات يعيد للبشرة نضارتها.',
      imageUrl: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=300',
      category: 'أدوات التجميل',
    ),
    Product(
      id: '2',
      name: 'عطر نسائي',
      price: 280.0,
      description: 'عطر ساحر برائحة الزهور الناعمة والمسك يدوم طوال اليوم.',
      imageUrl: 'https://images.unsplash.com/photo-1541643600914-78b084683601?w=300',
      category: 'العطور',
    ),
    Product(
      id: '3',
      name: 'أحمر شفاه',
      price: 85.0,
      description: 'أحمر شفاه مطفي بتركيبة ناعمة ترطب الشفاه وتمنحك لوناً غنياً ثابتاً.',
      imageUrl: 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=300',
      category: 'أدوات التجميل',
    ),
    Product(
      id: '4',
      name: 'طقم إكسسوار',
      price: 195.0,
      description: 'طقم إكسسوار مطلي بالذهب مرصع بالكريستال يناسب المناسبات.',
      imageUrl: 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=300',
      category: 'الإكسسوارات',
    ),
    Product(
      id: '5',
      name: 'سيروم نضارة',
      price: 210.0,
      description: 'سيروم فيتامين C لتعزيز نضارة البشرة وتوحيد لونها.',
      imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=300',
      category: 'أدوات التجميل',
    ),
    Product(
      id: '6',
      name: 'عطر فرنسي',
      price: 320.0,
      description: 'نفحات من الفانيليا والياسمين لطلة مليئة بالفخامة والأنوثة.',
      imageUrl: 'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?w=300',
      category: 'العطور',
    ),
    Product(
      id: '7',
      name: 'طقم نوم حرير',
      price: 240.0,
      description: 'طقم نوم من الحرير الناعم والتطريز الفاخر يوفر لك أقصى درجات الراحة.',
      imageUrl: 'https://images.unsplash.com/photo-1583846783214-7229a91b20ed?w=300',
      category: 'الملابس الداخلية',
    ),
    Product(
      id: '8',
      name: 'سوار ذهبي',
      price: 120.0,
      description: 'سوار عصري بتصميم بسيط يضفي لمسة رقيقة على معصمك.',
      imageUrl: 'https://images.unsplash.com/photo-1611591475777-233cd749228e?w=300',
      category: 'الإكسسوارات',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'الكل'
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // أيقونة التطبيق الدائرية
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
                ],
              ),
              child: ClipOval(
                child: Icon(Icons.woman_rounded, size: 24, color: Colors.pink[400]),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Sweety Fashion',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 6),

          // 1. التصنيفات (أنحف وأصغر وبخط أصغر)
          SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Colors.pinkAccent : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // 2. شبكة المنتجات (4 منتجات في الصف)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () => _showProductDetails(context, product),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              )
                            ],
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${product.price.toInt()} ر.س',
                          style: const TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // 3. التذييل
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: const [
                Text(
                  'Sweety Fashion',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'لأجلكي سيدتي !!!',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductDetailsBottomSheet(product: product),
    );
  }
}

// نافذة التفاصيل مع التحكم بالكمية باللمس والإدخال
class ProductDetailsBottomSheet extends StatefulWidget {
  final Product product;
  const ProductDetailsBottomSheet({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsBottomSheet> createState() => _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
  int quantity = 1;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: quantity.toString());
  }

  void _changeQty(int delta) {
    setState(() {
      quantity = (quantity + delta).clamp(1, 99);
      _controller.text = quantity.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F8FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      mainAxisSize: MainAxisSize.min,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: ClipOval(
                child: Image.network(widget.product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              '${widget.product.price} ريال',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.5, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            // التحكم بالكمية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('الكمية:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _changeQty(-1),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.remove, color: Colors.white, size: 16),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 45,
                  height: 34,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    onChanged: (val) {
                      int? parsed = int.tryParse(val);
                      if (parsed != null && parsed > 0) quantity = parsed;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => _changeQty(1),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text('إضافة إلى السلة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
