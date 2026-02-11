Perfect 👌 I’ll keep it professional but more natural and less “corporate-heavy”.

You can copy this updated version:

---

# Industrial B2B Platform – Full Stack Project

This is a full-stack B2B platform built with **Angular 17** and **Spring Boot 3.2**.
It includes authentication with JWT, role-based access control, file uploads, and full CRUD operations.

The goal of this project was to build something close to a real-world production system, with clean architecture and proper separation between frontend and backend.

<img width="1905" height="920" alt="image" src="https://github.com/user-attachments/assets/a753e29f-9d8c-4665-89fc-29e99e993ba1" />

---

## 🏗️ How It Works

```
Frontend (Angular 17)
        ↓
REST API (Spring Boot 3.2)
        ↓
MySQL / PostgreSQL
```

* The frontend communicates with the backend through REST APIs
* Authentication is handled using JWT
* Admin and public roles are separated
* Images and files can be uploaded and stored
* The project follows a modular and scalable structure

---

## 🚀 Tech Stack

### Frontend

* Angular 17 (Standalone Components)
* TypeScript
* SCSS
* Reactive Forms
* Lazy Loading
* REST API integration

### Backend

* Java 17
* Spring Boot 3.2
* Spring Security
* JWT Authentication
* JPA / Hibernate
* MySQL / PostgreSQL
* Maven
* GitHub Actions (CI/CD ready)

---

## 📦 Project Structure (Monorepo)

```
industrial-b2b-platform/
│
├── frontend/                # Angular app
│   ├── src/app/
│   ├── angular.json
│   └── package.json
│
├── backend/                 # Spring Boot API
│   ├── src/main/java/
│   ├── pom.xml
│   └── application.properties
│
├── docker-compose.yml
└── README.md
```

---

## ✨ Main Features

### 🔐 Authentication & Security

* JWT-based login system
* Role-based access (Admin / Public)
* Encrypted passwords using BCrypt
* Protected admin endpoints
* CORS configuration

---

### 📦 Product Management

* Create, update, delete, and list products
* Manage categories
* Featured products
* SEO-friendly slug routing

---

### 🏭 Sector Management

* Manage industry sectors
* Separate public and admin views
* Dynamic content handling

---

### 🤝 Partner Management

* Add and manage partners
* Featured partners section
* Public/admin separation

---

### 📧 Contact System

* Public contact form
* Store submissions in database
* Admin can update submission status

---

### 📁 File Upload

* Upload images
* Organized storage by category
* File validation
* Unique file name generation

---

## 🔑 API Example

### Public Endpoints

```
GET   /api/public/products
GET   /api/public/sectors
GET   /api/public/partners
POST  /api/public/contact
```

### Admin Endpoints

```
POST   /api/auth/login
POST   /api/admin/products
PUT    /api/admin/products/{id}
DELETE /api/admin/products/{id}
```

Authorization header:

```
Authorization: Bearer <JWT_TOKEN>
```




## 🔒 Security Setup

* Spring Security configuration
* Custom JWT filter
* UserDetailsService implementation
* Role-based endpoint protection
* Global exception handling

---

## 🗄️ Database Design

<img width="1920" height="1030" alt="image" src="https://github.com/user-attachments/assets/6b8a38c2-d59a-4f5d-a80a-7a46211b2c60" />

Main entities:

* User
* ProductCategory
* Product
* Sector
* Partner
* CompanyInfo
* ContactSubmission

Relationships are handled using JPA/Hibernate.

---

## 📸 Screenshots

<img width="1917" height="927" alt="image" src="https://github.com/user-attachments/assets/8c25d639-21da-445f-b857-ae3104ab1790" />
<img width="1896" height="924" alt="image" src="https://github.com/user-attachments/assets/65c79ee7-51c5-4474-8753-deb58b32ea37" />
<img width="1888" height="908" alt="image" src="https://github.com/user-attachments/assets/8eaecd37-28b9-42e8-85fd-1aa9b4c14675" />
<img width="1856" height="942" alt="image" src="https://github.com/user-attachments/assets/f8989a7b-ce04-4792-8b7c-217a72df0524" />

---

## 🎯 What This Project Shows

* Clean layered backend architecture
* Controller → Service → Repository pattern
* Secure REST API design
* Angular reactive frontend integration
* Full authentication flow
* Real full-stack integration
* Production-style structure

---

## 🧠 What I Learned

* How to implement JWT authentication end-to-end
* Designing scalable REST APIs
* Connecting Angular with a secured backend
* Handling file uploads and static resources
* Applying role-based authorization
* Structuring a maintainable full-stack application

---
