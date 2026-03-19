# 🍔 Food App - Flutter Project

A modern Flutter application for browsing food items, managing a cart, and completing payments using Stripe. The project demonstrates clean architecture, state management with BLoC, API integration, and responsive UI design.

---

## ✨ Features

* 🛍️ Browse food products with images and details
* 🧺 Add and remove items from cart
* 💳 Secure online payments using **Stripe**
* 🌍 Multi-language support with localization
* 📱 Responsive UI across different screen sizes
* ⚡ Optimized network calls with logging and caching

---

## 🧱 Tech Stack & Packages

### State Management

* **flutter_bloc** – Business logic separation and reactive UI updates
* **equatable** – Simplified value comparison in states and models
* **rxdart** – Stream utilities and reactive programming

### Networking

* **dio** – Powerful HTTP client for API requests
* **pretty_dio_logger** – Logs API requests and responses for debugging

### Dependency Injection

* **get_it** – Service locator for managing dependencies

### Local Storage

* **shared_preferences** – Store simple local data

### UI & UX

* **flutter_screenutil** – Responsive layout across screen sizes
* **flutter_svg** – Display SVG icons and illustrations
* **cached_network_image** – Efficient image loading and caching
* **shimmer** – Loading placeholders
* **adaptive_dialog** – Native-style dialogs on Android & iOS

### Media Handling

* **image_picker** – Select images from camera or gallery
* **image_cropper** – Crop images before upload

### Localization

* **easy_localization** – Multi-language support

### Payments

* **flutter_stripe** – Stripe SDK for secure payment processing

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── network/
│   ├── utils/
|   ├── errors/
|   ├── widgets/
│
├── features/
│   ├── data/
│   │   ├── models/
│   │   ├── repo/
│   └── presentation/
│       ├── views/
│       ├── widgets/
│       └── view_model/
└── main.dart
```

This structure follows **Clean Architecture** principles to separate:

* Presentation
* Business logic
* Data layer

---


## 📸 Screenshots

## splash screen
<img width="1280" height="2856" alt="Screenshot_1773897870" src="https://github.com/user-attachments/assets/ee03ae62-d8e9-4223-8fa6-87ee0d19b909" />
##login as guest screen
<img width="1280" height="2856" alt="Screenshot_1773898255" src="https://github.com/user-attachments/assets/05e81ae5-9845-4bda-8868-d7c8e76907cb" />
##login screen 
<img width="1280" height="2856" alt="Screenshot_1773898330" src="https://github.com/user-attachments/assets/9760878c-6a23-4d47-8157-4d3fc981f4a8" />
##sign up screen
<img width="1280" height="2856" alt="Screenshot_1773898365" src="https://github.com/user-attachments/assets/7d9ca330-8849-4538-a485-79cd0f431a01" />
## Home screen
<img width="1280" height="2856" alt="Screenshot_1773897238" src="https://github.com/user-attachments/assets/bfcb74c0-c96d-4963-98be-0fcbbcebf155" />
## Details screen
<img width="1280" height="2856" alt="Screenshot_1773897314" src="https://github.com/user-attachments/assets/fc1d9d0f-327a-4efb-93ab-b87fc07eda7e" />
## cart screen
<img width="1280" height="2856" alt="Screenshot_1773897387" src="https://github.com/user-attachments/assets/89bbb86d-e62c-4bc6-bb4d-ad24237f47d3" />
## order summer screen
<img width="1280" height="2856" alt="Screenshot_1773897409" src="https://github.com/user-attachments/assets/ea47201e-3b04-4564-8abf-cd7ff62c304f" />
## stripe screen
<img width="1280" height="2856" alt="Screenshot_1773897477" src="https://github.com/user-attachments/assets/e9a49836-558e-4348-bc05-4545f05d9731" />
## fav screen
<img width="1280" height="2856" alt="Screenshot_1773897585" src="https://github.com/user-attachments/assets/b0001bb3-cb77-4323-a4e5-3baaecf3df5d" />
## order history screen
<img width="1280" height="2856" alt="Screenshot_1773897620" src="https://github.com/user-attachments/assets/9856cdd9-7145-4da9-860b-c5ecc275f592" />
## setting screen
<img width="1280" height="2856" alt="Screenshot_1773897647" src="https://github.com/user-attachments/assets/d98514b3-ffb5-4438-a5f2-5ef887d4fc57" />
## about us screen
<img width="1280" height="2856" alt="Screenshot_1773897675" src="https://github.com/user-attachments/assets/b1a4b248-2239-4ab1-8240-3e5fa9158385" />
## contact us
> 📌 ضع الصور داخل
<img width="1280" height="2856" alt="Screenshot_1773897707" src="https://github.com/user-attachments/assets/1d9130d7-e43a-43c5-a024-b625ca079524" />
## profile screen
<img width="1280" height="2856" alt="Screenshot_1773897828" src="https://github.com/user-attachments/assets/2dbdd96b-4035-4ced-a2bf-f97e0df8c930" />


