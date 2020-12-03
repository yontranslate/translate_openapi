FROM google/dart

WORKDIR /app
ADD pubspec.* /app/
ADD dart_pkgs/ /app/dart_pkgs
RUN export PUB_HOSTED_URL=https://pub.flutter-io.cn && pub get --no-precompile
ADD . /app/
RUN pub get --offline --no-precompile

WORKDIR /app
EXPOSE 80

ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "80"]