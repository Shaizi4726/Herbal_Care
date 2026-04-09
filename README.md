# 🌿 Herbal Care — Full-Stack E-Commerce Platform

A complete, production-ready e-commerce web application built with **Laravel (PHP)**, **JavaScript**, **Bootstrap**, and **Blade** templating. Developed for a herbal products client over 5 months as a collaborative team project.

---

## 🚀 Features

### Customer-Facing
- 🛍️ **Product Catalog** — browse by category, subcategory, and brand with image support
- 🔍 **Product Detail Pages** — full product info, reviews, and comments
- 🛒 **Shopping Cart** — add, update, and remove items
- ❤️ **Wishlist** — save products for later
- 💳 **Checkout** — form validation, order confirmation popup, and loader
- 📦 **Order Management** — track orders, view order detail, cancel/return with OTP verification
- 🔐 **Authentication** — register, login, email verification with middleware
- 📝 **Blog** — content section for herbal articles
- 📄 **Static Pages** — About Us, Contact, FAQ, Privacy Policy, Terms & Conditions

### Admin Panel
- 📊 **Dashboard** — overview and notifications
- 🗂️ **Category Management** — categories, subcategories
- 📦 **Product Management** — add/edit products with image upload, packaging details
- 🏷️ **Brand Management**
- 🎠 **Banner Management**
- 🛒 **Order Management** — view, process, and manage all orders
- 👥 **User Management**
- ⭐ **Reviews & Comments** — moderation panel
- 🎟️ **Coupon Management**
- 🌍 **Location Management** — countries, states, cities
- ⚙️ **Settings**

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Backend | PHP / Laravel |
| Frontend | JavaScript, Bootstrap, Blade Templates |
| Database | MySQL (via Laravel Eloquent ORM) |
| Auth | Laravel Auth + Email Verification Middleware |
| OTP | SMS/Email OTP for order cancel/return |
| Version Control | Git / GitHub |
| CI/CD | GitHub Actions |

---

## 📁 Project Structure

```
├── app/                  # Controllers, Models, Middleware
├── resources/
│   └── views/
│       ├── admin/        # Admin panel views
│       │   ├── product/  # Product management
│       │   ├── order/    # Order management
│       │   ├── category/ # Category & subcategory
│       │   ├── users/    # User management
│       │   ├── coupon/   # Coupon management
│       │   └── ...
│       ├── main/         # Customer-facing views
│       │   ├── pages/    # Shop, cart, checkout, orders, wishlist...
│       │   ├── layouts/  # Shared layouts
│       │   └── blogs/    # Blog section
│       ├── auth/         # Login, register, email verify
│       └── emails/       # Email templates
├── routes/               # Web & API routes
├── database/             # Migrations & seeders
└── public/               # Assets
```

---

## ⚙️ Local Setup

```bash
# Clone the repository
git clone https://github.com/Shaizi4726/Herbal_Care.git
cd Herbal_Care

# Install PHP dependencies
composer install

# Install JS dependencies
npm install && npm run dev

# Set up environment
cp .env.example .env
php artisan key:generate

# Run migrations
php artisan migrate --seed

# Start the server
php artisan serve
```

---

## 👥 Team

| Developer | Role |
|-----------|------|
| [Malik Shahzad](https://github.com/Shaizi4726) | Full-Stack (Frontend + Backend) |
| [MdZafarAqbal](https://github.com/MdZafarAqbal) | Full-Stack (Frontend + Backend) |

---

## 📌 Project Status

The application was fully developed and ready for deployment. The project was not launched publicly due to the client/investor withdrawing before the go-live stage. The codebase represents a complete, functional e-commerce platform.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
