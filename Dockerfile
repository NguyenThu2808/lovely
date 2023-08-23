# Sử dụng ảnh cơ sở Ruby
FROM ruby:2.7.4

# Cài đặt các phần mềm cần thiết
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép Gemfile và Gemfile.lock vào thư mục làm việc
COPY Gemfile Gemfile.lock ./

# Cài đặt các gem của ứng dụng
RUN bundle install

# Sao chép toàn bộ mã nguồn ứng dụng vào thư mục làm việc
COPY . .

# Mở cổng 3000 để ứng dụng có thể truy cập
EXPOSE 3000

# Khởi chạy ứng dụng Rails khi container được khởi động
CMD ["rails", "server", "-b", "0.0.0.0"]
