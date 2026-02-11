# Al-Jazari Industries - Quick Reference Guide

## 🚀 Quick Start Commands

### Initial Setup
```bash
# Install Angular CLI globally
npm install -g @angular/cli

# Create new Angular project
ng new al-jazari-industries --routing --style=scss --skip-tests

# Navigate to project
cd al-jazari-industries

# Install dependencies
npm install

# Start development server
ng serve --open
```

### Development Commands
```bash
# Serve app (default port 4200)
ng serve

# Serve with specific port
ng serve --port 4300

# Serve and open browser
ng serve --open

# Serve with AOT compilation
ng serve --aot

# Build for development
ng build

# Build for production
ng build --configuration production

# Run linting
ng lint

# Format code with Prettier (if installed)
npm run format

# Generate component
ng generate component pages/home

# Generate service
ng generate service core/services/products

# Generate module
ng generate module pages/products --routing
```

---

## 📂 Project Structure Quick Reference

```
al-jazari-industries/
├── src/
│   ├── app/
│   │   ├── core/              # Services, models, guards
│   │   ├── shared/            # Reusable components
│   │   ├── layout/            # Layout components
│   │   ├── pages/             # Feature modules
│   │   ├── app.component.*    # Root component
│   │   └── app.routes.ts      # Main routing
│   ├── assets/
│   │   ├── images/
│   │   ├── icons/
│   │   └── data/
│   ├── styles/
│   │   ├── _variables.scss
│   │   ├── _mixins.scss
│   │   └── styles.scss
│   └── environments/
├── angular.json
├── package.json
└── tsconfig.json
```

---

## 🎨 SCSS Quick Reference

### Using Variables
```scss
@import 'src/styles/variables';

.my-component {
  color: $primary-blue;
  padding: $spacing-md;
  font-family: $font-primary;
}
```

### Using Mixins
```scss
@import 'src/styles/mixins';

.my-section {
  @include section-spacing;
  @include container;
  
  @include respond-to(md) {
    padding: $spacing-xl;
  }
}

.my-button {
  @include button-primary;
}
```

### Common Patterns
```scss
// Card with hover effect
.card {
  @include card;
}

// Flex centering
.centered {
  @include flex-center;
}

// Responsive typography
.heading {
  @include heading-2;
}

// Line clamping
.description {
  @include line-clamp(3);
}
```

---

## 🔧 Angular Component Patterns

### Component with Service
```typescript
import { Component, OnInit } from '@angular/core';
import { ProductsService } from '../../core/services/products.service';
import { Product } from '../../core/models/product.model';

@Component({
  selector: 'app-products-list',
  templateUrl: './products-list.component.html',
  styleUrls: ['./products-list.component.scss']
})
export class ProductsListComponent implements OnInit {
  products: Product[] = [];
  loading = true;
  error: string | null = null;

  constructor(private productsService: ProductsService) {}

  ngOnInit(): void {
    this.loadProducts();
  }

  loadProducts(): void {
    this.productsService.getProducts().subscribe({
      next: (data) => {
        this.products = data;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load products';
        this.loading = false;
        console.error(err);
      }
    });
  }
}
```

### Component Template Pattern
```html
<!-- Loading State -->
<div *ngIf="loading" class="loading">
  <div class="spinner"></div>
</div>

<!-- Error State -->
<div *ngIf="error" class="error-message">
  {{ error }}
</div>

<!-- Content -->
<div *ngIf="!loading && !error" class="content">
  <div class="products-grid">
    <app-product-card 
      *ngFor="let product of products"
      [product]="product"
      (cardClicked)="onProductClick($event)">
    </app-product-card>
  </div>
</div>
```

---

## 🛣️ Routing Patterns

### Basic Navigation
```html
<!-- Link to route -->
<a routerLink="/products">Products</a>

<!-- Link with parameters -->
<a [routerLink]="['/products', product.category]">View Details</a>

<!-- Active link styling -->
<a routerLink="/about" routerLinkActive="active">About</a>
```

### Programmatic Navigation
```typescript
constructor(private router: Router) {}

navigateToProduct(productId: string): void {
  this.router.navigate(['/products', productId]);
}

navigateWithQueryParams(): void {
  this.router.navigate(['/products'], {
    queryParams: { category: 'ventilation', sort: 'name' }
  });
}
```

### Route Parameters
```typescript
import { ActivatedRoute } from '@angular/router';

constructor(private route: ActivatedRoute) {}

ngOnInit(): void {
  // Get route parameter
  this.route.params.subscribe(params => {
    const category = params['category'];
    this.loadProductsByCategory(category);
  });

  // Get query parameters
  this.route.queryParams.subscribe(params => {
    const sort = params['sort'];
    const filter = params['filter'];
  });
}
```

---

## 📝 Forms Quick Reference

