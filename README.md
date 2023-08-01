#  Fetch Data from an API and Display It in ListView in Flutter

The basic idea to implement fetching and displaying data from REST API goes like this.

Write a method to fetch data from the API
Calling that method gives us an API response (JSON)
Create a model class for the JSON response (we will need this to parse our JSON response to a dart object)
Create a listview builder wrapped inside a future builder (we will discuss this pattern further).
Pass dart object details into the listview builder, and that's it!

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
