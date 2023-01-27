import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color(0xFF303030),
        shadowColor: const Color(0xff00183F),
        leading: IconButton(
          onPressed: () {Navigator.pushNamed(context, 'login');},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logo_dev),
          ),
        ],
      ),
      
      backgroundColor: const Color(0xFF303030),
      body: Stack(
        children: [
          SingleChildScrollView(
            child:Container( 
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    
                    child: Text(
                      "Welcome, \nMr. Sumit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                const SizedBox(
                  height: 40,
                ),

                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF3C3C3C),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 120,
                          width: 350,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Text(
                                  "Traffic Signs",
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),                               
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF3C3C3C),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 120,
                          width: 350,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Text(
                                  "Reading Materials",
                                  style: TextStyle(color: Colors.white,  fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),


                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF3C3C3C),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 120,
                          width: 350,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Text(
                                  "Written Mock Exam",
                                  style: TextStyle(color: Colors.white,  fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF3C3C3C),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 120,
                          width: 350,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Text(
                                  "Exam Trial and Information",
                                  style: TextStyle(color: Colors.white,  fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF3C3C3C),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 120,
                          width: 350,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Text(
                                  "Vision Test",
                                  style: TextStyle(color: Colors.white,  fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                /*
                BottomAppBar(child: Text("Hello"),)
                */

                
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff00183F),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 104,
                          width: 163,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Home Move",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                    Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff00183F),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        splashColor: Colors.grey.withOpacity(0.1),
                        child: Container(
                          height: 104,
                          width: 163,
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10.0,
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Office Move",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                */

              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}
