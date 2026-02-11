# Al-Jazari Industries - Spring Boot Backend

Complete REST API backend for Al-Jazari Industries CMS with JWT authentication, file uploads, and full CRUD operations.

## 🎯 Features

### ✅ **Complete REST API**
- **Authentication**: JWT-based authentication
- **CRUD Operations**: Full Create, Read, Update, Delete for all entities
- **File Upload**: Image upload support for products, partners, sectors
- **Admin Panel**: Protected admin endpoints
- **Public API**: Public endpoints for Angular frontend

### ✅ **Entities**
1. **User** - Admin authentication
2. **ProductCategory** - Product categories
3. **Product** - Products with full details
4. **Sector** - Industry sectors
5. **Partner** - Global partnerships
6. **CompanyInfo** - Company information
7. **ContactSubmission** - Contact form submissions

### ✅ **Security**
- JWT token-based authentication
- Role-based access control (ADMIN role)
- Password encryption (BCrypt)
- CORS configuration
- Secure endpoints

### ✅ **Database**
- MySQL (primary)
- PostgreSQL (alternative)
- H2 (development/testing)
- JPA/Hibernate ORM
- Automatic schema generation

---

## 🚀 Quick Start

### Prerequisites
- Java 17 or higher
- Maven 3.6+
- MySQL 8.0+ (or PostgreSQL 14+)

### 1. Database Setup

**MySQL:**
```sql
CREATE DATABASE aljazari_db;
CREATE USER 'aljazari_user'@'localhost' IDENTIFIED BY 'your_secure_password';
GRANT ALL PRIVILEGES ON aljazari_db.* TO 'aljazari_user'@'localhost';
FLUSH PRIVILEGES;
```

**PostgreSQL:**
```sql
CREATE DATABASE aljazari_db;
CREATE USER aljazari_user WITH PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE aljazari_db TO aljazari_user;
```

### 2. Configuration

Edit `src/main/resources/application.properties`:

```properties
# Update database credentials
spring.datasource.username=aljazari_user
spring.datasource.password=your_secure_password

# Update JWT secret (generate a new one for production)
jwt.secret=YOUR_SECRET_KEY_HERE

# Update CORS origins
cors.allowed-origins=http://localhost:4200
```

### 3. Build & Run

```bash
# Build the project
mvn clean install

# Run the application
mvn spring-boot:run

# Or run the JAR
java -jar target/al-jazari-backend-1.0.0.jar
```

The API will be available at: **http://localhost:8080**

---

## 📚 API Endpoints

### 🔐 Authentication

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| POST | `/api/auth/login` | Login and get JWT token | Public |
| GET | `/api/auth/validate` | Validate JWT token | Authenticated |

**Login Request:**
```json
{
  "username": "admin",
  "password": "admin123"
}
```

**Login Response:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "type": "Bearer",
  "id": 1,
  "username": "admin",
  "email": "admin@aljazari.com",
  "roles": ["ROLE_ADMIN"]
}
```

### 📦 Product Categories

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/public/product-categories` | Get all active categories |
| GET | `/api/public/product-categories/{categoryId}` | Get category by ID |

#### Admin Endpoints (Requires Authentication)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/product-categories` | Get all categories (including inactive) |
| GET | `/api/admin/product-categories/{id}` | Get category by database ID |
| POST | `/api/admin/product-categories` | Create new category |
| PUT | `/api/admin/product-categories/{id}` | Update category |
| DELETE | `/api/admin/product-categories/{id}` | Delete category |

**Create/Update Request:**
```json
{
  "categoryId": "ventilation-solutions",
  "name": "Ventilation Solutions",
  "description": "Industrial ventilation systems",
  "longDescription": "Complete ventilation solutions...",
  "icon": "🌬️",
  "image": "/uploads/products/ventilation.jpg",
  "keyFeatures": [
    "Energy-efficient systems",
    "Custom solutions"
  ],
  "displayOrder": 1,
  "active": true
}
```

