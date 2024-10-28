# Architecture Design Document

This document describes the architecture design of the application.

## Overview

The lib folder contains the core business logic of the application. It contains the following subfolders:

* api: This folder contains the API calls to the Finnhub API.
* models: This folder contains the data models used in the application.
* pages: This folder contains the UI pages of the application.
* widgets: This folder contains the UI widgets of the application.

## API

The API folder contains the API calls to the Finnhub API. The API calls are implemented using the http package. The API calls are wrapped in a class called `StockDataApi`. The class provides the following methods:

* `fetchStocks`: This method Fetches the list of stocks from the API.

## Models

The models folder contains the data models used in the application. The models are implemented using the freezed package. The models are as follows:

* `Stock`: This model represents a stock and its attributes such as the symbol, name, and current price.
* `StockChart`: This model represents the historical stock chart data and its attributes such as the dates, open, high, low, and close prices.

## Pages

The pages folder contains the UI pages of the application. The pages are implemented using the flutter package. The pages are as follows:

* `MainPage`: This page displays the current stock quote and chart for a given stock symbol.
* `StockDetailPage`: This page displays the detailed information of a given stock such as the current price, open, high, low, and close prices.

## Dependencies

The following dependencies are used in the application:

### Application Dependencies

* flutter: ^3.0.0
* http: ^0.13.3
* freezed: ^1.1.1
* shimmer: ^2.0.0
* web_socket_channel: ^2.2.0

### Dev Dependencies

* flutter_test: ^1.20.0
* flutter_lints: ^1.0.0
* test: ^1.16.0

### Dependency Description

* **flutter**: The Flutter framework for building natively compiled applications for mobile, web, and desktop.
* **http**: A package for making HTTP requests in Dart.
* **freezed**: A code generator for data classes in Dart.
* **shimmer**: A package for creating shimmer effects in Flutter.
* **web_socket_channel**: A package for establishing WebSocket connections in Dart.
* **flutter_test**: A package for writing unit tests and widget tests for Flutter applications.
* **flutter_lints**: A package for enforcing coding standards and best practices in Flutter applications.
* **test**: A package for writing unit tests in Dart.

## Security

The lib folder does not contain any security sensitive information.

## Scalability

The application is designed to be scalable. The API calls are implemented using the http package which is designed to be scalable. The models are implemented using the freezed package which is designed to be scalable. The pages are implemented using the flutter package which is designed to be scalable.

## Performance

Current API performance for fetching list of Stock Quote, is returning under 2 seconds, while websocket live subscription updates are taking more than 15 seconds to get the live quotes of the data

## Testing

The lib folder contains unit tests for the API calls, models, and pages. The unit tests are implemented using the test package. The unit tests are as follows:

* `test/api_test.dart`: This file contains unit tests for the API calls.
* `test/models_test.dart`: This file contains unit tests for the models.
* `test/pages_test.dart`: This file contains unit tests for the pages.

## Future Enhancements

* Adding enhanced unit tests & widget tests
* Implementing watchlist feature where not more than 20-25 stock items can be subscribed for live updates
* Implementing search feature for adding stock quote to the watch list
* Integrating with the API call to get the LTP for stock quote for first time (This will remove first time delay of 15 sec) 
* Implement stock search page and lazy list rendering for large set of stock quotes


## Conclusion

The lib folder contains the core business logic of the application. It contains the API calls to the Finnhub API, the data models used in the application, the UI pages of the application, and utility functions used in the application. The lib folder is designed to be scalable, performant, and secure. The lib folder contains unit tests for the API calls, models, and pages.
