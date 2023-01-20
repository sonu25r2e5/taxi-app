import 'package:flutter/material.dart';

import '../allscreens/images.dart';

class ClimateChange extends StatefulWidget {
  const ClimateChange({super.key});

  @override
  State<ClimateChange> createState() => _ClimateChangeState();
}

class _ClimateChangeState extends State<ClimateChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Description'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const bgimages(),
            Positioned(
              top: 12,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 44, 233, 30),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Climate change refers to the long-term changes in the Earth\'s climate, particularly the average temperature and weather patterns. The main cause of climate change is the burning of fossil fuels, such as coal, oil, and natural gas, which releases greenhouse gases into the atmosphere. These gases trap heat from the sun, causing the Earth\'s temperature to rise. This warming of the planet is known as global warming. Climate change has a wide range of impacts on the Earth\'s ecosystems and the people who depend on them. Rising temperatures can lead to more extreme weather events, such as heat waves, droughts, and heavy precipitation. These events can cause damage to infrastructure, disrupt food production, and spread disease. Warmer temperatures also lead to the melting of ice in the Arctic and the melting of glaciers and ice sheets, which can cause sea levels to rise and threaten coastal communities.Climate change also has significant impacts on biodiversity and ecosystems. As temperatures change, plants and animals may be forced to move to new areas to find suitable conditions, which can disrupt entire ecosystems. Warmer temperatures can also cause the timing of seasonal events, such as bird migration and plant flowering, to shift out of sync with the timing of other events in the ecosystem, such as the emergence of pollinators.Climate change also disproportionately affects vulnerable communities, including low-income and marginalized populations. These communities often have less access to resources and infrastructure that can help them adapt to the impacts of climate change, such as air conditioning or drought-resistant crops.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