### 🏭 Products

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/public/products` | Get all active products |
| GET | `/api/public/products/featured` | Get featured products |
| GET | `/api/public/products/category/{categoryId}` | Get products by category |
| GET | `/api/public/products/{slug}` | Get product by slug |

#### Admin Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/products` | Get all products |
| GET | `/api/admin/products/{id}` | Get product by ID |
| POST | `/api/admin/products` | Create new product |
| PUT | `/api/admin/products/{id}` | Update product |
| DELETE | `/api/admin/products/{id}` | Delete product |

### 🏢 Sectors

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/public/sectors` | Get all active sectors |
| GET | `/api/public/sectors/{slug}` | Get sector by slug |

#### Admin Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/sectors` | Get all sectors |
| GET | `/api/admin/sectors/{id}` | Get sector by ID |
| POST | `/api/admin/sectors` | Create new sector |
| PUT | `/api/admin/sectors/{id}` | Update sector |
| DELETE | `/api/admin/sectors/{id}` | Delete sector |

### 🤝 Partners

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/public/partners` | Get all active partners |
| GET | `/api/public/partners/featured` | Get featured partners |
| GET | `/api/public/partners/{slug}` | Get partner by slug |

#### Admin Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/partners` | Get all partners |
| GET | `/api/admin/partners/{id}` | Get partner by ID |
| POST | `/api/admin/partners` | Create new partner |
| PUT | `/api/admin/partners/{id}` | Update partner |
| DELETE | `/api/admin/partners/{id}` | Delete partner |

### ℹ️ Company Info

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/public/company-info` | Get active company information |

#### Admin Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/company-info` | Get all company info |
| GET | `/api/admin/company-info/{id}` | Get company info by ID |
| POST | `/api/admin/company-info` | Create company info |
| PUT | `/api/admin/company-info/{id}` | Update company info |
| DELETE | `/api/admin/company-info/{id}` | Delete company info |

### 📧 Contact Submissions

#### Public Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/public/contact/submit` | Submit contact form |



#### Admin Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/contact-submissions` | Get all submissions |
| GET | `/api/admin/contact-submissions/{id}` | Get submission by ID |
| GET | `/api/admin/contact-submissions/status/{status}` | Get by status |
| PUT | `/api/admin/contact-submissions/{id}/status` | Update status |
| DELETE | `/api/admin/contact-submissions/{id}` | Delete submission |

### 📁 File Upload

| Method | Endpoint | Description | Access |
|--------|----------|-------------|--------|
| POST | `/api/admin/files/upload` | Upload image file | Admin |

**Upload Request (multipart/form-data):**
- `file`: Image file
- `category`: Folder name (products, sectors, partners, logo)

**Upload Response:**
```json
{
  "fileName": "ventilation-system.jpg",
  "fileUrl": "http://localhost:8080/uploads/products/uuid_ventilation-system.jpg",
  "fileType": "image/jpeg",
  "size": 245678
}
```



## 📂 Project Structure

