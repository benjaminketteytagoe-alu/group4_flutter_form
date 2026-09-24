# Group 4 Dynamic Flutter Form

A dynamic, stateful Flutter form implementation designed based on the provided UI design requirements. Built with Flutter and Dart, this project features interactive dynamic updates, input length validation, dynamic sliders, and full form reset controls.

---

## Features

- **Dynamic Form Input**: Interactive inputs managed via Flutter's `StatefulWidget`.
- **Password Obscuration Toggle**: Show or hide password with a tap of the eye icon.
- **Live Slider Feedback**: The Tuition amount dynamically updates in real time as the user drags the slider.
- **Form Validation**: Checks for minimum character length requirements (e.g., username length and password length).
- **Clear Form Action**: Resets all fields, radio options, checkboxes, and slider back to default states.
- **Clean Architecture**: Separates models (`form_model.dart`), UI helper widgets (`form_widgets.dart`), and screen logic (`main.dart`).
- **No Debug Banner**: Configured with `debugShowCheckedModeBanner: false`.

---

## Project Structure

### Project Structure

```text
lib/
├── form_model.dart    # Holds form state, data models, and reset logic
├── form_widgets.dart  # Reusable custom UI components and layout wrappers
└── main.dart          # Main application entry point and Form State management
```

### Getting Started

```bash
# Clone the repository
git clone https://github.com/benjaminketteytagoe-alu/group4_flutter_form.git

# Navigate to the project directory
cd group4_flutter_form/loginform
```
```bash
# Execute flutter run in your terminal
flutter run
```
---
```text
NB: This process is done after the necessary tools are installed and configured.
```
