#!/bin/bash

curl -fsSL https://get.docker.com | sh && git clone https://github.com/Gozargah/Marzban-node 
cat << EOF > /root/Marzban-node/docker-compose.yml
services:
  marzban-node:
    # build: .
    image: gozargah/marzban-node:latest
    restart: always
    network_mode: host

    environment:
      SERVICE_PORT: 62050
      XRAY_API_PORT: 62051
      SSL_CLIENT_CERT_FILE: "/var/lib/marzban-node/ssl_client_cert.pem"
      SERVICE_PROTOCOL: "rest"
      
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
EOF
mkdir -p /var/lib/marzban-node
cat << EOF > /var/lib/marzban-node/ssl_client_cert.pem
-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwNTIxMTk0MTA0WhgPMjEyNDA0MjcxOTQxMDRaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA3hDGhCQuUv29
Jno2Wyy2eKvOYlM8kLW+1QnE8/2fi3zRSINgKuU0m1HuTpYFOswRcO+I2QsAMfDY
E8gEpElY00yvEnVudKZWdgANmAladmcU1bVLUXMCxkLKRsu3kePUI2nhnT4W7z1M
fuQk7QnPue3E/q6kh/ugAINbatBPvdwcoSPdwECHYa7T7/bRIOdcJhS6xudtNzAw
cRHpUj810x+MRPm1+9iWmk1Z155al/t9mt51K8hBnVMmm34OLp+JIxBH3/T47aK6
Q33B5rMsVO+NSfcKY5Dh59+mODWDCfndgiaagzPyae9kFWlSiVEaVAsQV0dpcBfP
+a4GQp/h5QtZysgF4V4S6V+d1MIho26Jixoow7VjULry7RIDX/5laxb36rfdUL3S
hU18YjGEU+33eeMzmfIo6JuikiT6VqTd7IjZze47mGwcKNYbMfMu6hLKF8Ep7/hm
ba9656rfEyATkQKp2C/EhGaVuSz5kbDKhFculkkJqlLXk6/g8VoPtwmjdDQZY+Gg
6kqrpD9e1xxMCf1ByS6CEFWBy+TYPsgjAHaVrUXno7ZE+duZWLqkbntN5CrVYM0K
KvAwf5kD66K4I68c/JGInDssNVTu1LcmOKlw/Pc0tBcYVJIj4iFI26V+l5V75tyi
1RkBrtoMoEzqsJGRUmtNmLMofsYEfFsCAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
OtUSFiet9q5WZql88SF3ulWvXAm4oR0DokoRTEBWjLnMJJzmNkRM3UVJ/Uo0sLKw
ucB0kSpH65dyQJm3wY9cLMDr+II7A/qj6WGUj+9OUU8Y9mcCYYbgMxOFhiZUqu7R
2TYSBIIU+3VZKeBrS2mx8dp1WwfxxhQSDXYShx5ZdFlghtKDGR+0tzjltqY/jBGf
pcd5b+uWlL9UlYShkievTneRzaS6Z4Qp7WP2mC0h8WnpHqij8xD3PXeVxb8TFyEB
yIv1fMk+wnDyubH3IOvsu0ms4HAlWnnyjDwc1Mz5Nu7PWtPxF+vMMUDIUfmUS5kr
Bn6ruElrt9MUHiURdVx4CHGa1HNVx0wzg3mo9QYhSrUUAMkaeweZzAZz7KNzqHlZ
RN3SoOUf5Ok1UPtXgOtKlV6B3qyvhSPKqPnEbuWnxzhiNPpmbyYWUO93ODcf8Ait
nWPQuWZ7K7BOHujBJgwdjoht8w8w1hAqIPvAV5roYauxx67sgNJJxWuLmX+ZfZTP
sxnVxyQi4VFr09be081rZeajmuynMqcwET/FbJX2cPhYx1UvW6WrXNLBC9jLSqXr
nVqgc1uDRcELn3io0sRfy8mQoY1U3Vrx/qgcyp/JiJWDJCOUrit9CKRlEYN4NgVE
sKpYSQ4P5M/ehnLNYhl4TG64vmTFQpuVuOadfoM0JG8=
-----END CERTIFICATE-----
EOF

cd /root/Marzban-node  && docker compose up -d
