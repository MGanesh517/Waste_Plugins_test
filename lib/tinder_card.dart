
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';


class ExampleCard extends StatelessWidget {
  final Candidate candidate;

  const ExampleCard(this.candidate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                candidate.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                candidate.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// example_candidate_model.dart
class Candidate {
  final String name;
  final String description;

  Candidate(this.name, this.description);
}

List<Candidate> candidates = [
  Candidate('Alice', 'Software Engineer with 5 years of experience'),
  Candidate('Bob', 'Mobile Developer specializing in Flutter'),
  Candidate('Charlie', 'Full Stack Developer and UI/UX Designer'),
];


class TinderCard extends StatefulWidget {
  const TinderCard({
    super.key,
  });

  @override
  State<TinderCard> createState() => _TinderCardPageState();
}

class _TinderCardPageState extends State<TinderCard> {
  final CardSwiperController controller = CardSwiperController();

  final cards = candidates.map(ExampleCard.new).toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,

        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                allowedSwipeDirection: const AllowedSwipeDirection.only(up: true), // for specific direction
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 1,  // Show only one card
                backCardOffset: const Offset(0, 0),
                padding: const EdgeInsets.all(0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

   bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

}
