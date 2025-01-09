# trendhub

An app to show current trending Github repositories

## Software Required
Android Studio / VS Code

## Minimum Android Version: 21
## Minimum IOS Version: 13.0


## Assumptions Made During Development

1. The app uses the [GitHub Trending API to fetch data.
2. Internet connectivity is required for the app to function.
3. If the programming language for a repository is not available, it will not be displayed.
4. Error handling includes retry logic for API failures.
5. Shimmer animations are used to improve user experience while loading.

## Getting Started

Follow these steps to run the project locally.

### Prerequisites

- Install [Flutter](https://docs.flutter.dev/get-started/install) on your system.
- Ensure your device/emulator is set up and ready for Flutter development.

### Installation

1. Clone the repository:
   git clone https://github.com/Junaidnawab0835/trendhub.git
   cd trendhub

2. Install dependencies:
   flutter pub get

3. Run the app:
   flutter run

4. (Optional) Build for release:
   flutter build apk

