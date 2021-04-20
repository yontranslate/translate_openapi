FROM google/dart

WORKDIR /app
ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ADD pubspec.* /app/
ADD dart_pkgs/ /app/dart_pkgs
RUN pub get --no-precompile
ADD . /app/
RUN pub get --offline --no-precompile

WORKDIR /app
EXPOSE 8080

ENTRYPOINT ["dart", "bin/server.dart"]