### Reactive Form Setup
```typescript
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

export class ContactComponent implements OnInit {
  contactForm: FormGroup;

  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {
    this.contactForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(2)]],
      email: ['', [Validators.required, Validators.email]],
      message: ['', [Validators.required, Validators.minLength(10)]]
    });
  }

  onSubmit(): void {
    if (this.contactForm.valid) {
      const formData = this.contactForm.value;
      // Process form data
      this.contactForm.reset();
    }
  }

  // Getters for validation
  get name() { return this.contactForm.get('name'); }
  get email() { return this.contactForm.get('email'); }
  get message() { return this.contactForm.get('message'); }
}
```

### Form Template
```html
<form [formGroup]="contactForm" (ngSubmit)="onSubmit()">
  <div class="form-group">
    <label for="name">Name</label>
    <input 
      id="name" 
      type="text" 
      formControlName="name"
      [class.invalid]="name?.invalid && name?.touched">
    
    <div *ngIf="name?.invalid && name?.touched" class="error">
      <span *ngIf="name?.errors?.['required']">Name is required</span>
      <span *ngIf="name?.errors?.['minlength']">Name must be at least 2 characters</span>
    </div>
  </div>

  <button type="submit" [disabled]="contactForm.invalid">
    Submit
  </button>
</form>
```

---

## 🎯 Common TypeScript Patterns

### Service with Observable
```typescript
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'assets/data/products.json';

  constructor(private http: HttpClient) {}

  getData(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl).pipe(
      map(data => data.filter(item => item.active)),
      catchError(this.handleError<any[]>('getData', []))
    );
  }

  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(`${operation} failed:`, error);
      return of(result as T);
    };
  }
}
```

### Interface/Model Pattern
```typescript
export interface Product {
  id: string;
  title: string;
  description: string;
  price?: number;
  active: boolean;
}

export enum ProductCategory {
  VENTILATION = 'ventilation',
  EXTRACTION = 'extraction',
  FILTRATION = 'filtration'
}

export class ProductModel implements Product {
  constructor(
    public id: string,
    public title: string,
    public description: string,
    public active: boolean = true,
    public price?: number
  ) {}

  get displayPrice(): string {
    return this.price ? `$${this.price.toFixed(2)}` : 'Contact for price';
  }
}
```

---

## 🐛 Common Issues & Solutions

### Issue: Component not found
**Solution:**
```bash
# Make sure component is declared in module
ng generate component pages/home --module=pages/home/home.module
```

### Issue: Module not found error
**Solution:**
```typescript
// Check import path
import { Component } from '@angular/core'; // ✓ Correct
import { Component } from 'angular/core';  // ✗ Wrong
```

### Issue: Style not applying
**Solution:**
```scss
// Make sure to import in component
@import 'src/styles/variables'; // ✓ Correct path

// Or check if using :host
:host {
  display: block;
}
```

### Issue: Router not working
**Solution:**
```typescript
// Make sure RouterModule is imported
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [RouterModule.forChild(routes)]
})
```

### Issue: Form not submitting
**Solution:**
```html
<!-- Make sure form has submit handler -->
<form (ngSubmit)="onSubmit()">
  <!-- Not (click) on button -->
  <button type="submit">Submit</button>
</form>
```

---

## 🎨 Design System Quick Access

### Colors
```scss
$primary-blue: #1E3A8A;
$secondary-teal: #0D9488;
$accent-orange: #EA580C;
$dark-gray: #1F2937;
$medium-gray: #6B7280;
$light-gray: #F3F4F6;
```

### Spacing Scale
```scss
$spacing-xs: 0.5rem;   // 8px
$spacing-sm: 1rem;     // 16px
$spacing-md: 1.5rem;   // 24px
$spacing-lg: 2rem;     // 32px
$spacing-xl: 3rem;     // 48px
$spacing-2xl: 4rem;    // 64px
$spacing-3xl: 6rem;    // 96px
```

### Typography Scale
```scss
$font-xs: 0.75rem;    // 12px
$font-sm: 0.875rem;   // 14px
$font-base: 1rem;     // 16px
$font-lg: 1.125rem;   // 18px
$font-xl: 1.25rem;    // 20px
$font-2xl: 1.5rem;    // 24px
$font-3xl: 1.875rem;  // 30px
$font-4xl: 2.25rem;   // 36px
$font-5xl: 3rem;      // 48px
```

### Breakpoints
```scss
$breakpoint-sm: 640px;   // Mobile
$breakpoint-md: 768px;   // Tablet
$breakpoint-lg: 1024px;  // Desktop
$breakpoint-xl: 1280px;  // Large Desktop
```

---

## 📦 Package.json Scripts

