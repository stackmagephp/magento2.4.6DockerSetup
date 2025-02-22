# Magento 2 Docker Setup

This Docker setup allows you to run **Magento 2** locally using **NGINX**, **PHP 8.2**, **MySQL 8**, **Elasticsearch 7.9.3**, and **PHPMyAdmin**.

---

## 📝 **Table of Contents**
1. [Prerequisites](#prerequisites)
2. [Directory Structure](#directory-structure)
3. [Getting Started](#getting-started)
4. [Docker Services](#docker-services)
5. [Magento Installation](#magento-installation)
6. [Host Entry](#host-entry)
7. [Useful Commands](#useful-commands)
8. [Common Issues](#common-issues)
9. [License](#license)

---

## ✅ **Prerequisites**
Ensure the following tools are installed on your system:
- **Docker**
- **Docker Compose**

To install:
```bash
sudo apt update
sudo apt install -y docker.io docker-compose
```

Verify installation:
```bash
docker --version
docker-compose --version
```

---

## 📂 **Directory Structure**
```plaintext
magento245
├── setup               # Magento source code
├── sites-available     # NGINX configuration files
├── cli
│   └── php.ini         # PHP CLI configuration
├── fpm
│   └── php.ini         # PHP-FPM configuration
└── init.sh             # Initialization script
```

---

## 🚀 **Getting Started**

1. Clone Magento 2 source code into the `setup` folder:
```bash
git clone https://github.com/magento/magento2.git setup
```
2. Ensure that the `setup` folder is located in the root directory alongside the `docker-compose.yml` file.
3. Verify that all files and folders are accessible by Docker.
4. Start Docker services:
```bash
docker-compose up -d
```

---

## 📦 **Docker Services**
- **m_web245**: NGINX + PHP 8.2 container
- **magento_ce_db245**: MySQL 8 database container
- **phpmyadmin245**: PHPMyAdmin for database management
- **elasticsearch_245_7_9**: Elasticsearch 7.9.3 for search functionality

Ports:
- Magento: **http://mage246demo.com**
- PHPMyAdmin: **http://localhost:8080**
- Elasticsearch: **http://localhost:9200**

---

## 🛠️ **Magento Installation**

1. Access the container:
```bash
docker exec -it m_web245 bash
```

2. Run Magento installation:
```bash
bin/magento setup:install \\
  --base-url=http://mage246demo.com \\
  --db-host=magento_ce_db245 \\
  --db-name=magento \\
  --db-user=root \\
  --db-password=root \\
  --admin-firstname=Admin \\
  --admin-lastname=User \\
  --admin-email=admin@example.com \\
  --admin-user=admin \\
  --admin-password=admin123 \\
  --language=en_US \\
  --currency=INR \\
  --timezone=Asia/Kolkata \\
  --use-rewrites=1
```

3. Generate static content:
```bash
bin/magento setup:static-content:deploy -f
```

4. Flush cache:
```bash
bin/magento cache:flush
```

5. Fix permissions:
```bash
chmod -R 777 /var/www/html
```

---

## 🌐 **Host Entry**

To view the Magento website in your browser, add the following host entry to your system:
```bash
sudo nano /etc/hosts
```

Add this line at the end of the file:
```plaintext
127.0.0.1   mage246demo.com
```

Save and exit. Now, you can access Magento at **http://mage246demo.com**.

---

## 💡 **Useful Commands**

- Start Docker services:
```bash
docker-compose up -d
```

- Stop Docker services:
```bash
docker-compose down
```

- View running containers:
```bash
docker ps
```

- Check logs:
```bash
docker logs m_web245
```

- Restart a container:
```bash
docker restart m_web245
```

---

## ⚠️ **Common Issues**

**1. MySQL connection failed:**
```bash
docker logs magento_ce_db245
```

**2. Permission denied:**
```bash
chmod -R 777 setup
```

**3. Magento installation stuck:**
```bash
docker restart m_web245
```

---

## 📜 **License**
This setup is for development purposes only. Use it at your own risk.

---

**Now you're ready to build and customize your Magento 2 store locally using Docker! 🛒🔥**
