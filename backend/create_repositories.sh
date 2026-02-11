#!/bin/bash

REPO_DIR="/home/claude/al-jazari-backend/src/main/java/com/aljazari/repository"

# UserRepository
cat > $REPO_DIR/UserRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByEmail(String email);
    Boolean existsByUsername(String username);
    Boolean existsByEmail(String email);
}
EOF

# ProductCategoryRepository
cat > $REPO_DIR/ProductCategoryRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Long> {
    Optional<ProductCategory> findByCategoryId(String categoryId);
    List<ProductCategory> findByActiveOrderByDisplayOrderAsc(Boolean active);
    Boolean existsByCategoryId(String categoryId);
}
EOF

# ProductRepository
cat > $REPO_DIR/ProductRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.Product;
import com.aljazari.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findBySlug(String slug);
    List<Product> findByCategoryAndActiveOrderByDisplayOrderAsc(ProductCategory category, Boolean active);
    List<Product> findByActiveOrderByDisplayOrderAsc(Boolean active);
    List<Product> findByFeaturedAndActiveOrderByDisplayOrderAsc(Boolean featured, Boolean active);
    Boolean existsBySlug(String slug);
}
EOF

# SectorRepository
cat > $REPO_DIR/SectorRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.Sector;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SectorRepository extends JpaRepository<Sector, Long> {
    Optional<Sector> findBySlug(String slug);
    List<Sector> findByActiveOrderByDisplayOrderAsc(Boolean active);
    Boolean existsBySlug(String slug);
}
EOF

# PartnerRepository
cat > $REPO_DIR/PartnerRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.Partner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PartnerRepository extends JpaRepository<Partner, Long> {
    Optional<Partner> findBySlug(String slug);
    List<Partner> findByActiveOrderByDisplayOrderAsc(Boolean active);
    List<Partner> findByFeaturedAndActiveOrderByDisplayOrderAsc(Boolean featured, Boolean active);
    Boolean existsBySlug(String slug);
}
EOF

# CompanyInfoRepository
cat > $REPO_DIR/CompanyInfoRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.CompanyInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CompanyInfoRepository extends JpaRepository<CompanyInfo, Long> {
    Optional<CompanyInfo> findFirstByActiveOrderByIdDesc(Boolean active);
}
EOF

# ContactSubmissionRepository
cat > $REPO_DIR/ContactSubmissionRepository.java << 'EOF'
package com.aljazari.repository;

import com.aljazari.entity.ContactSubmission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactSubmissionRepository extends JpaRepository<ContactSubmission, Long> {
    List<ContactSubmission> findByStatusOrderByCreatedAtDesc(ContactSubmission.SubmissionStatus status);
    List<ContactSubmission> findAllByOrderByCreatedAtDesc();
}
EOF

echo "✅ All repositories created"
