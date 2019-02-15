#!/bin/bash
cat <<EOF >environment/generator.env
#---------------------------------------------------------------------
# KAFKA server configuration variables - should work as is
#---------------------------------------------------------------------
IPSM_KAFKA_HOST=${IPSM_KAFKA_HOST}
IPSM_KAFKA_PORT=${IPSM_KAFKA_PORT}
#---------------------------------------------------------------------
# SSL configuration variables - should work as is
#---------------------------------------------------------------------
IPSM_KAFKA_CLIENT_KEYSTORE_LOCATION=/certs/default-kafka-client.keystore.jks
IPSM_KAFKA_CLIENT_KEYSTORE_PASSWORD=${CLIENT_PASS}
IPSM_KAFKA_CLIENT_TRUSTSTORE_LOCATION=/certs/default-kafka-client.truststore.jks
IPSM_KAFKA_CLIENT_TRUSTSTORE_PASSWORD=${CLIENT_PASS}
IPSM_KAFKA_CLIENT_KEY_PASSWORD=${CLIENT_PASS}
EOF
