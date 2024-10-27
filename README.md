## Setup

1. **Install Flutter:**
   - Follow the instructions to install Flutter on your machine from the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
   - Ensure that your Flutter environment is set up by running `flutter doctor` in your terminal.

2. **Clone the Repository:**
   - Clone this project repository to your local machine using:
     ```bash
     git clone https://github.com/srujalsk/sk-flutter-assignment.git
     ```
   - Navigate into the project directory:
     ```bash
     cd flutter_application_1
     ```

3. **Install Dependencies:**
   - Run the following command to install the necessary dependencies:
     ```bash
     flutter pub get
     ```

## Running the Project

1. **Set Finnhub API Key:**
   - Goto https://finnhub.io/ register & get the API key which will be needed to access the data.
   - Replace `<YOUR-API-KEY>` in file `lib/api/stock_data_api.dart` file with your own generated Finnhub API key  .

2. **Run the Application:**
   - Use the following command to run the project:
     ```bash
     flutter run
     ```

## Testing

1. **Run Tests:**
   - To run the tests for this project, use the command:
     ```bash
     flutter test
     ```

2. **Debugging:**
   - Use Flutter tools to debug and profile the application as needed. You can use tools such as:
     - Dart DevTools
     - Android Studio or Visual Studio Code with Flutter extensions

For further assistance or information, please refer to the [Flutter documentation](https://flutter.dev/docs) or contact the project maintainer (https://github.com/srujalsk).