### Common Scripts
```json
{
  "scripts": {
    "start": "ng serve",
    "build": "ng build",
    "build:prod": "ng build --configuration production",
    "watch": "ng build --watch --configuration development",
    "lint": "ng lint",
    "format": "prettier --write \"src/**/*.{ts,html,scss}\"",
    "analyze": "ng build --configuration production --stats-json && webpack-bundle-analyzer dist/al-jazari-industries/stats.json"
  }
}
```

---

## 🔍 Debugging Tips

### Enable Source Maps
```json
// angular.json
{
  "configurations": {
    "development": {
      "sourceMap": true
    }
  }
}
```

### Console Logging
```typescript
// Component debugging
ngOnInit(): void {
  console.log('Component initialized');
  console.log('Data:', this.data);
}

// Service debugging
getData(): Observable<any[]> {
  return this.http.get<any[]>(this.apiUrl).pipe(
    tap(data => console.log('Received data:', data)),
    catchError(error => {
      console.error('Error:', error);
      return of([]);
    })
  );
}
```

### Angular DevTools
1. Install Angular DevTools Chrome extension
2. Open Chrome DevTools
3. Navigate to Angular tab
4. Inspect component tree and change detection

---

## 📱 Mobile Development Tips

### Testing on Mobile Device
```bash
# Find your local IP
ipconfig getifaddr en0  # macOS
ifconfig | grep inet    # Linux
ipconfig               # Windows

# Serve with host flag
ng serve --host 0.0.0.0

# Access from mobile
# http://YOUR_LOCAL_IP:4200
```

### Responsive Testing
```scss
// Mobile-first approach
.component {
  // Mobile styles (default)
  padding: 1rem;
  
  // Tablet
  @include respond-to(md) {
    padding: 2rem;
  }
  
  // Desktop
  @include respond-to(lg) {
    padding: 3rem;
  }
}
```

---

## ⚡ Performance Tips

### Lazy Loading
```typescript
// Lazy load modules
const routes: Routes = [
  {
    path: 'products',
    loadChildren: () => import('./pages/products/products.module')
      .then(m => m.ProductsModule)
  }
];
```

### OnPush Change Detection
```typescript
@Component({
  selector: 'app-product-card',
  templateUrl: './product-card.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class ProductCardComponent {}
```

### Track By Function
```html
<div *ngFor="let item of items; trackBy: trackById">
  {{ item.name }}
</div>
```

```typescript
trackById(index: number, item: any): any {
  return item.id;
}
```

---

## 🔐 Security Best Practices

### Sanitize User Input
```typescript
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

constructor(private sanitizer: DomSanitizer) {}

getSafeHtml(html: string): SafeHtml {
  return this.sanitizer.sanitize(SecurityContext.HTML, html);
}
```

### Avoid innerHTML
```html
<!-- ✗ Avoid -->
<div [innerHTML]="userContent"></div>

<!-- ✓ Better -->
<div>{{ userContent }}</div>
```

### Environment Variables
```typescript
// Never commit sensitive data
export const environment = {
  production: true,
  apiKey: 'USE_ENV_VARIABLES', // Don't hardcode
  apiUrl: 'https://api.example.com'
};
```

---

## 📚 Useful Resources

### Official Documentation
- Angular Docs: https://angular.io/docs
- Angular CLI: https://angular.io/cli
- RxJS: https://rxjs.dev/

### Learning Resources
- Angular University: https://angular-university.io/
- Angular In Depth: https://indepth.dev/angular
- Stack Overflow: Tag `angular`

### Tools
- Angular DevTools: Chrome/Firefox Extension
- Augury: Angular debugging tool
- Compodoc: Documentation generator

### Community
- Angular Blog: https://blog.angular.io/
- Angular Discord: https://discord.gg/angular
- Reddit: r/Angular2

---

## 🎯 Interview Preparation Topics

### Core Concepts
- Component lifecycle hooks
- Services and Dependency Injection
- Routing and Navigation
- Forms (Template-driven vs Reactive)
- HTTP Client and Observables
- Directives (Structural and Attribute)
- Pipes (Built-in and Custom)

### Advanced Topics
- Change Detection strategies
- Lazy loading modules
- Guards (CanActivate, CanDeactivate)
- Interceptors
- RxJS operators
- State management (if using NgRx)

### Best Practices
- Project structure organization
- Component communication patterns
- Error handling
- Performance optimization
- Security considerations

---

## ✅ Daily Development Checklist

### Before Starting
- [ ] Pull latest changes from git
- [ ] Check for dependency updates
- [ ] Review tasks for the day

### During Development
- [ ] Write clean, readable code
- [ ] Follow naming conventions
- [ ] Add comments for complex logic
- [ ] Test features as you build
- [ ] Commit regularly with clear messages

### Before Committing
- [ ] Run linter
- [ ] Test all functionality
- [ ] Check responsive design
- [ ] Review console for errors
- [ ] Update documentation if needed

---

*Quick Reference Version: 1.0*  
*Last Updated: January 2024*
