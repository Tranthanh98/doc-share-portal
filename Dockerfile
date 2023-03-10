FROM quay.io/keycloak/keycloak:latest as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# ENV KC_HTTPS_CERTIFICATE_FILE=./server.crt
# ENV KC_HTTPS_CERTIFICATE_KEY_FILE=./server.key
# Configure a database vendor
ENV KC_DB=dev-file

WORKDIR /opt/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:server,IP:127.0.0.1" -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# change these values to point to a running postgres instance
# ENV KC_DB=mssql
# ENV KC_DB_URL=<DBURL>
# ENV KC_DB_USERNAME=<DBUSERNAME>
# ENV KC_DB_PASSWORD=<DBPASSWORD>
ENV KC_HOSTNAME=https://doc-share-portal.herokuapp.com/
# RUN ["/opt/keycloak/bin/kc.sh", "start-dev"]
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# RUN ["/opt/keycloak/bin/kc.bat", "start"]

# RUN ["bin/kc.bat"]