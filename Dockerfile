# =========================
# ЭТАП 1: СБОРКА ПРИЛОЖЕНИЯ
# =========================
FROM node:24-alpine AS builder

WORKDIR /app

# Копируем файлы зависимостей
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем исходный код
COPY . .

# Собираем production-версию
RUN npm run build


# =========================
# ЭТАП 2: PRODUCTION
# =========================
FROM nginx:alpine

# Копируем результат сборки Vite в Nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Открываем порт 80
EXPOSE 80