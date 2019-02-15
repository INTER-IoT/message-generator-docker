#!/bin/bash
rm -rf environment
mkdir -p environment

. config.env

SSL=${SSL_CONFIG}/certs
CFG=environment/generator.env

CKS=client/default-kafka-client.keystore.jks
CTS=client/default-kafka-client.truststore.jks

if ([ -e ${SSL}/${CKS} ] && [ -e ${SSL}/${CTS} ])
then
    if [ -e ${CFG} ]
    then
        rm ${CFG}
    fi
    . ${SSL_CONFIG}/config.env
    . scripts/environment.sh
    . scripts/initialize-volume.sh
cat << EOF

IPSM docker compose configuration created successfully.

    Usage: docker-compose up  -d

EOF

else
    . scripts/missing-config.sh
fi
