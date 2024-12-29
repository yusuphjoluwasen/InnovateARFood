# InnovateARFoodSDK Documentation

**InnovateARFoodSDK** is a cutting-edge iOS SDK designed to integrate Augmented Reality (AR) dining experiences into restaurant or food business applications. This SDK is designed to be used by businesses to enhance their existing restaurant applications, offering customers an immersive and interactive dining experience. 

Available for iOS 16.0 and later, **InnovateARFoodSDK** supports seamless integration with ARKit to showcase food items with 3D models and interactive content. This SDK provides a compelling way for customers to experience food visually before ordering, providing a more engaging dining experience.

## Installation

You can easily integrate **InnovateARFoodSDK** into your iOS project via **Swift Package Manager**. Follow the instructions below to get started:

1. Open your project in Xcode.
2. Go to `File` > `Add Packages...`.
3. In the URL field, paste the following repository URL:  
   [https://github.com/yusuphjoluwasen/InnovateARFood](https://github.com/yusuphjoluwasen/InnovateARFood).
4. Select the version you want to integrate and click **Add Package**.

The SDK will now be available for use within your project.

## Usage

Once the SDK is integrated into your project, you can begin using it to showcase your restaurant or food business offerings with Augmented Reality.

### UIKit Usage Example

```swift
import UIKit
import InnovateARFoodSDK

class ViewController: UIViewController {
    
    // Example restaurant object with two foods
    @State private var restaurant = Restaurant(name: "Sushi Place", foods: [
        Food(name: "Sushi Roll", imageURL: "https://dummyimage.com/400x400/000/fff&text=Sushi+Roll", arUSDZLink: "https://dummyurl.com/sushi-roll.usdz", price: 10.99),
        Food(name: "Tempura", imageURL: "https://dummyimage.com/400x400/000/fff&text=Tempura", arUSDZLink: "https://dummyurl.com/tempura.usdz", price: 12.99)
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }
    
    private func setupUI() {
        let startButton = UIButton(type: .system)
        startButton.setTitle("Start Restaurant Experience", for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = .systemBlue
        startButton.setTitleColor(.white, for: .normal)
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        startButton.addTarget(self, action: #selector(startRestaurantExperience), for: .touchUpInside)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func startRestaurantExperience() {
        // Start the AR restaurant experience
        RestaurantSDK.shared.startRestaurantExperience(restaurant: restaurant, clientId: "sampleClientID", in: self)
    }
}

```

### SwiftUI Usage Example

```swift
import SwiftUI
import InnovateARFoodSDK

struct ContentView: View {
    @State private var restaurant = Restaurant(name: "Sushi Place", foods: [
        Food(name: "Sushi Roll", imageURL: "https://dummyimage.com/400x400/000/fff&text=Sushi+Roll", arUSDZLink: "https://dummyurl.com/sushi-roll.usdz", price: 10.99),
        Food(name: "Tempura", imageURL: "https://dummyimage.com/400x400/000/fff&text=Tempura", arUSDZLink: "https://dummyurl.com/tempura.usdz", price: 12.99)
    ])
    
    @State private var navigateToRestaurantExperience = false

    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    navigateToRestaurantExperience = true
                }) {
                    Text("Start Restaurant Experience")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Welcome")
            .navigationDestination(isPresented: $navigateToRestaurantExperience) {
                // Here, use the `RestaurantSDK` to present the AR restaurant experience view
                RestaurantSDK.shared.makeRestaurantView(restaurant: restaurant, clientId: "sampleClientID")
            }
        }
    }
}
```

##Key Components
i. Restaurant: Represents a restaurant with a list of food items. Each food item contains the following attributes:
   1) name: Name of Restaurant.
   2) Food: Represents an individual food item, which can be displayed in AR. Each food item contains:
      1) name: The name of the food item.
      2) imageURL: A URL to display an image of the food.
      3) arUSDZLink: A URL to the 3D AR model of the food (USDZ format).
      4) price: The price of the food item.
ii. clientID: unique client id generated from the business portal

Requirements
- iOS 16.0 or later
- Xcode 12.0 or later
- ARKit (for AR support)