```
src/main/java/com/aljazari/
├── config/              # Configuration classes
│   ├── SecurityConfig.java
│   ├── CorsConfig.java
│   ├── JpaConfig.java
│   └── FileStorageConfig.java
├── controller/          # REST Controllers
│   ├── AuthController.java
│   ├── FileUploadController.java
│   ├── ProductCategoryPublicController.java
│   ├── ProductCategoryAdminController.java
│   ├── ProductPublicController.java
│   ├── ProductAdminController.java
│   ├── SectorPublicController.java
│   ├── SectorAdminController.java
│   ├── PartnerPublicController.java
│   ├── PartnerAdminController.java
│   ├── CompanyInfoPublicController.java
│   ├── CompanyInfoAdminController.java
│   ├── ContactSubmissionPublicController.java
│   └── ContactSubmissionAdminController.java
├── dto/                 # Data Transfer Objects
│   ├── LoginRequest.java
│   ├── JwtResponse.java
│   ├── MessageResponse.java
│   └── FileUploadResponse.java
├── entity/              # JPA Entities
│   ├── BaseEntity.java
│   ├── User.java
│   ├── ProductCategory.java
│   ├── Product.java
│   ├── Sector.java
│   ├── Partner.java
│   ├── CompanyInfo.java
│   └── ContactSubmission.java
├── repository/          # JPA Repositories
│   ├── UserRepository.java
│   ├── ProductCategoryRepository.java
│   ├── ProductRepository.java
│   ├── SectorRepository.java
│   ├── PartnerRepository.java
│   ├── CompanyInfoRepository.java
│   └── ContactSubmissionRepository.java
├── service/             # Business Logic
│   ├── AuthService.java
│   ├── FileStorageService.java
│   ├── ProductCategoryService.java
│   ├── ProductService.java
│   ├── SectorService.java
│   ├── PartnerService.java
│   ├── CompanyInfoService.java
│   └── ContactSubmissionService.java
├── security/            # Security & JWT
│   ├── JwtUtils.java
│   ├── JwtAuthenticationFilter.java
│   ├── UserDetailsImpl.java
│   └── UserDetailsServiceImpl.java
├── exception/           # Exception Handling
│   ├── ResourceNotFoundException.java
│   ├── FileStorageException.java
│   └── GlobalExceptionHandler.java
└── AlJazariBackendApplication.java
```

---

## 🔧 Configuration

### Database Configuration

**MySQL (Production):**
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/aljazari_db
spring.datasource.username=aljazari_user
spring.datasource.password=your_password
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
```

**PostgreSQL:**
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/aljazari_db
spring.datasource.username=postgres
spring.datasource.password=your_password
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
```

**H2 (Development):**
```properties
spring.datasource.url=jdbc:h2:mem:aljazari_db
spring.datasource.driver-class-name=org.h2.Driver
spring.h2.console.enabled=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.H2Dialect
```




### CORS

```properties
cors.allowed-origins=http://localhost:4200,https://yourdomain.com
cors.allowed-methods=GET,POST,PUT,DELETE,OPTIONS
cors.allowed-headers=*
cors.allow-credentials=true
```

---

## 🧪 Testing with cURL

### Login
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
```

### Get Products (Public)
```bash
curl http://localhost:8080/api/public/products
```

### Create Product (Admin)
```bash
curl -X POST http://localhost:8080/api/admin/products \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "category": {"id": 1},
    "title": "Industrial Fan",
    "slug": "industrial-fan",
    "shortDescription": "High-performance industrial fan",
    "features": ["Energy efficient", "Durable"]
  }'
```

### Upload File
```bash
curl -X POST http://localhost:8080/api/admin/files/upload \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -F "file=@image.jpg" \
  -F "category=products"
```

---



Build and run:
```bash
docker build -t aljazari-backend .
docker run -p 8080:8080 aljazari-backend
```

---

## 📝 Creating Default Admin User

Run this SQL after first startup:

```sql
-- Default password: admin123 (BCrypt encoded)
INSERT INTO users (username, email, password, full_name, enabled, active, created_at, updated_at)
VALUES ('admin', 'admin@aljazari.com', 
        '$2a$10$slYQm8Y8XdKYvW3KTtG/z.6KJRJQK6W0i3xBV8C1nt.YLz9pBqxNC',
        'System Administrator', true, true, NOW(), NOW());

INSERT INTO user_roles (user_id, role)
VALUES (1, 'ROLE_ADMIN');
```





### Database Connection Fails
- Check MySQL/PostgreSQL is running
- Verify username/password
- Check database exists

### File Upload Fails
- Check `uploads` directory exists and is writable
- Verify file size limits
- Check file type is allowed

---

## 📚 Additional Documentation

- **API_INTEGRATION.md** - Guide for Angular integration
- **DEPLOYMENT_GUIDE.md** - Production deployment
- **SECURITY_GUIDE.md** - Security best practices



**Built with Spring Boot 3.2, Java 17, and ❤️**
