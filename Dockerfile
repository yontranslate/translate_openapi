FROM google/dart

RUN apt-get update && apt-get install -y git

WORKDIR /app
ADD pubspec.* /app/
ADD dart_pkgs/ /app/dart_pkgs
RUN pub get --no-precompile
ADD . /app/
RUN pub get --offline --no-precompile

WORKDIR /app
EXPOSE 80

ENTRYPOINT ["pub", "run", "aqueduct:aqueduct", "serve", "--port", "80"]