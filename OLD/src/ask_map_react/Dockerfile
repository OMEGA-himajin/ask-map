# Dockerfile
FROM node:20-alpine

WORKDIR /app

# パッケージ関連ファイルをコピー
COPY package*.json ./

# 依存関係のインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# 開発用ポートの公開
EXPOSE 3000

# 開発サーバーの起動
CMD ["npm", "start"]